
script stars 
	printf "*******************************************************"
	printf "*******************************************************"
	printf "*******************************************************"
	printf "*******************************************************"
	printf "*******************************************************"
endscript
musicvolume = 0
musicstreamvolume = 100
cutscenestreamvolume = 100
ambienttracknum = 0
forceambientsfxtomusicvolume = 0
musicvoloutsidebox = 30.0
FadeTempMusicVol = 30.0
InsideAdjacentReverbBox01 = 0
InsideAdjacentReverbBox02 = 0
InsideAdjacentReverbBox03 = 0
CheckForPedStreamExistence = 0
PauseOneshotsCheck = 0
terrainmudthreshold = 0.5
interiorpanningradius = 5
global_user_sfx_number = 10
skaterlandingsoundrangemin = 1.0
skaterlandingsoundrangemax = 20.0
skaterlandingsounddsprangemin = 10.0
skaterlandingsounddsprangemax = 50.0
temp_language_hack = lang_english
weatherbussminvol = 0
weatherbussmaxvol = 100
weatherbussfadeintime = 2
weatherbussfadeouttime = 2
WP_BRIDGE_TRAIN_FLAG = 0
CARVE_FLAG_ON = 0
WP_BRIDGE_TRAIN_SFX_ON = 1
cutscene_volume = {
	C_H1_BigPush_outro = 80
	C_C1_CUTSCENE_2 = 80
}
Camera_High_Pass = {
	effect = highpass
	name = CameraHighPass
	cutoff = 10
}
Grind_High_Pass1 = {
	effect = highpass
	name = GrindHighPass1
	cutoff = 10
}
Echo_Lands = {
	effect = echo
	name = landsecho
	delay = 200
	decayratio = 0.15
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.0
}
echo_generic_outside_slap = {
	effect = echo
	name = ingameecho1
	delay = 176
	decayratio = 0.1
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.1
}
reverb_generic_outside_verb = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -2000.0
	roomrollofffactor = 10.0
	decaytime = 1.3
	decayhfratio = 0.5
	reflectionslevel = -5000.0
	reflectionsdelay = 0.088
	reverblevel = -5000.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Slums_Alley = {
	effect = echo
	name = ingameecho1
	delay = 125
	decayratio = 0.15
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.27
}
Reverb_Slums_Alley = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -1300.0
	roomrollofffactor = 1.0
	decaytime = 1.4
	decayhfratio = 0.5
	reflectionslevel = -1500.0
	reflectionsdelay = 0.0
	reverblevel = -2000.0
	reverbdelay = 0.1
	diffusion = 90.0
	density = 100.0
	hfreference = 4000.0
}
Echo_Slums_BuildingTop = {
	effect = echo
	name = ingameecho1
	delay = 400
	decayratio = 0.1
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.3
}
Reverb_Slums_BuildingTop = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -2000.0
	roomrollofffactor = 10.0
	decaytime = 1.3
	decayhfratio = 0.5
	reflectionslevel = -6000.0
	reflectionsdelay = 0.088
	reverblevel = -6000.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_BW_On_Bridge = {
	effect = echo
	name = ingameecho1
	delay = 400
	decayratio = 0.1
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.27
}
Reverb_BW_On_Bridge = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -2000.0
	roomrollofffactor = 10.0
	decaytime = 1.3
	decayhfratio = 0.5
	reflectionslevel = -6000.0
	reflectionsdelay = 0.088
	reverblevel = -6000.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
echo_skater_garage_settings = {
	effect = echo
	name = ingameecho1
	delay = 76
	decayratio = 0.1
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.15
}
reverb_skater_garage_settings = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 0.5
	decayhfratio = 0.5
	reflectionslevel = -1200.0
	reflectionsdelay = 0.0
	reverblevel = -600.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
echo_school_courtyard = {
	effect = echo
	name = ingameecho1
	delay = 205
	decayratio = 0.22
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.2
}
reverb_school_courtyard = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -2000.0
	roomrollofffactor = 10.0
	decaytime = 2.6
	decayhfratio = 0.9
	reflectionslevel = -2000.0
	reflectionsdelay = 0.103
	reverblevel = -1400.0
	reverbdelay = 0.0
	diffusion = 95.0
	density = 1000.0
	hfreference = 5000.0
}
echo_long_narrow_alley = {
	effect = echo
	name = ingameecho1
	delay = 60
	decayratio = 0.27
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.26
}
reverb_long_narrow_alley = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -1200.0
	roomrollofffactor = 5.0
	decaytime = 1.3
	decayhfratio = 0.5
	reflectionslevel = -800.0
	reflectionsdelay = 0.0
	reverblevel = -1200.0
	reverbdelay = 0.1
	diffusion = 90.0
	density = 100.0
	hfreference = 7000.0
}
echo_long_narrow_alley_02 = {
	effect = echo
	name = ingameecho1
	delay = 125
	decayratio = 0.15
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.3
}
reverb_long_narrow_alley_02 = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -1300.0
	roomrollofffactor = 1.0
	decaytime = 1.4
	decayhfratio = 0.5
	reflectionslevel = -1000.0
	reflectionsdelay = 0.0
	reverblevel = -1500.0
	reverbdelay = 0.1
	diffusion = 90.0
	density = 100.0
	hfreference = 4000.0
}
echo_school_sides = {
	effect = echo
	name = ingameecho1
	delay = 100
	decayratio = 0.25
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.21000001
}
reverb_school_sides = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -1200.0
	roomrollofffactor = 8.0
	decaytime = 2.1
	decayhfratio = 0.8
	reflectionslevel = -1000.0
	reflectionsdelay = 0.0
	reverblevel = -1500.0
	reverbdelay = 0.0
	diffusion = 95.0
	density = 80.0
	hfreference = 5000.0
}
echo_main_street = {
	effect = echo
	name = ingameecho1
	delay = 150
	decayratio = 0.22
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.2
}
reverb_main_street = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -2000.0
	roomrollofffactor = 10.0
	decaytime = 1.4
	decayhfratio = 0.9
	reflectionslevel = -2800.0
	reflectionsdelay = 0.066
	reverblevel = -2500.0
	reverbdelay = 0.0
	diffusion = 95.0
	density = 1000.0
	hfreference = 5000.0
}
echo_sewer_pipe = {
	effect = echo
	name = ingameecho1
	delay = 56
	decayratio = 0.3
	maxchannels = 6
	drymix = 1.0
	wetmix = 1.0
}
reverb_sewer_pipe = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.3
	roomhf = -2000.0
	roomrollofffactor = 8.0
	decaytime = 1.3
	decayhfratio = 0.9
	reflectionslevel = 0.0
	reflectionsdelay = 0.0
	reverblevel = -900.0
	reverbdelay = 0.1
	diffusion = 75.0
	density = 80.0
	hfreference = 8000.0
}
echo_factory_int = {
	effect = echo
	name = ingameecho1
	delay = 206
	decayratio = 0.25
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.120000005
}
reverb_factory_int = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -400.0
	roomrollofffactor = 10.0
	decaytime = 2.2
	decayhfratio = 0.9
	reflectionslevel = -1000.0
	reflectionsdelay = 0.0
	reverblevel = -300.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 4000.0
}
Echo_Harbor_Pool_Area = {
	effect = echo
	name = ingameecho1
	delay = 111
	decayratio = 0.120000005
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.25
}
Reverb_Harbor_Pool_Area = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 1.5
	decayhfratio = 0.5
	reflectionslevel = -1800.0
	reflectionsdelay = 0.0
	reverblevel = -2300.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Outdoor_Overhang = {
	effect = echo
	name = ingameecho1
	delay = 206
	decayratio = 0.3
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.15
}
Reverb_Outdoor_Overhang = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -2000.0
	roomrollofffactor = 10.0
	decaytime = 2.6
	decayhfratio = 0.9
	reflectionslevel = -2200.0
	reflectionsdelay = 0.103
	reverblevel = -1500.0
	reverbdelay = 0.0
	diffusion = 95.0
	density = 1000.0
	hfreference = 5000.0
}
Echo_Museum_INT = {
	effect = echo
	name = ingameecho1
	delay = 350
	decayratio = 0.25
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.15
}
Reverb_Museum_INT = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -400.0
	roomrollofffactor = 10.0
	decaytime = 3.0
	decayhfratio = 1.0
	reflectionslevel = -1000.0
	reflectionsdelay = 0.0
	reverblevel = 0.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 3000.0
}
Echo_Moon = {
	effect = echo
	name = ingameecho1
	delay = 300
	decayratio = 0.1
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.1
}
Reverb_Moon = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 2.0
	decayhfratio = 1.0
	reflectionslevel = -1000.0
	reflectionsdelay = 0.0
	reverblevel = 0.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Museum_Stairs = {
	effect = echo
	name = ingameecho1
	delay = 120
	decayratio = 0.1
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.15
}
Reverb_Museum_Stairs = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 600.0
	roomrollofffactor = 10.0
	decaytime = 1.0
	decayhfratio = 2.0
	reflectionslevel = -10000.0
	reflectionsdelay = 0.15
	reverblevel = -500.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Museums_Tunnel = {
	effect = echo
	name = ingameecho1
	delay = 100
	decayratio = 0.2
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.4
}
Reverb_Museums_Tunnel = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = -150.0
	roomhf = -1800.0
	roomrollofffactor = 2.0
	decaytime = 2.5
	decayhfratio = 0.9
	reflectionslevel = -800.0
	reflectionsdelay = 0.05
	reverblevel = 100.0
	reverbdelay = 0.01
	diffusion = 100.0
	density = 95.0
	hfreference = 5000.0
}
Echo_Museums_Tunnel2 = {
	effect = echo
	name = ingameecho1
	delay = 100
	decayratio = 0.2
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.4
}
Reverb_Museums_Tunnel2 = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = -150.0
	roomhf = -1800.0
	roomrollofffactor = 2.0
	decaytime = 2.5
	decayhfratio = 0.9
	reflectionslevel = -800.0
	reflectionsdelay = 0.05
	reverblevel = 100.0
	reverbdelay = 0.01
	diffusion = 100.0
	density = 95.0
	hfreference = 5000.0
}
Echo_Museums_Overpass = {
	effect = echo
	name = ingameecho1
	delay = 200
	decayratio = 0.2
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.25
}
Reverb_Museums_Overpass = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = -150.0
	roomhf = -1800.0
	roomrollofffactor = 2.0
	decaytime = 2.8
	decayhfratio = 0.9
	reflectionslevel = -800.0
	reflectionsdelay = 0.05
	reverblevel = -300.0
	reverbdelay = 0.01
	diffusion = 100.0
	density = 95.0
	hfreference = 5000.0
}
Echo_Harbor_Overhang = {
	effect = echo
	name = ingameecho1
	delay = 200
	decayratio = 0.2
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.25
}
Reverb_Harbor_Overhang = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = -150.0
	roomhf = -1800.0
	roomrollofffactor = 2.0
	decaytime = 2.8
	decayhfratio = 0.9
	reflectionslevel = -800.0
	reflectionsdelay = 0.05
	reverblevel = -1200.0
	reverbdelay = 0.01
	diffusion = 100.0
	density = 95.0
	hfreference = 5000.0
}
Echo_Museums_Corners = {
	effect = echo
	name = ingameecho1
	delay = 275
	decayratio = 0.120000005
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.35000002
}
Reverb_Museums_Corners = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 1.5
	decayhfratio = 0.5
	reflectionslevel = -1500.0
	reflectionsdelay = 0.0
	reverblevel = -1000.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Monuments_Corners = {
	effect = echo
	name = ingameecho1
	delay = 275
	decayratio = 0.120000005
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.3
}
Reverb_Monuments_Corners = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 1.5
	decayhfratio = 0.5
	reflectionslevel = -1500.0
	reflectionsdelay = 0.0
	reverblevel = -1500.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Monuments_Water_Area = {
	effect = echo
	name = ingameecho1
	delay = 275
	decayratio = 0.120000005
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.35000002
}
Reverb_Monuments_Water_Area = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 1.5
	decayhfratio = 0.5
	reflectionslevel = -1500.0
	reflectionsdelay = 0.0
	reverblevel = -1000.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Monuments_Roof = {
	effect = echo
	name = ingameecho1
	delay = 350
	decayratio = 0.120000005
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.3
}
Reverb_Monuments_Roof = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -2000.0
	roomrollofffactor = 10.0
	decaytime = 1.3
	decayhfratio = 0.5
	reflectionslevel = -6000.0
	reflectionsdelay = 0.088
	reverblevel = -6000.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Monuments_Dome = {
	effect = echo
	name = ingameecho1
	delay = 120
	decayratio = 0.1
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.15
}
Reverb_Monuments_Dome = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 600.0
	roomrollofffactor = 10.0
	decaytime = 1.0
	decayhfratio = 2.0
	reflectionslevel = -10000.0
	reflectionsdelay = 0.15
	reverblevel = -500.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Monuments_Alleyway = {
	effect = echo
	name = ingameecho1
	delay = 100
	decayratio = 0.15
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.3
}
Reverb_Monuments_Alleyway = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -1300.0
	roomrollofffactor = 1.0
	decaytime = 1.4
	decayhfratio = 0.5
	reflectionslevel = -1000.0
	reflectionsdelay = 0.0
	reverblevel = -1200.0
	reverbdelay = 0.1
	diffusion = 90.0
	density = 100.0
	hfreference = 4000.0
}
Echo_Monuments_Archway = {
	effect = echo
	name = ingameecho1
	delay = 200
	decayratio = 0.2
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.25
}
Reverb_Monuments_Archway = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = -150.0
	roomhf = -1800.0
	roomrollofffactor = 2.0
	decaytime = 2.8
	decayhfratio = 0.9
	reflectionslevel = -800.0
	reflectionsdelay = 0.05
	reverblevel = -300.0
	reverbdelay = 0.01
	diffusion = 100.0
	density = 95.0
	hfreference = 5000.0
}
Echo_Monuments_Building = {
	effect = echo
	name = ingameecho1
	delay = 175
	decayratio = 0.2
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.18
}
Reverb_Monuments_Building = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = -150.0
	roomhf = -1800.0
	roomrollofffactor = 2.0
	decaytime = 1.5
	decayhfratio = 0.9
	reflectionslevel = -1000.0
	reflectionsdelay = 0.05
	reverblevel = -600.0
	reverbdelay = 0.01
	diffusion = 100.0
	density = 95.0
	hfreference = 5000.0
}
Echo_WP_Bridge_Tunnel = {
	effect = echo
	name = ingameecho1
	delay = 100
	decayratio = 0.2
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.4
}
Reverb_WP_Bridge_Tunnel = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = -150.0
	roomhf = -1800.0
	roomrollofffactor = 2.0
	decaytime = 2.5
	decayhfratio = 0.9
	reflectionslevel = -800.0
	reflectionsdelay = 0.05
	reverblevel = 100.0
	reverbdelay = 0.01
	diffusion = 100.0
	density = 95.0
	hfreference = 5000.0
}
Echo_WP_Bridge_Glass = {
	effect = echo
	name = ingameecho1
	delay = 300
	decayratio = 0.1
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.120000005
}
Reverb_WP_Bridge_Glass = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 2.5
	decayhfratio = 0.8
	reflectionslevel = -1200.0
	reflectionsdelay = 0.0
	reverblevel = -300.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_WP_Bridge_Entry = {
	effect = echo
	name = ingameecho1
	delay = 170
	decayratio = 0.2
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.25
}
Reverb_WP_Bridge_Entry = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = -150.0
	roomhf = -1800.0
	roomrollofffactor = 2.0
	decaytime = 2.5
	decayhfratio = 0.9
	reflectionslevel = -600.0
	reflectionsdelay = 0.05
	reverblevel = -100.0
	reverbdelay = 0.01
	diffusion = 100.0
	density = 95.0
	hfreference = 5000.0
}
Echo_PB_Inside_Boat = {
	effect = echo
	name = ingameecho1
	delay = 150
	decayratio = 0.1
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.25
}
Reverb_PB_Inside_Boat = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 600.0
	roomrollofffactor = 10.0
	decaytime = 1.5
	decayhfratio = 2.0
	reflectionslevel = -10000.0
	reflectionsdelay = 0.05
	reverblevel = -1600.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_PB_Bridge_underground = {
	effect = echo
	name = ingameecho1
	delay = 206
	decayratio = 0.25
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.120000005
}
Reverb_PB_Bridge_underground = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -400.0
	roomrollofffactor = 10.0
	decaytime = 2.2
	decayhfratio = 0.9
	reflectionslevel = -1000.0
	reflectionsdelay = 0.0
	reverblevel = -300.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 4000.0
}
Echo_Lansdowne_Houses = {
	effect = echo
	name = ingameecho1
	delay = 200
	decayratio = 0.22
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.22
}
Reverb_Lansdowne_Houses = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -2000.0
	roomrollofffactor = 10.0
	decaytime = 2.5
	decayhfratio = 0.9
	reflectionslevel = -2800.0
	reflectionsdelay = 0.066
	reverblevel = -3000.0
	reverbdelay = 0.0
	diffusion = 95.0
	density = 1000.0
	hfreference = 5000.0
}
Echo_Lansdowne_Skate_Area = {
	effect = echo
	name = ingameecho1
	delay = 250
	decayratio = 0.25
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.2
}
Reverb_Lansdowne_Skate_Area = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -2300.0
	roomrollofffactor = 8.0
	decaytime = 2.5
	decayhfratio = 0.9
	reflectionslevel = -2000.0
	reflectionsdelay = 0.06
	reverblevel = -3000.0
	reverbdelay = 0.0
	diffusion = 80.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Lansdowne_Tunnel = {
	effect = echo
	name = ingameecho1
	delay = 100
	decayratio = 0.2
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.4
}
Reverb_Lansdowne_Tunnel = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = -150.0
	roomhf = -1800.0
	roomrollofffactor = 2.0
	decaytime = 1.8
	decayhfratio = 0.9
	reflectionslevel = -800.0
	reflectionsdelay = 0.05
	reverblevel = -500.0
	reverbdelay = 0.01
	diffusion = 100.0
	density = 95.0
	hfreference = 5000.0
}
Echo_Lansdowne_Bowls = {
	effect = echo
	name = ingameecho1
	delay = 135
	decayratio = 0.120000005
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.2
}
Reverb_Lansdowne_Bowls = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 1.5
	decayhfratio = 0.5
	reflectionslevel = -3000.0
	reflectionsdelay = 0.0
	reverblevel = -4000.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_OutdoorSkatePools = {
	effect = echo
	name = ingameecho1
	delay = 125
	decayratio = 0.120000005
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.2
}
Reverb_OutdoorSkatePools = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 1.5
	decayhfratio = 0.5
	reflectionslevel = -1500.0
	reflectionsdelay = 0.0
	reverblevel = -1000.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_OutdoorSkatePools_Deep = {
	effect = echo
	name = ingameecho1
	delay = 111
	decayratio = 0.120000005
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.2
}
Reverb_OutdoorSkatePools_Deep = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 1.5
	decayhfratio = 0.5
	reflectionslevel = -1500.0
	reflectionsdelay = 0.0
	reverblevel = -500.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_Rocket = {
	effect = echo
	name = ingameecho1
	delay = 150
	decayratio = 0.5
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.5
}
Reverb_Rocket = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.3
	roomhf = -2000.0
	roomrollofffactor = 8.0
	decaytime = 1.3
	decayhfratio = 0.9
	reflectionslevel = -100.0
	reflectionsdelay = 0.0
	reverblevel = -300.0
	reverbdelay = 0.1
	diffusion = 75.0
	density = 80.0
	hfreference = 8000.0
}
Echo_Truck_Trailer = {
	effect = echo
	name = ingameecho1
	delay = 60
	decayratio = 0.3
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.6
}
Reverb_Truck_Trailer = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.3
	roomhf = -2000.0
	roomrollofffactor = 8.0
	decaytime = 1.3
	decayhfratio = 0.9
	reflectionslevel = -200.0
	reflectionsdelay = 0.0
	reverblevel = -1000.0
	reverbdelay = 0.1
	diffusion = 75.0
	density = 80.0
	hfreference = 8000.0
}
Echo_Slums_Crusher = {
	effect = echo
	name = ingameecho1
	delay = 60
	decayratio = 0.3
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.5
}
Reverb_Slums_Crusher = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.3
	roomhf = -2000.0
	roomrollofffactor = 8.0
	decaytime = 1.2
	decayhfratio = 0.9
	reflectionslevel = -800.0
	reflectionsdelay = 0.0
	reverblevel = -1800.0
	reverbdelay = 0.1
	diffusion = 75.0
	density = 80.0
	hfreference = 8000.0
}
Echo_FDR_Under_Highway = {
	effect = echo
	name = ingameecho1
	delay = 300
	decayratio = 0.1
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.18
}
Reverb_FDR_Under_Highway = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = 0.0
	roomrollofffactor = 10.0
	decaytime = 2.0
	decayhfratio = 0.8
	reflectionslevel = -1800.0
	reflectionsdelay = 0.0
	reverblevel = -3000.0
	reverbdelay = 0.04
	diffusion = 100.0
	density = 100.0
	hfreference = 5000.0
}
Echo_FDR_Skate_Area = {
	effect = echo
	name = ingameecho1
	delay = 220
	decayratio = 0.25
	maxchannels = 6
	drymix = 1.0
	wetmix = 0.2
}
Reverb_FDR_Skate_Area = {
	effect = sfxreverb
	name = ingamereverb1
	drylevel = 0.0
	room = 0.0
	roomhf = -2300.0
	roomrollofffactor = 8.0
	decaytime = 1.5
	decayhfratio = 0.9
	reflectionslevel = -1000.0
	reflectionsdelay = 0.06
	reverblevel = -1000.0
	reverbdelay = 0.0
	diffusion = 80.0
	density = 100.0
	hfreference = 5000.0
}

script IGC_audioparams_start 
	printpushpopdebuginfo \{push
		name = "IGC_audioparams_start"}
	pushsoundbussparams
	setsoundbussparams \{$Cutscenes_No_Music_BussSet
		time = 0.5}
	wait \{0.6
		seconds}
	if NOT (PauseOneshotsCheck = 1)
		change \{PauseOneshotsCheck = 1}
	endif
	pausesoundsbybuss \{user_music}
	change \{music_disable_track_timer = 1}
	pausesoundsbybuss \{ambience}
endscript

script IGC_audioparams_end 
	if NOT (PauseOneshotsCheck = 0)
		change \{PauseOneshotsCheck = 0}
	endif
	CutsceneUnPauseMusicAndPlaylistTimer
	unpausesoundsbybuss \{ambience}
	printpushpopdebuginfo \{pop
		name = "IGC_audioparams_end"}
	popsoundbussparams
endscript

script Loading_bink_audioparams_start 
	printpushpopdebuginfo \{push
		name = "Loading_bink_audioparams_start"}
	pushsoundbussparams
	setsoundbussparams \{$Loading_Bink_BussSet
		time = 0.5}
	wait \{0.6
		seconds}
	if NOT (PauseOneshotsCheck = 1)
		change \{PauseOneshotsCheck = 1}
	endif
	pausesoundsbybuss \{user_music}
	change \{music_disable_track_timer = 1}
	pausesoundsbybuss \{ambience}
endscript

script Loading_bink_audioparams_end 
	if NOT (PauseOneshotsCheck = 0)
		change \{PauseOneshotsCheck = 0}
	endif
	CutsceneUnPauseMusicAndPlaylistTimer
	unpausesoundsbybuss \{ambience}
	printpushpopdebuginfo \{pop
		name = "Loading_bink_audioparams_end"}
	popsoundbussparams
endscript

script training_vid_audioparams_start 
	printpushpopdebuginfo \{push
		name = "training_vid_audioparams_start"}
	pushsoundbussparams
	setsoundbussparams \{$Training_Binks_BussSet
		time = 0.5}
endscript

script training_vid_audioparams_end 
	printpushpopdebuginfo \{pop
		name = "training_vid_audioparams_end"}
	popsoundbussparams
endscript

script generic_reverb_functionality_script 
	if inside
		if gotparam newechosettings
			if gotparam echofadetime
				setsoundbusseffects effect = <newechosettings> time = <echofadetime>
			else
				setsoundbusseffects effect = <newechosettings>
			endif
		endif
		if gotparam newreverbsettings
			if gotparam reverbfadetime
				setsoundbusseffects effect = <newreverbsettings> time = <reverbfadetime>
			else
				setsoundbusseffects effect = <newreverbsettings>
			endif
		endif
	else
		if gotparam destroyed
		else
			if gotparam created
			else
				if gotparam exitechosettings
					if gotparam exitechofadetime
						setsoundbusseffects effect = <exitechosettings> time = <exitechofadetime>
					else
						setsoundbusseffects effect = <exitechosettings>
					endif
				endif
				if gotparam exitreverbsettings
					if gotparam exitreverbfadetime
						setsoundbusseffects effect = <exitreverbsettings> time = <exitreverbfadetime>
					else
						setsoundbusseffects effect = <exitreverbsettings>
					endif
				endif
			endif
		endif
	endif
endscript

script Generic_HighPass_Functionality_Script \{NewHighPassSettings = $Grind_High_Pass1}
	printstruct <NewHighPassSettings>
	if gotparam \{NewHighPassSettings}
		setsoundbusseffects effect = <NewHighPassSettings> time = 0.1
	endif
endscript

script Camera_HighPass_Functionality_Script \{NewCameraHighPassSettings = $Camera_High_Pass}
	printstruct <NewCameraHighPassSettings>
	if gotparam \{NewCameraHighPassSettings}
		setsoundbusseffects effect = <NewCameraHighPassSettings> time = 0.1
	endif
endscript

script master_sfx_adding_sound_busses 
	createbusssystem \{$busstree}
	setsoundbussparams \{$default_bussset}
	setsoundbussparams \{$default_bussset
		time = 0.5}
	soundbusslock \{user_sfx}
	soundbusslock \{user_music}
	createsoundbusseffects \{ingame = {
			effect = $echo_generic_outside_slap
			effect2 = $reverb_generic_outside_verb
			effect3 = $Camera_High_Pass
		}}
	createsoundbusseffects \{balance = {
			effect = $Grind_High_Pass1
		}}
	createsoundbusseffects \{Lands = {
			effect = $Echo_Lands
		}}
endscript

script PrintDebugSoundBussInfoOnScreen 
endscript

script printpushpopdebuginfo 
	if NOT gotparam push
		if NOT gotparam pop
			printf "Did not specify push or pop!"
			return
		endif
	endif
	if gotparam push
		pushpop = "push"
	else
		pushpop = "pop"
	endif
	if NOT gotparam name
		printf "Did not specify script name!"
		return
	endif
	printf "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= %a %b" a = <name> b = <pushpop>
endscript

script SetThisLevelSoundBanks 
endscript

script LoadPermSFX 
	if (debugsoundfx = 1)
		dumpheaps
	endif
endscript

script PrintfSFX \{message = "You did not pass in a message!"}
	if (debugsoundfx = 1)
		printf "DebugSoundFX: %s" s = <message>
	endif
endscript
global_soundevent_default_priority = 50
global_soundevent_default_buss = `default`
global_soundevent_norepeatfor = 0.1
global_soundevent_instancemanagement = stop_furthest
global_soundevent_instancelimit = 1

script soundevent 
	soundeventfast <...>
endscript

script registersoundevent 
	addsoundeventscript soundevent_eventid = <soundevent_eventid>
	onexitrun deregistersoundevent params = {soundevent_eventid = <soundevent_eventid>}
	<event> <...>
endscript

script deregistersoundevent 
	removesoundeventscript soundevent_eventid = <soundevent_eventid>
endscript

script SafePlaySound 
	if iscreated <obj>
		<obj> :obj_playsound <...>
	endif
endscript
streamprioritylow = 10
streamprioritylowmid = 30
streamprioritymid = 50
streamprioritymidhigh = 70
streampriorityhigh = 90
streampriorityhighest = 95
streamprioritysystem = 109
StreamPriority_VoiceLow = 5
StreamPriority_VoiceNormal = 10
StreamPriority_VoiceDamage = 15
StreamPriority_VoiceDeath = 20
StreamPriority_VoiceMission = 106
StreamPriority_VoiceColton = 90
StreamLogicPriority_VoiceLow = 5
StreamLogicPriority_VoiceNormal = 10
StreamLogicPriority_VoiceDamage = 20
StreamLogicPriority_VoiceFireDamage = 30
StreamLogicPriority_VoiceColton = 39
StreamLogicPriority_VoiceMission = 40
StreamLogicPriority_VoiceDeath = 50
voice_priority_low = {
	stream_priority = StreamPriority_VoiceLow
	logic_priority = StreamLogicPriority_VoiceLow
	logical_death = false
}
voice_priority_normal = {
	stream_priority = StreamPriority_VoiceNormal
	logic_priority = StreamLogicPriority_VoiceNormal
	logical_death = false
}
voice_priority_damage = {
	stream_priority = StreamPriority_VoiceDamage
	logic_priority = StreamLogicPriority_VoiceDamage
	logical_death = false
}
voice_priority_fire_damage = {
	stream_priority = StreamPriority_VoiceDamage
	logic_priority = StreamLogicPriority_VoiceFireDamage
	logical_death = false
}
voice_priority_colton = {
	stream_priority = StreamPriority_VoiceColton
	logic_priority = StreamLogicPriority_VoiceColton
	logical_death = false
}
voice_priority_mission = {
	stream_priority = StreamPriority_VoiceMission
	logic_priority = StreamLogicPriority_VoiceMission
	logical_death = false
}
voice_priority_death = {
	stream_priority = StreamPriority_VoiceDeath
	logic_priority = StreamLogicPriority_VoiceDeath
	logical_death = true
}
voice_priority_colton_death = {
	stream_priority = StreamPriority_VoiceColton
	logic_priority = StreamLogicPriority_VoiceDeath
	logical_death = true
}
focus_mode_buss_set_active = 0

script SK6_SFX_BulletTime_In 
	if (($ntt_soundbuss_active) = 1)
		change ntt_soundbuss_active = 0
		printpushpopdebuginfo pop name = "SK6_SFX_BulletTime_In - ntt_soundbuss_active = 1 "
		popsoundbussparams
	endif
	if (($epicpush_soundbuss_active) = 1)
		change epicpush_soundbuss_active = 0
		printpushpopdebuginfo pop name = "SK6_SFX_BulletTime_In - epicpush_soundbuss_active = 1 "
		popsoundbussparams
	endif
	if NOT (($focus_mode_buss_set_active) = 1)
		change focus_mode_buss_set_active = 1
		printpushpopdebuginfo push name = "SK6_SFX_BulletTime_In"
		pushsoundbussparams
		if ($global_user_sfx_number = 0)
			setsoundbussparams $default_bussset time = 0.5
		else
			setsoundbussparams $Focus_Mode_BussSet time = 0.5
		endif
	endif
	spawnscriptnow sk8_CAS_Focus_Breaths
	stopsound SK8_Focus_Into
	stopsound SK8_Focus_OutOf
	stopsound Focus_In_Front
	stopsound Focus_In_Rears
	playsound Focus_In_Front pitch = 80 vol = 200
	playsound Focus_In_Rears pitch = 80 vol = 200 speakermix = rear
endscript

script SK6_SFX_BulletTime_Out 
	if (($focus_mode_buss_set_active) = 1)
		change \{focus_mode_buss_set_active = 0}
		printpushpopdebuginfo \{pop
			name = "SK6_SFX_BulletTime_Out"}
		popsoundbussparams
	endif
	killspawnedscript \{name = sk8_CAS_Focus_Breaths}
	stopsound \{SK8_Focus_OutOf}
	stopsound \{SK8_Focus_Into}
	playsound \{SK8_Focus_OutOf
		vol = 180}
endscript

script SFX_refresh_music_box_triggers 
endscript

script SFX_Music_Volume_Box_Kill_State 
endscript
Skater_VO_Info = {
	cas_surf = {
		bailgrunt_large = sk9_CAS_YOU_BailLgGrunt
		bailgrunt_small = sk9_CAS_YOU_BailSmGrunt
		bailinitgrunt_small = sk9_CAS_YOU_BailInitSmGrunt
		bailinitgrunt_large = sk9_CAS_YOU_BailInitLgGrunt
	}
	cas_urbn = {
		bailgrunt_large = sk9_CAS_YOU_BailLgGrunt
		bailgrunt_small = sk9_CAS_YOU_BailSmGrunt
		bailinitgrunt_small = sk9_CAS_YOU_BailInitSmGrunt
		bailinitgrunt_large = sk9_CAS_YOU_BailInitLgGrunt
	}
	cas_punk = {
		bailgrunt_large = sk9_CAS_YOU_BailLgGrunt
		bailgrunt_small = sk9_CAS_YOU_BailSmGrunt
		bailinitgrunt_small = sk9_CAS_YOU_BailInitSmGrunt
		bailinitgrunt_large = sk9_CAS_YOU_BailInitLgGrunt
	}
	hawk = {
		bailgrunt_large = sk8_Tony_Bail_Lg_VO
		bailgrunt_small = sk8_tony_Bail_Sm_VO
	}
	Burnquist = {
		bailgrunt_large = sk8_CAS_URBN_BailLgGrunt
		bailgrunt_small = sk8_CAS_URBN_BailSmGrunt
	}
	Dollin = {
		bailgrunt_large = sk8_CAS_PUNK_BailLgGrunt
		bailgrunt_small = sk8_CAS_PUNK_BailSmGrunt
	}
	Huston = {
		bailgrunt_large = sk8_CAS_KID_BailLgGrunt
		bailgrunt_small = sk8_CAS_KID_BailSmGrunt
	}
	Margera = {
		bailgrunt_large = sk8_CAS_SURF_BailLgGrunt
		bailgrunt_small = sk8_CAS_SURF_BailSmGrunt
	}
	mullen = {
		bailgrunt_large = sk8_CAS_SURF_BailLgGrunt
		bailgrunt_small = sk8_CAS_SURF_BailSmGrunt
	}
	Sheckler = {
		bailgrunt_large = sk8_CAS_KID_BailLgGrunt
		bailgrunt_small = sk8_CAS_KID_BailSmGrunt
	}
	song = {
		bailgrunt_large = sk8_CAS_SURF_BailLgGrunt
		bailgrunt_small = sk8_CAS_SURF_BailSmGrunt
	}
	vallely = {
		bailgrunt_large = sk8_CAS_SURF_BailLgGrunt
		bailgrunt_small = sk8_CAS_SURF_BailSmGrunt
	}
	Williams = {
		bailgrunt_large = sk8_CAS_URBN_BailLgGrunt
		bailgrunt_small = sk8_CAS_URBN_BailSmGrunt
	}
	Ped_skater = {
		bailgrunt_large = sk8_CAS_SURF_BailLgGrunt
		bailgrunt_small = sk8_CAS_SURF_BailSmGrunt
	}
}

script sk8_Get_VO_CharacterType 
	if gotparam object
		<object> :getskatername
	else
		getskatername
	endif
	if ((<skatername> = custom_story) || (<skatername> = custom_classic))
		GetCurrentSkaterProfileIndex
		GetSingleSkaterProfileInfo player = <currentskaterprofileindex> character_type
		GetSingleSkaterProfileInfo player = <currentskaterprofileindex> is_pro
		if (<is_pro> = 1)
			GetSingleSkaterProfileInfo player = <currentskaterprofileindex> name
			return {character_type = <name>}
		else
			return {character_type = <character_type>}
		endif
	else
		return {character_type = <skatername>}
	endif
endscript

script sk8_Get_VO 
	if gotparam \{object}
		sk8_Get_VO_CharacterType object = <object>
	else
		sk8_Get_VO_CharacterType
	endif
	if NOT structurecontains structure = ($Skater_VO_Info) <character_type>
		character_type = cas_surf
	endif
	if NOT structurecontains structure = ($Skater_VO_Info.<character_type>) <votype>
		return \{vosound = 0}
	else
		return {vosound = ($Skater_VO_Info.<character_type>.<votype>)}
	endif
endscript

script sk8_Play_VO 
	if gotparam \{object}
		sk8_Get_VO votype = <votype> object = <object>
	else
		sk8_Get_VO votype = <votype>
	endif
	if NOT (<vosound> = 0)
		soundevent event = <vosound>
	endif
endscript

script sk8_CAS_Focus_Breaths 
	sk8_Get_VO_CharacterType object = skater
	switch <character_type>
		case cas_surf
		breathtime = 0.8
		case cas_urbn
		breathtime = 0.8
		case cas_punk
		breathtime = 0.8
		case cas_fem
		breathtime = 0.8
		case cas_kid
		breathtime = 0.8
		default
		breathtime = 0.8
	endswitch
	sk8_Get_VO votype = inhale object = skater
	inhalesound = <vosound>
	sk8_Get_VO votype = exhale object = skater
	exhalesound = <vosound>
	if (<inhalesound> = 0)
		return false
	endif
	if (<exhalesound> = 0)
		return false
	endif
	begin
	if NOT skater :inair
		soundevent event = <inhalesound>
	endif
	wait <breathtime> seconds
	if NOT skater :inair
		soundevent event = <exhalesound>
	endif
	repeat
endscript
Skater_Min_Score_For_Ollie_Grunt = 300

script sk8_cas_ollie_grunts 
	getspeed
	getmultiplier
	if (<multiplier> > 20)
		<multiplier> = 20
	endif
	if (<speed> > 20)
		<speed> = 20
	endif
	VoGruntLevel = ((<speed> / 10) + (<multiplier> / 5))
	casttointeger VoGruntLevel
	if (<VoGruntLevel> > 2)
		VoGruntLevel = 2
	endif
	SkaterGetScoreInfo
	if (<ScorePot> > $Skater_Min_Score_For_Ollie_Grunt)
		if (<VoGruntLevel> = 2)
			sk8_Play_VO votype = olliegrunt_large
		else
			if (<VoGruntLevel> = 1)
				sk8_Play_VO votype = olliegrunt_small
			endif
		endif
	endif
endscript

script sk8_CAS_Land_Grunts 
	getspeed
	getmultiplier
	if (<multiplier> > 20)
		<multiplier> = 20
	endif
	if (<speed> > 20)
		<speed> = 20
	endif
	VoGruntLevel = ((<speed> / 10) + (<multiplier> / 5))
	casttointeger \{VoGruntLevel}
	if (<VoGruntLevel> > 2)
		VoGruntLevel = 2
	endif
	sk8_Play_VO \{votype = landgrunt_large}
endscript

script sk8_CAS_Bail_Small_Grunts 
	wait \{0.2
		seconds}
	sk8_Play_VO \{votype = bailgrunt_small}
endscript

script sk8_CAS_Bail_Large_Grunts 
	wait \{0.2
		seconds}
	sk8_Play_VO \{votype = bailgrunt_large}
endscript

script sk8_CAS_BailInit_Grunts 
	getspeed
	getmultiplier
	if (<multiplier> > 20)
		<multiplier> = 20
	endif
	if (<speed> > 20)
		<speed> = 20
	endif
	VoGruntLevel = ((<speed> / 10) + (<multiplier> / 5))
	casttointeger VoGruntLevel
	if (<VoGruntLevel> > 2)
		VoGruntLevel = 2
	endif
	if (<VoGruntLevel> = 2)
		sk8_Play_VO votype = bailinitgrunt_large
	else
		if (<VoGruntLevel> = 1)
			sk8_Play_VO votype = bailinitgrunt_small
		endif
	endif
endscript

script sk8_cas_bonk_grunts 
	getspeed
	getmultiplier
	if (<multiplier> > 20)
		<multiplier> = 20
	endif
	if (<speed> > 20)
		<speed> = 20
	endif
	VoGruntLevel = ((<speed> / 10) + (<multiplier> / 5))
	casttointeger \{VoGruntLevel}
	if (<VoGruntLevel> > 2)
		VoGruntLevel = 2
	endif
	if (<VoGruntLevel> = 2)
		sk8_CAS_Bail_Large_Grunts
	else
		sk8_CAS_Bail_Small_Grunts
	endif
endscript

script Skater_Speed_Wind_Loop_SFX 
	begin
	skater :getspeed
	if NOT skater :inair
		if (<speed> < 11)
			<speed> = 0
		endif
		if (<speed> > 15)
			<speed> = 15
		endif
		if NOT issoundplaying WindLoop3
			soundevent event = WindLoop_SFX_Skater_Speed
		endif
		updatevol = ((<speed> - 11) * 15)
		setsoundparams WindLoop3 vol = <updatevol>
	else
		if (<speed> < 4)
			<speed> = 4
		endif
		updatevol = (<speed> * 7)
		setsoundparams WindLoop3 vol = <updatevol>
	endif
	wait 1 gameframe
	repeat
endscript

script stat_goal_appear 
	wait \{0.3
		seconds}
	playsound \{ExtraTrick
		vol = 80
		pitch = 199}
endscript
SKUtils_SFX_MainGapSound_struct = {
	default_priority = 95
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = ignore
	instancelimit = 4
}

script SKUtils_SFX_MainGapSound 
	wait \{0.15
		seconds}
	playsound \{SK8_Found_Gap}
	wait \{0.05
		seconds}
	gapsoundpan = 1.0
	begin
	if issoundplaying \{SK8_Found_Gap}
		gapsoundpan = (<gapsoundpan> -0.2)
		if (<gapsoundpan> < -0.9)
			gapsoundpan = -1.0
		endif
		setsoundparams SK8_Found_Gap pan1y = <gapsoundpan> pan2y = <gapsoundpan>
	else
		return
	endif
	wait \{1
		gameframes}
	repeat
endscript
GridControl_SFX_MoveBlock_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0
	instancemanagement = ignore
	instancelimit = 4
}

script GridControl_SFX_MoveBlock 
	if gotparam type
		switch <type>
			case Wood
			RandomNoRepeat (
				@ playsound SK8_Wood_Slide_01 vol = 60
				@ playsound SK8_Wood_Slide_04 vol = 60
				@ playsound SK8_Wood_Slide_05 vol = 60
				)
			case metal
			playsound sk8_metalpole_slideon_02 vol = 60 pitch = RandomRange (95.0, 105.0)
			case Concrete
			RandomNoRepeat (
				@ playsound SK8_Wood_Slide_01 vol = 60
				@ playsound SK8_Wood_Slide_04 vol = 60
				@ playsound SK8_Wood_Slide_05 vol = 60
				)
		endswitch
	endif
endscript
GridControl_SFX_RotateBlock_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 4
}

script GridControl_SFX_RotateBlock 
	if gotparam type
		switch <type>
			case Wood
			playsound SK8_Rotate vol = 25
			RandomNoRepeat (
				@ playsound SK8_Wood_Slide_01 vol = 60 pitch = 130
				@ playsound SK8_Wood_Slide_04 vol = 60 pitch = 130
				@ playsound SK8_Wood_Slide_05 vol = 60 pitch = 130
				)
			case metal
			playsound SK8_Rotate vol = 25
			playsound sk8_metalpole_slideon_02 vol = 60 pitch = RandomRange (95.0, 105.0)
			case Concrete
			playsound SK8_Rotate vol = 25
			RandomNoRepeat (
				@ playsound SK8_Wood_Slide_01 vol = 60 pitch = 130
				@ playsound SK8_Wood_Slide_04 vol = 60 pitch = 130
				@ playsound SK8_Wood_Slide_05 vol = 60 pitch = 130
				)
		endswitch
	endif
endscript
GridControl_SFX_Pickup_Block_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 4
}

script GridControl_SFX_Pickup_Block 
	if gotparam \{type}
		switch <type>
			case Wood
			playsound \{sk8_WoodSolid_SlideOff_01
				vol = 60}
			case metal
			playsound \{sk8_metalpole_grindoff_02
				vol = 60}
			case Concrete
			playsound \{SK8_Cursor_Wood_Select
				vol = 60}
		endswitch
	endif
endscript
GridControl_SFX_SetDown_Block_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 4
}

script GridControl_SFX_SetDown_Block 
	if gotparam \{type}
		switch <type>
			case Wood
			playsound \{sk8_WoodSolid_GrindOn_01
				vol = 125}
			case metal
			playsound \{sk8_metalpole_grindon_02
				vol = 100}
			case Concrete
			playsound \{SK8_Cursor_Wood_Deselect
				vol = 100}
		endswitch
	endif
endscript

script GridControl_SFX_Snap 
	if gotparam \{type}
		switch <type>
			case Wood
			playsound \{sk8_WoodSolid_GrindOn_01
				vol = 125}
			case metal
			playsound \{sk8_metalpole_grindon_02
				vol = 100}
			case Concrete
			playsound \{SK8_Cursor_Wood_Deselect
				vol = 100}
		endswitch
	endif
endscript
GridControl_SFX_Block_Slide_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 4
}

script GridControl_SFX_Block_Slide 
	if gotparam \{type}
		switch <type>
			case Wood
			playsound \{sk8_SolidWood_Grind_01
				vol = 30
				num_loops = -1}
			case metal
			playsound \{sk8_metalpole_grind_01
				vol = 30
				num_loops = -1}
			case `default`
		endswitch
	endif
endscript
GridControl_SFX_Block_Raise_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 4
}

script GridControl_SFX_Block_Raise 
	if gotparam \{type}
		switch <type>
			case Wood
			playsound \{sk8_SolidWood_Grind_01
				vol = 30
				num_loops = -1}
			case metal
			playsound \{sk8_metalpole_grind_01
				vol = 30
				num_loops = -1}
			case `default`
		endswitch
	endif
endscript
GridControl_SFX_Block_Rotate_struct = {
	default_priority = 95
	default_buss = MissionSFX
	norepeatfor = 0.0
	instancemanagement = ignore
	instancelimit = 4
}

script GridControl_SFX_Block_Rotate 
	if gotparam \{type}
		switch <type>
			case Wood
			playsound \{sk8_SolidWood_Grind_01
				vol = 30
				num_loops = -1}
			case metal
			playsound \{sk8_metalpole_grind_01
				vol = 30
				num_loops = -1}
			case `default`
		endswitch
	endif
endscript
menu_cheat_Good_sfx_struct = {
	default_priority = 55
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}

script menu_cheat_Good_sfx 
	wait \{0.2
		seconds}
	playsound \{sk9_MidGoal_Am
		vol = 70}
	wait \{0.5
		seconds}
	playsound \{sk9_MidGoal_Pro
		vol = 70}
	wait \{0.5
		seconds}
	playsound \{sk9_MidGoal_Sick
		vol = 80}
endscript
play_perfect_landing_sound_sfx_struct = {
	default_priority = 65
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}

script play_perfect_landing_sound_sfx 
	wait \{0.2
		seconds}
	playsound \{PerfectLanding_11
		vol = 85
		pitch = 80}
	if gman_getactivatedgoalid
		if (<activated_goal_id> = m_c2_localcomp)
			soundevent \{event = VO_m_c2_localcomp_Annouc_CleanLanding}
		elseif (<activated_goal_id> = m_c2_compstreet)
			soundevent \{event = VO_m_c2_localcomp_Annouc_CleanLanding}
		elseif (<activated_goal_id> = m_c2_comppark)
			soundevent \{event = VO_m_c2_localcomp_Annouc_CleanLanding}
		endif
	endif
endscript
play_sloppy_sound_sfx_struct = {
	default_priority = 65
	default_buss = frontend
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}

script play_sloppy_sound_sfx 
	wait \{0.120000005
		seconds}
	playsound \{HUDtrickslopC
		vol = 50
		pitch = 150}
	if gman_getactivatedgoalid
		if (<activated_goal_id> = m_c2_localcomp)
			soundevent \{event = VO_m_c2_localcomp_Annouc_SloppyLanding}
		elseif (<activated_goal_id> = m_c2_compstreet)
			soundevent \{event = VO_m_c2_localcomp_Annouc_SloppyLanding}
		elseif (<activated_goal_id> = m_c2_comppark)
			soundevent \{event = VO_m_c2_localcomp_Annouc_SloppyLanding}
		endif
	endif
endscript
Ped_Skater_Grind_Bail_Sound_struct = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_furthest
	instancelimit = 4
}

script Ped_Skater_Grind_Bail_Sound 
	soundevent event = Temp_Ped_Fall_Sound
	wait 0.5 seconds
	RandomNoRepeat (
		@ obj_playsound BailBoard01 pitch = RandomRange (100.0, 102.0) vol = RandomRange (40.0, 50.0)
		@ obj_playsound BailBoard02 pitch = RandomRange (100.0, 102.0) vol = RandomRange (40.0, 50.0)
		@ obj_playsound BailBoard03 pitch = RandomRange (100.0, 102.0) vol = RandomRange (40.0, 50.0)
		@ obj_playsound BailBoard04 pitch = RandomRange (100.0, 102.0) vol = RandomRange (40.0, 50.0)
		@ obj_playsound BailBoard05 pitch = RandomRange (100.0, 102.0) vol = RandomRange (40.0, 50.0)
		)
endscript
Temp_Ped_Fall_Sound_struct = {
	default_priority = 50
	default_buss = `default`
	norepeatfor = 0.1
	instancemanagement = stop_furthest
	instancelimit = 4
}

script Temp_Ped_Fall_Sound 
	RandomNoRepeat (
		@ obj_playsound sk9_BailBodyPunch01 pitch = RandomRange (80.0, 102.0) vol = RandomRange (120.0, 140.0)
		@ obj_playsound sk9_BailBodyPunch02 pitch = RandomRange (80.0, 102.0) vol = RandomRange (120.0, 140.0)
		@ obj_playsound sk9_BailBodyPunch03 pitch = RandomRange (80.0, 102.0) vol = RandomRange (120.0, 140.0)
		@ obj_playsound sk9_BailBodyPunch04 pitch = RandomRange (80.0, 102.0) vol = RandomRange (120.0, 140.0)
		)
	RandomNoRepeat (
		@ obj_playsound sk9_BailSlap01 pitch = RandomRange (95.0, 115.0) vol = RandomRange (110.0, 130.0)
		@ obj_playsound sk9_BailSlap02 pitch = RandomRange (95.0, 115.0) vol = RandomRange (110.0, 130.0)
		@ obj_playsound sk9_BailSlap03 pitch = RandomRange (95.0, 115.0) vol = RandomRange (110.0, 130.0)
		)
endscript
Classic_Mode_Show_Goals_Camera_sfx_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancelimit = 2
	instancemanagement = stop_oldest
}

script Classic_Mode_Show_Goals_Camera_sfx 
	setspawnedscriptnorepeatfor \{time = 0.07}
	setspawninstancelimits \{max = 3
		management = ignore}
	playsound \{Classic_Show_Goal
		vol = 45}
endscript

script Classic_Mode_View_Goals_sfx 
	soundevent \{event = General_Goal_Success_Sound_sfx}
endscript

script General_Goal_Success_Sound_sfx 
	if gotparam success_sfx_type
		switch <success_sfx_type>
			case hardcore
			playsound General_Success_01 vol = 90
			wait 0.8 seconds
			playsound hXc_success vol = 180 pan1y = 0.25 pan2y = 0.25 pan1x = -1 pan2x = 1
			case rigger
			playsound General_Success_01 vol = 90
			wait 0.36 seconds
			playsound rig_success vol = 185 pan1y = 0.25 pan2y = 0.25 pan1x = -1 pan2x = 1
			case career
			playsound General_Success_01 vol = 90
			wait 0.7 seconds
			playsound career_success vol = 125 pan1y = 0.25 pan2y = 0.25 pan1x = -1 pan2x = 1
			default
			playsound General_Success_01 vol = 90
			wait 0.97999996 seconds
			playsound sk9_midgoal_rank vol = 70 pitch = 94 pan1y = 0.25 pan2y = 0.25 pan1x = -1 pan2x = 1
		endswitch
	else
		playsound General_Success_01 vol = 90
		wait 0.97999996 seconds
		playsound sk9_midgoal_rank vol = 70 pitch = 94 pan1y = 0.25 pan2y = 0.25 pan1x = -1 pan2x = 1
	endif
endscript
Classic_Mode_Completed_Screen_Highlight_Completed_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancelimit = 2
	instancemanagement = stop_oldest
}

script Classic_Mode_Completed_Screen_Highlight_Completed 
	playsound \{Classic_Show_Completed_Goals
		vol = 80}
endscript
Classic_Mode_Out_of_bounds_Loop_start_sfx_struct = {
	default_priority = 65
	default_buss = GoalFeedback
	norepeatfor = 0.2
	instancelimit = 2
	instancemanagement = stop_oldest
}

script Classic_Mode_Out_of_bounds_Loop_start_sfx 
	begin
	playsound \{sk9_New_OB_Alarm
		vol = 50}
	wait \{1
		seconds}
	repeat
endscript

script Classic_Mode_Out_of_bounds_Loop_stop_sfx 
	stopsoundevent \{Classic_Mode_Out_of_bounds_Loop_start_sfx}
	stopsoundevent \{Classic_Mode_Out_of_bounds_Loop_start_sfx}
	stopsoundevent \{Classic_Mode_Out_of_bounds_Loop_start_sfx}
endscript
CAS_SFX_Skater_Torso_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 4
}

script CAS_SFX_Skater_Torso_Change 
	switch <desc_id>
		case URBN_Shirt_Hoody02
		case SURF_Shirt_Globe01
		case Punk_Shirt_Hoody02
		case Punk_Hoody_Adio01
		case KID_Shirt_Hoody02
		case FEM_Shirt_Hoody02
		case FEM_Shirt_ElementHoody
		case URBN_Shirt_RDS02
		case PUNK_Shirt_BaseballT
		case Punk_jacket_Element01
		case Punk_Shirt_Hurley01
		case Punk_Shirt_Hurley02
		case Punk_Shirt_Hurley03
		case Punk_Shirt_Quiksilver01
		case Punk_Shirt_VansHoody
		case Punk_Shirt_Volcom01
		case Punk_Shirt_Volcom02
		case KID_Shirt_LSShirt01
		case KID_Shirt_Layered01
		case KID_Shirt_DVS01
		case KID_Shirt_Etnies02
		case KID_Shirt_Independent01
		case KID_Shirt_Quicksilver01
		case KID_Shirt_RDS01
		case KID_Shirt_Hawk01
		case KID_Shirt_Volcom01
		case Layered01
		case Flowerdress
		case FEM_Shirt_Etnies02
		case SURF_Shirt_LSShirt01
		case SURF_Shirt_Layered01
		case SURF_Shirt_Globe01
		case SURF_Shirt_Quiksilver01
		case SURF_Shirt_Sessions01
		case URBN_Shirt_LSShirt01
		case URBN_Shirt_DGK01
		case URBN_Shirt_ZooYork01
		playsound Sk8_CaS_Hoody vol = 150
		case URBN_Shirt_Hoody01
		case Layered01
		case URBN_Jacket_Nixon01
		case URBN_Shirt_Hurley01
		case SURF_Shirt_Hurley03
		case Punk_Shirt_Hoody01
		case Punk_Shirt_Independent02
		case FEM_Shirt_Hoody01
		case URBN_Shirt_Nike01
		case URBN_Shirt_ZooYork02
		case Punk_Jacket_Leather
		case Punk_Shirt_Quiksilver02
		case KID_Shirt_Hoody01
		case FEM_Shirt_Hurley01
		case FEM_Unlock_Volcom01
		case FEM_Unlock_Quiksilver01
		case SURF_Shirt_Quiksilver04
		case SURF_Shirt_Hoody01
		case SURF_Shirt_DC01
		case URBN_Shirt_DGK05
		playsound Sk8_CaS_HoodyZipper vol = 150
		default
		playsound Sk8_CaS_Shirt
	endswitch
endscript
CAS_SFX_Skater_Legs_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.05
	instancemanagement = stop_oldest
	instancelimit = 4
}

script CAS_SFX_Skater_Legs_Change 
	switch <desc_id>
		case Boardshorts01
		case URBN_Shorts_Zooyork01
		case Punk_Shorts_Hurley01
		case Skirt01
		case URBN_Shorts_Quiksilver01
		case URBN_Shorts_Cargo01
		case Punk_Shorts_Cargo01
		case KID_Shorts_Cargo01
		case KID_Shorts_Cargo02
		case KID_Shorts_Volcom01
		case FEM_Pants_Volcom02
		case Surf_Shorts_Cargo01
		case Surf_Shorts_Cargo02
		case Surf_Shorts_Quiksilver01
		playsound Sk8_CaS_Shorts
		default
		playsound Sk8_CaS_Jeans_ZipUp
	endswitch
endscript
CAS_SFX_Skater_Hat_Change_struct = {
	default_priority = 60
	default_buss = frontend
	norepeatfor = 0.2
	instancemanagement = stop_oldest
	instancelimit = 4
}

script CAS_SFX_Skater_Hat_Change 
	switch <desc_id>
		case Helmet01
		playsound \{CAS_Change_Hat_Mvmt}
		default
		playsound \{CAS_Change_Hat_Mvmt}
	endswitch
endscript
ntt_soundbuss_active = 0

script nail_the_trick_into_sfx 
	printf "--- nail_the_trick_into_sfx"
	if ($focus_mode_buss_set_active = 1)
		change focus_mode_buss_set_active = 0
		printpushpopdebuginfo pop name = "nail_the_trick_into_sfx"
		popsoundbussparams
	endif
	if (($epicpush_soundbuss_active) = 1)
		change epicpush_soundbuss_active = 0
		printpushpopdebuginfo pop name = "nail_the_trick_into_sfx - epicpush_soundbuss_active = 1 "
		popsoundbussparams
	endif
	if (($ntt_soundbuss_active) = 0)
		printpushpopdebuginfo push name = "nail_the_trick_into_sfx"
		change ntt_soundbuss_active = 1
		pushsoundbussparams
		if ($global_user_sfx_number = 0)
			setsoundbussparams $default_bussset time = 0.5
		else
			setsoundbussparams $Nail_The_Trick_Mode_BussSet time = 0.5
		endif
	endif
	soundevent event = Go_Into_Slo_Mo_sfx
	soundevent event = ntt_into_sfx_loop
endscript

script nail_the_trick_out_of_sfx 
	printf "--- nail_the_trick_out_of_sfx"
	if ($ntt_soundbuss_active = 1)
		printpushpopdebuginfo pop name = "nail_the_trick_out_of_sfx"
		change ntt_soundbuss_active = 0
		popsoundbussparams
		soundevent event = ntt_outof_sfx_loop
		soundevent event = ntt_stop_crowd
		soundevent event = Go_Outof_Slo_Mo_sfx
		if issoundeventplaying NTM_scrape_SFX
			stopsoundevent NTM_scrape_SFX
		endif
	endif
	killspawnedscript name = nail_the_trick_Board_Rotate_SFX
endscript
Crowd_Cheer_NTT_struct = {
	default_priority = 50
	default_buss = crowd
	norepeatfor = 1
	instancemanagement = stop_oldest
	instancelimit = 1
}

script Crowd_Cheer_NTT 
	wait 0.1 seconds
	RandomNoRepeat (
		@ playsound Cheer_Small_01 vol = 135 pitch = 60 pan1x = -1 pan1y = 0 pan2x = 1 pan2y = 0
		@ playsound Cheer_Small_02 vol = 135 pitch = 60 pan1x = -1 pan1y = 0 pan2x = 1 pan2y = 0
		@ playsound Cheer_Small_03 vol = 135 pitch = 60 pan1x = -1 pan1y = 0 pan2x = 1 pan2y = 0
		@ playsound Cheer_Small_04 vol = 135 pitch = 60 pan1x = -1 pan1y = 0 pan2x = 1 pan2y = 0
		@ playsound Cheer_Small_05 vol = 135 pitch = 60 pan1x = -1 pan1y = 0 pan2x = 1 pan2y = 0
		@ playsound Cheer_Small_06 vol = 135 pitch = 60 pan1x = -1 pan1y = 0 pan2x = 1 pan2y = 0
		@ playsound Cheer_Small_07 vol = 135 pitch = 60 pan1x = -1 pan1y = 0 pan2x = 1 pan2y = 0
		)
endscript

script ntt_stop_crowd 
	stopsound \{Cheer_Small_01}
	stopsound \{Cheer_Small_02}
	stopsound \{Cheer_Small_03}
	stopsound \{Cheer_Small_04}
	stopsound \{Cheer_Small_05}
	stopsound \{Cheer_Small_06}
	stopsound \{Cheer_Small_07}
endscript
nail_the_trick_do_trick_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 3
}

script nail_the_trick_do_trick 
	RandomNoRepeat (
		@ obj_playsound \{sk8_Nail_Trick_Foley_01
			vol = 90}
		@ obj_playsound \{sk8_Nail_Trick_Foley_02
			vol = 90}
		@ obj_playsound \{sk8_Nail_Trick_Foley_03
			vol = 90}
		)
	wait \{0.05
		seconds}
	RandomNoRepeat (
		@ obj_playsound \{sk8_Nail_Trick_Design_01
			vol = 90}
		@ obj_playsound \{sk8_Nail_Trick_Design_02
			vol = 90}
		@ obj_playsound \{sk8_Nail_Trick_Design_03
			vol = 90}
		)
endscript
nail_the_trick_land_sfx_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}

script nail_the_trick_land_sfx 
	obj_playsound \{SK8_NailLand_01}
	killspawnedscript \{name = nail_the_trick_Board_Rotate_SFX}
endscript

script nail_the_manual_land_sfx 
	playsound \{SK8_NailLand_01
		vol = 200}
	wait \{0.05
		seconds}
	RandomNoRepeat (
		@ playsound \{sk8_Nail_Trick_Design_01}
		@ playsound \{sk8_Nail_Trick_Design_02}
		@ playsound \{sk8_Nail_Trick_Design_03}
		)
endscript
nail_the_trick_negative_sfx_struct = {
	default_priority = 85
	default_buss = GoalFeedback
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 4
}

script nail_the_trick_negative_sfx 
	playsound \{sk8_Nail_TrickNegative_01}
	killspawnedscript \{name = nail_the_trick_Board_Rotate_SFX}
	stopsound \{Cheer_Small_01}
	stopsound \{Cheer_Small_02}
	stopsound \{Cheer_Small_03}
	stopsound \{Cheer_Small_04}
	stopsound \{Cheer_Small_05}
	stopsound \{Cheer_Small_06}
	stopsound \{Cheer_Small_07}
endscript

script Bail_Left_Arm_Hit_sfx 
	setspawnedscriptnorepeatfor \{time = 0.2}
	setspawninstancelimits \{max = 1
		management = ignore}
	spawnterrainsound action = armfall terrain = <terrain> proj_velocity = <proj_velocity>
endscript

script Bail_Right_Arm_Hit_sfx 
	setspawnedscriptnorepeatfor \{time = 0.2}
	setspawninstancelimits \{max = 1
		management = ignore}
	spawnterrainsound action = armfall terrain = <terrain> proj_velocity = <proj_velocity>
endscript

script Bail_Left_Leg_Hit_sfx 
	setspawnedscriptnorepeatfor \{time = 0.2}
	setspawninstancelimits \{max = 1
		management = ignore}
	spawnterrainsound action = legfall terrain = <terrain> proj_velocity = <proj_velocity>
endscript

script Bail_Right_Leg_Hit_sfx 
	setspawnedscriptnorepeatfor \{time = 0.2}
	setspawninstancelimits \{max = 1
		management = ignore}
	spawnterrainsound action = legfall terrain = <terrain> proj_velocity = <proj_velocity>
endscript

script Bail_Torso_Hit_sfx 
	setspawnedscriptnorepeatfor \{time = 0.2}
	setspawninstancelimits \{max = 1
		management = ignore}
	spawnterrainsound action = bodyfall terrain = <terrain> proj_velocity = <proj_velocity>
endscript

script Bail_Head_Hit_sfx 
	setspawnedscriptnorepeatfor \{time = 0.2}
	setspawninstancelimits \{max = 1
		management = ignore}
	spawnterrainsound action = headfall terrain = <terrain> proj_velocity = <proj_velocity>
endscript

script Bail_Nutter_Hit_sfx 
	setspawnedscriptnorepeatfor \{time = 0.2}
	setspawninstancelimits \{max = 1
		management = ignore}
	spawnterrainsound action = nutsfall terrain = <terrain> proj_velocity = <proj_velocity>
endscript
Bail_Break_Bone_sfx_struct = {
	default_priority = 65
	default_buss = BoneBreaks
	norepeatfor = 0.3
	instancemanagement = stop_oldest
	instancelimit = 2
}

script Bail_Break_Bone_sfx 
	setspawnedscriptnorepeatfor time = 0.1
	setspawninstancelimits max = 1 management = ignore
	RandomNoRepeat (
		@ obj_playsound sk9_BoneBreak_01 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 70.0)
		@ obj_playsound sk9_BoneBreak_02 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 70.0)
		@ obj_playsound sk9_BoneBreak_03 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 70.0)
		@ obj_playsound sk9_BoneBreak_04 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 70.0)
		)
endscript

script Bonk_VO_sfx_no_wait 
	setspawnedscriptnorepeatfor \{time = 1}
	setspawninstancelimits \{max = 1
		management = ignore}
endscript

script Bail_SlideFallOff_sfx 
	setspawnedscriptnorepeatfor \{time = 0.2}
	setspawninstancelimits \{max = 1
		management = ignore}
	settags \{TagSlideFallFlag = 0}
	skaterloopingsound_settag \{tagslidefallvelocity = -1}
	skaterloopingsound_settag \{tagslidefallterrain = -1}
	spawnterrainsound \{action = stopsounds}
endscript

script Ped_Cheer_Ped_Fem01 
	if ($VO_Array_Is_Shuffled_female = 0)
		permutearray \{array = $Master_VO_Cheering_Array_female
			permutesource
			makenewfirstdifferfromoldlast}
		change \{VO_Array_Is_Shuffled_female = 1}
	endif
	if ($VO_Use_This_Array_Number_female > 24)
		change \{VO_Use_This_Array_Number_female = 0}
		permutearray \{array = $Master_VO_Cheering_Array_female
			permutesource
			makenewfirstdifferfromoldlast}
	endif
	if ($VO_Array_Is_Shuffled_female = 1)
		localnumbervariable = $VO_Use_This_Array_Number_female
		thisfemalecheersound = ($Master_VO_Cheering_Array_female [<localnumbervariable>])
		change VO_Use_This_Array_Number_female = ($VO_Use_This_Array_Number_female + 1)
	endif
endscript

script Ped_Cheer_Ped_Fem02 
	Ped_Cheer_Ped_Fem01
endscript

script PedVOCheer 
	PedVOCheerArray = [
		Ped_Cheer_Ped_Fem01
		Ped_Cheer_Ped_Fem02
		Ped_Cheer_Ped_Fem03
		Ped_Cheer_Ped_Fem04
		Ped_Cheer_Ped_Fem05
		Ped_Cheer_Ped_Male01
		Ped_Cheer_Ped_Male02
		Ped_Cheer_Ped_Male03
		Ped_Cheer_Ped_Male04
		Ped_Cheer_Ped_Male05
		Ped_Cheer_Ped_Male06
		Ped_Cheer_Ped_Male07
		Ped_Cheer_Ped_Male08
		Ped_Cheer_Ped_Male09
		Ped_Cheer_Ped_Male10
	]
	permutearray array = <PedVOCheerArray> newarrayname = PermutedArray makenewfirstdifferfromoldlast
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [0]) PedCheerWaitTime = RandomRange (0.0, 0.15)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [1]) PedCheerWaitTime = RandomRange (0.0, 0.15)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [2]) PedCheerWaitTime = RandomRange (0.15, 0.5)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [3]) PedCheerWaitTime = RandomRange (0.15, 0.5)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [4]) PedCheerWaitTime = RandomRange (0.15, 0.5)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [5]) PedCheerWaitTime = RandomRange (0.15, 0.5)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [6]) PedCheerWaitTime = RandomRange (0.15, 0.5)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [7]) PedCheerWaitTime = RandomRange (0.5, 0.8)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [8]) PedCheerWaitTime = RandomRange (0.5, 0.8)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [9]) PedCheerWaitTime = RandomRange (0.5, 0.8)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [10]) PedCheerWaitTime = RandomRange (0.5, 1.0)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [11]) PedCheerWaitTime = RandomRange (0.5, 1.0)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [12]) PedCheerWaitTime = RandomRange (0.5, 1.0)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [13]) PedCheerWaitTime = RandomRange (0.5, 1.0)}
	spawnscriptnow CheerVOPlayer params = {PedScript = (<PermutedArray> [14]) PedCheerWaitTime = RandomRange (0.5, 1.0)}
endscript

script CheerVOPlayer 
	wait <PedCheerWaitTime> seconds
	printf "WaitTime = %f" f = <PedCheerWaitTime>
	spawnscriptnow <PedScript>
endscript

script Ped_Hit_By_Skater_Big_SFX 
	RandomNoRepeat (
		@ obj_playsound BailBodyFall01 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall02 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall03 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall04 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall05 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		)
	RandomNoRepeat (
		@ obj_playsound sk9_BailBodyPunch01 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 70.0)
		@ obj_playsound sk9_BailBodyPunch02 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 70.0)
		@ obj_playsound sk9_BailBodyPunch03 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 70.0)
		@ obj_playsound sk9_BailBodyPunch04 pitch = RandomRange (80.0, 102.0) vol = RandomRange (50.0, 70.0)
		)
endscript

script Skater_Hit_By_Ped_Tackle_SFX 
	RandomNoRepeat (
		@ obj_playsound sk9_bodyfall_arm_01 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound sk9_bodyfall_arm_02 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound sk9_bodyfall_arm_03 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound sk9_bodyfall_leg_01 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound sk9_bodyfall_leg_02 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound sk9_bodyfall_leg_03 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound sk9_bodyfall_leg_04 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		)
	RandomNoRepeat (
		@ obj_playsound BailBodyFall01 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall02 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall03 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall04 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall05 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		)
	RandomNoRepeat (
		@ obj_playsound sk9_BailBodyPunch01 pitch = RandomRange (80.0, 102.0) vol = RandomRange (20.0, 30.0)
		@ obj_playsound sk9_BailBodyPunch02 pitch = RandomRange (80.0, 102.0) vol = RandomRange (20.0, 30.0)
		@ obj_playsound sk9_BailBodyPunch03 pitch = RandomRange (80.0, 102.0) vol = RandomRange (20.0, 30.0)
		@ obj_playsound sk9_BailBodyPunch04 pitch = RandomRange (80.0, 102.0) vol = RandomRange (20.0, 30.0)
		)
	obj_playsound sk9_BailSlap03 pitch = RandomRange (85.0, 105.0) vol = RandomRange (30.0, 40.0)
endscript

script Ped_Hit_By_Skater_KnockDown_SFX 
	RandomNoRepeat (
		@ obj_playsound BailBodyFall01 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall02 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall03 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall04 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		@ obj_playsound BailBodyFall05 pitch = RandomRange (95.0, 105.0) vol = RandomRange (90.0, 100.0)
		)
	RandomNoRepeat (
		@ obj_playsound sk9_BailBodyPunch01 pitch = RandomRange (80.0, 102.0) vol = RandomRange (80.0, 85.0)
		@ obj_playsound sk9_BailBodyPunch02 pitch = RandomRange (80.0, 102.0) vol = RandomRange (80.0, 85.0)
		@ obj_playsound sk9_BailBodyPunch03 pitch = RandomRange (80.0, 102.0) vol = RandomRange (80.0, 85.0)
		@ obj_playsound sk9_BailBodyPunch04 pitch = RandomRange (80.0, 102.0) vol = RandomRange (80.0, 85.0)
		)
	RandomNoRepeat (
		@ obj_playsound sk9_BailSlap01 pitch = RandomRange (95.0, 115.0) vol = RandomRange (60.0, 70.0)
		@ obj_playsound sk9_BailSlap02 pitch = RandomRange (95.0, 115.0) vol = RandomRange (60.0, 70.0)
		@ obj_playsound sk9_BailSlap03 pitch = RandomRange (95.0, 115.0) vol = RandomRange (60.0, 70.0)
		)
endscript

script Generic_Male_KeepItUp_Sound 
	if ($VO_KeepItUp_Array_Is_Shuffled = 0)
		permutearray array = $Master_VO_KeepItUp_Array permutesource makenewfirstdifferfromoldlast
		change VO_KeepItUp_Array_Is_Shuffled = 1
	endif
	if ($VO_KeepItUp_Use_This_Array_Number > 39)
		change VO_KeepItUp_Use_This_Array_Number = 0
		permutearray array = $Master_VO_KeepItUp_Array permutesource makenewfirstdifferfromoldlast
	endif
	if ($VO_KeepItUp_Array_Is_Shuffled = 1)
		localnumbervariable = $VO_KeepItUp_Use_This_Array_Number
		thismalecheersound = ($Master_VO_KeepItUp_Array [<localnumbervariable>])
		agent_playvo <thismalecheersound> vol = $temp_ped_male_keepitup_vo_volume dropoff = $temp_ped_male_keepitup_dropoff_dist dropoff_function = inv_exponential <...>
		change VO_KeepItUp_Use_This_Array_Number = ($VO_KeepItUp_Use_This_Array_Number + 1)
	endif
endscript

script Generic_Female_KeepItUp_Sound 
	if ($VO_KeepItUp_Array_Is_Shuffled_female = 0)
		permutearray array = $Master_VO_KeepItUp_Array_female permutesource makenewfirstdifferfromoldlast
		change VO_KeepItUp_Array_Is_Shuffled_female = 1
	endif
	if ($VO_KeepItUp_Use_This_Array_Number_female > 19)
		change VO_KeepItUp_Use_This_Array_Number_female = 0
		permutearray array = $Master_VO_KeepItUp_Array_female permutesource makenewfirstdifferfromoldlast
	endif
	if ($VO_KeepItUp_Array_Is_Shuffled_female = 1)
		localnumbervariable = $VO_KeepItUp_Use_This_Array_Number_female
		thisfemalecheersound = ($Master_VO_KeepItUp_Array_female [<localnumbervariable>])
		agent_playvo <thisfemalecheersound> vol = $temp_ped_male_keepitup_vo_volume dropoff = $temp_ped_male_keepitup_dropoff_dist dropoff_function = inv_exponential <...>
		change VO_KeepItUp_Use_This_Array_Number_female = ($VO_KeepItUp_Use_This_Array_Number_female + 1)
	endif
endscript

script Generic_Male_Avoid_Sound 
endscript

script wheel_spin_speed_1 
	if (<buss> = pedwheelspins)
		obj_playsound sk8_wheels_b1_spd1_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (115.0, 125.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
	else
		obj_playsound sk8_wheels_b1_spd1_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (95.0, 105.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
	endif
	skaterloopingsound_settag \{terrainsound_wheelselement = sk8_wheels_b1_spd1_01}
endscript

script wheel_spin_speed_2 
	if (<buss> = pedwheelspins)
		RandomNoRepeat (
			@ obj_playsound sk8_wheels_b1_spd2_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (115.0, 125.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd2_01
			@ obj_playsound sk8_wheels_b1_spd2_02 vol = RandomRange (40.0, 50.0) pitch = RandomRange (115.0, 125.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd2_02
			)
	else
		RandomNoRepeat (
			@ obj_playsound sk8_wheels_b1_spd2_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (95.0, 105.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd2_01
			@ obj_playsound sk8_wheels_b1_spd2_02 vol = RandomRange (40.0, 50.0) pitch = RandomRange (95.0, 105.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd2_02
			)
	endif
endscript

script wheel_spin_speed_3 
	if (<buss> = pedwheelspins)
		RandomNoRepeat (
			@ obj_playsound sk8_wheels_b1_spd3_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (115.0, 125.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd3_01
			@ obj_playsound sk8_wheels_b1_spd3_02 vol = RandomRange (40.0, 50.0) pitch = RandomRange (115.0, 125.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd3_02
			)
	else
		RandomNoRepeat (
			@ obj_playsound sk8_wheels_b1_spd3_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (95.0, 105.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd3_01
			@ obj_playsound sk8_wheels_b1_spd3_02 vol = RandomRange (40.0, 50.0) pitch = RandomRange (95.0, 105.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd3_02
			)
	endif
endscript

script wheel_spin_speed_4 
	if (<buss> = pedwheelspins)
		RandomNoRepeat (
			@ obj_playsound sk8_wheels_b1_spd4_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (115.0, 125.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd4_01
			@ obj_playsound sk8_wheels_b1_spd4_02 vol = RandomRange (40.0, 50.0) pitch = RandomRange (115.0, 125.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd4_02
			)
	else
		RandomNoRepeat (
			@ obj_playsound sk8_wheels_b1_spd4_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (95.0, 105.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd4_01
			@ obj_playsound sk8_wheels_b1_spd4_02 vol = RandomRange (40.0, 50.0) pitch = RandomRange (95.0, 105.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
			skaterloopingsound_settag terrainsound_wheelselement = sk8_wheels_b1_spd4_02
			)
	endif
endscript

script wheel_spin_speed_5 
	if (<buss> = pedwheelspins)
		obj_playsound sk8_wheels_b1_spd5_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (115.0, 125.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
	else
		obj_playsound sk8_wheels_b1_spd5_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (95.0, 105.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
	endif
	skaterloopingsound_settag \{terrainsound_wheelselement = sk8_wheels_b1_spd5_01}
endscript

script wheel_spin_speed_6 
	if (<buss> = pedwheelspins)
		obj_playsound sk8_wheels_b1_spd6_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (115.0, 125.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
	else
		obj_playsound sk8_wheels_b1_spd6_01 vol = RandomRange (40.0, 50.0) pitch = RandomRange (95.0, 105.0) buss = <buss> dropoff = $terrainsound_defaultdropoff
	endif
	skaterloopingsound_settag \{terrainsound_wheelselement = sk8_wheels_b1_spd6_01}
endscript

script BG_OneShot_Default 
	begin
	printf \{channel = sfx
		"********************* DEFAULT ONE SHOT SCRIPT *****************************"}
	wait \{3
		seconds}
	repeat
endscript

script sk8_boardsqueaks 
	getrandomvalue name = v a = 0 b = 99 integer
	if (<v> < 50)
		CalculatePitchAndVol minvol = 20 maxvol = 60
		if NOT issoundplaying SFX_Squeak
			if NOT inair
				if islocalskater
					RandomNoRepeat (
						@ obj_playsound SK8_Squeak_01 vol = <vol> id = SFX_Squeak buss = Squeaks
						@ obj_playsound SK8_Squeak_02 vol = <vol> id = SFX_Squeak buss = Squeaks
						@ obj_playsound SK8_Squeak_03 vol = <vol> id = SFX_Squeak buss = Squeaks
						@ obj_playsound SK8_Squeak_04 vol = <vol> id = SFX_Squeak buss = Squeaks
						)
				else
					RandomNoRepeat (
						@ obj_playsound SK8_Squeak_01 vol = <vol> id = SFX_Squeak buss = PedSqueaks
						@ obj_playsound SK8_Squeak_02 vol = <vol> id = SFX_Squeak buss = PedSqueaks
						@ obj_playsound SK8_Squeak_03 vol = <vol> id = SFX_Squeak buss = PedSqueaks
						@ obj_playsound SK8_Squeak_04 vol = <vol> id = SFX_Squeak buss = PedSqueaks
						)
				endif
			endif
		endif
	endif
endscript

script sk8_CAS_SURF_BailSmGrunt 
	setspawnedscriptnorepeatfor time = 0.8
	setspawninstancelimits max = 1 management = kill_oldest
	RandomNoRepeat (
		@ playsound SK8_CAS_SURF_SmFall_07 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_SmFall_06 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_SmFall_05 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_SmFall_04 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_SmFall_03 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_SmFall_02 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_SmFall_01 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_SmFall_08 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		)
endscript

script sk8_CAS_SURF_BailLgGrunt 
	setspawnedscriptnorepeatfor time = 1.4
	setspawninstancelimits max = 1 management = kill_oldest
	RandomNoRepeat (
		@ playsound SK8_CAS_SURF_LgFall_06 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_LgFall_05 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_LgFall_04 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_LgFall_02 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		@ playsound SK8_CAS_SURF_LgFall_07 vol = RandomRange (60.0, 70.0) pitch = RandomRange (95.0, 105.0)
		)
endscript

script Misc_FX_Foliage_Rustle 
	skater :getspeed
	if (<speed> > 1)
		RandomNoRepeat (
			@ playsound sk8_Foliage_Rustle_01 vol = (<speed> * 2)
			@ playsound sk8_Foliage_Rustle_02 vol = (<speed> * 2)
			@ playsound sk8_Foliage_Rustle_03 vol = (<speed> * 2)
			@ playsound sk8_Foliage_Rustle_04 vol = (<speed> * 2)
			@ playsound sk8_Foliage_Rustle_05 vol = (<speed> * 2)
			@ playsound sk8_Foliage_Rustle_06 vol = (<speed> * 2)
			@ playsound sk8_Foliage_Rustle_07 vol = (<speed> * 2)
			)
	endif
endscript

script sk9_Foliage 
	skater :getspeed
	if (<speed> > 1)
		if ((<speed> * 2) < 200)
			RandomNoRepeat (
				@ playsound sk9_Leaves_01 vol = (<speed> * 2)
				@ playsound sk9_Leaves_02 vol = (<speed> * 2)
				@ playsound sk9_Leaves_03 vol = (<speed> * 2)
				@ playsound sk9_Leaves_04 vol = (<speed> * 2)
				@ playsound sk9_Leaves_05 vol = (<speed> * 2)
				@ playsound sk9_Leaves_06 vol = (<speed> * 2)
				@ playsound sk9_Leaves_07 vol = (<speed> * 2)
				)
		else
			RandomNoRepeat (
				@ playsound sk9_Leaves_01 vol = (400)
				@ playsound sk9_Leaves_02 vol = (400)
				@ playsound sk9_Leaves_03 vol = (400)
				@ playsound sk9_Leaves_04 vol = (400)
				@ playsound sk9_Leaves_05 vol = (400)
				@ playsound sk9_Leaves_06 vol = (400)
				@ playsound sk9_Leaves_07 vol = (400)
				)
		endif
	endif
endscript

script AAA_TERRAIN_DUMMY 
	playsound Focus_In_Front
	playsound Focus_In_Rears
	playsound sk8_Excavation_GearLoop
	playsound Rock_Fall_Loop
	playsound sk8_Excavation_RockConveyorLoop
	playsound small_positive_message_01
	playsound sk8_roll_chainlink
	playsound SK8_Dragon_Coaster_LP
	playsound SK8_Manhole_Cover_Spin
	playsound SK8_Cannon_Fire_02
	playsound SK8_Cannon_Fire_01
	playsound SK8_Cannon_Fire_03
	playsound SK8_Steam_Catapult
	playsound SK8_Wind_Up
	playsound SK8_Large_Fan
	playsound SK8_Log_Ride_Splash_02
	playsound SK8_Log_Ride_Splash_01
	playsound SK8_Log_Ride_Splash_03
	playsound SK8_Garage_Open
	playsound sk8_metalgrate_sharp_01
	playsound sk8_metalgrate_pipe_05
	playsound sk8_roll_chainlink
	playsound sk8_metalgrate_pipe_04
	playsound sk8_metalgrate_pipe_03
	playsound sk8_metalgrate_pipe_02
	playsound sk8_metalgrate_pipe_01
	playsound sk8_metalgrate_dull_03
	playsound sk8_metalgrate_dull_02
	playsound sk8_metalgrate_dull_01
	playsound sk8_metalgrate_sharp_02
	playsound sk8_GlassBonk_02
	playsound sk8_GlassBonk_01
	playsound SK8_Bouncy_WoodTable_Collide_01
	playsound SK8_Bouncy_WoodTable_Bounce_03
	playsound SK8_Bouncy_WoodTable_Bounce_02
	playsound SK8_Bouncy_WoodTable_Bounce_01
	playsound SK8_Bouncy_WoodPallete_Collide_02
	playsound SK8_Bouncy_WoodPallete_Collide_01
	playsound SK8_Bouncy_WoodPallete_Bounce_03
	playsound SK8_Bouncy_WoodPallete_Bounce_02
	playsound SK8_Bouncy_WoodPallete_Bounce_01
	playsound SK8_Bouncy_WoodTable_Collide_02
	playsound SK8_Bouncy_Toy_Collide_01
	playsound SK8_Bouncy_Toy_Bounce_03
	playsound SK8_Bouncy_Toy_Bounce_02
	playsound SK8_Bouncy_Toy_Bounce_01
	playsound SK8_Bouncy_Toy_Collide_02
	playsound SK8_Bouncy_SprayCan_Collide_02
	playsound SK8_Bouncy_SprayCan_Collide_01
	playsound SK8_Bouncy_SprayCan_Bounce_03
	playsound SK8_Bouncy_SprayCan_Bounce_02
	playsound SK8_Bouncy_SprayCan_Bounce_01
	playsound SK8_Bouncy_SodaCup_Collide_01
	playsound SK8_Bouncy_SodaCup_Bounce_03
	playsound SK8_Bouncy_SodaCup_Bounce_02
	playsound SK8_Bouncy_SodaCup_Bounce_01
	playsound SK8_Bouncy_SodaCup_Collide_02
	playsound SK8_Bouncy_PhotoLight_Collide_01
	playsound SK8_Bouncy_PhotoLight_Bounce_03
	playsound SK8_Bouncy_PhotoLight_Bounce_02
	playsound SK8_Bouncy_PhotoLight_Bounce_01
	playsound SK8_Bouncy_PhotoLight_Collide_02
	playsound SK8_Bouncy_MetalChair_Bounce_03
	playsound SK8_Bouncy_MetalChair_Bounce_02
	playsound SK8_Bouncy_MetalChair_Collide_01
	playsound SK8_Bouncy_MetalChair_Collide_02
	playsound SK8_Bouncy_MetalChair_Bounce_01
	playsound SK8_Bouncy_Foam_Chunk_Collide_01
	playsound SK8_Bouncy_Foam_Chunk_Bounce_03
	playsound SK8_Bouncy_Foam_Chunk_Bounce_02
	playsound SK8_Bouncy_Foam_Chunk_Bounce_01
	playsound SK8_Bouncy_Foam_Chunk_Collide_02
	playsound SK8_Bouncy_BookBag_Collide_01
	playsound SK8_Bouncy_BookBag_Bounce_03
	playsound SK8_Bouncy_BookBag_Bounce_02
	playsound SK8_Bouncy_BookBag_Bounce_01
	playsound SK8_Bouncy_BookBag_Collide_02
	playsound SK8_Bouncy_Coconut_Collide_01
	playsound SK8_Bouncy_Coconut_Bounce_03
	playsound SK8_Bouncy_Coconut_Bounce_02
	playsound SK8_Bouncy_Coconut_Bounce_01
	playsound SK8_Bouncy_BigBowlingPin_Collide_01
	playsound SK8_Bouncy_BigBowlingPin_Bounce_03
	playsound SK8_Bouncy_BigBowlingPin_Bounce_02
	playsound sk9_Conc_Grind_Proto
	playsound sk9_Conc_Grind_Proto2
	playsound sk9_Conc_Grind_Proto3
	playsound SK9_Wood_Grind_Proto
	playsound sk9_Metal_Pole_Grind_01
	playsound SK8_Bouncy_BigBowlingPin_Bounce_01
	playsound SK8_Bouncy_BigLight_Collide_01
	playsound SK8_Bouncy_BigLight_Bounce_03
	playsound SK8_Bouncy_BigLight_Bounce_02
	playsound SK8_Bouncy_BigLight_Bounce_01
	playsound SK8_Bouncy_Book_Collide_01
	playsound SK8_Bouncy_Book_Bounce_03
	playsound SK8_Bouncy_Book_Bounce_02
	playsound SK8_Bouncy_Book_Bounce_01
	playsound SK8_Bouncy_Book_Collide_02
	playsound SK8_Bouncy_BigLight_Collide_02
	playsound SK8_Bouncy_BigBowlingPin_Collide_02
	playsound SK8_Bouncy_Coconut_Collide_02
	playsound Sk8_Asphalt_Slow_01
	playsound Sk8_Asphalt_Fast_01
	playsound sk8_terr_water_roll_loop
	playsound sk8_terr_water_roll_fast
	playsound sk8_terr_metal_roll_loop
	playsound sk8_terr_metal_roll_fast
	playsound sk8_terr_hard_dirt_slow
	playsound sk8_terr_hard_dirt_fast
	playsound sk8_terr_grass_slow_01
	playsound sk8_terr_grass_fast_01
	playsound sk8_Temp_Wood_Loop
	playsound sk8_Temp_Wood_Fast
	playsound sk8_Temp_Plastic_Loop
	playsound sk8_Temp_Plastic_Fast
	playsound sk8_Sidewalk_Slow
	playsound sk8_Sidewalk_Fast
	playsound sk8_terr_water_exit_01
	playsound sk8_terr_water_enter_15
	playsound sk8_terr_water_enter_13
	playsound sk8_terr_water_enter_12
	playsound sk8_terr_water_enter_10
	playsound sk8_terr_water_enter_08
	playsound sk8_terr_water_exit_03
	playsound sk8_Carpet_Loop_Slow
	playsound Sk9_Canvas_Tent_Roll_Tone2
	playsound SK9_mud_roll_slow
	playsound sk8_terr_metal_click_lng_02
	playsound sk8_terr_metal_click_lng_01
	playsound sk8_terr_metal_clack_lng_03
	playsound sk8_terr_metal_clack_lng_02
	playsound sk8_terr_metal_clack_lng_01
	playsound sk8_terr_metal_click_lng_03
	playsound sk8_terr_tile_click_04
	playsound sk8_terr_tile_click_03
	playsound sk8_terr_tile_click_02
	playsound sk8_terr_tile_click_01
	playsound sk8_terr_tile_clack_05
	playsound sk8_terr_tile_clack_04
	playsound sk8_terr_tile_clack_03
	playsound sk8_terr_tile_clack_02
	playsound sk8_terr_tile_clack_01
	playsound sk8_terr_tile_click_05
	playsound Sk8_Terr_Wood_Click_04
	playsound Sk8_Terr_Wood_Click_03
	playsound Sk8_Terr_Wood_Click_02
	playsound Sk8_Terr_Wood_Click_01
	playsound Sk8_Terr_Wood_Clack_05
	playsound Sk8_Terr_Wood_Clack_04
	playsound Sk8_Terr_Wood_Clack_03
	playsound Sk8_Terr_Wood_Clack_02
	playsound Sk8_Terr_Wood_Clack_01
	playsound Sk8_Terr_Sidewalk_Click_07
	playsound Sk8_Terr_Sidewalk_Click_06
	playsound Sk8_Terr_Sidewalk_Click_05
	playsound Sk8_Terr_Sidewalk_Click_04
	playsound Sk8_Terr_Sidewalk_Click_03
	playsound Sk8_Terr_Sidewalk_Click_02
	playsound Sk8_Terr_Sidewalk_Click_01
	playsound Sk8_Terr_Sidewalk_Clack_07
	playsound Sk8_Terr_Sidewalk_Clack_06
	playsound Sk8_Terr_Sidewalk_Clack_05
	playsound Sk8_Terr_Sidewalk_Clack_04
	playsound Sk8_Terr_Sidewalk_Clack_03
	playsound Sk8_Terr_Sidewalk_Clack_02
	playsound Sk8_Terr_Sidewalk_Clack_01
	playsound Sk8_Terr_Wood_Click_05
	playsound sk8_terr_fence_slid_clck_12
	playsound sk8_terr_fence_slid_clck_11
	playsound sk8_terr_fence_slid_clck_10
	playsound sk8_terr_fence_slid_clck_09
	playsound sk8_terr_fence_slid_clck_04
	playsound sk8_terr_fence_slid_clck_03
	playsound sk8_terr_fence_slid_clck_02
	playsound sk8_terr_fence_slid_clck_01
	playsound sk8_terr_fence_grnd_clck_11
	playsound sk8_terr_fence_grnd_clck_10
	playsound sk8_terr_fence_grnd_clck_09
	playsound sk8_terr_fence_grnd_clck_08
	playsound sk8_terr_fence_grnd_clck_04
	playsound sk8_terr_fence_grnd_clck_03
	playsound sk8_terr_fence_grnd_clck_02
	playsound sk8_terr_fence_grnd_clck_01
	playsound sk8_terr_bamboo_clack_30
	playsound sk8_terr_bamboo_clack_29
	playsound sk8_terr_bamboo_clack_28
	playsound sk8_terr_bamboo_clack_27
	playsound sk8_terr_bamboo_clack_22
	playsound sk8_terr_bamboo_clack_20
	playsound sk8_terr_bamboo_clack_18
	playsound sk8_terr_bamboo_clack_17
	playsound sk8_terr_bamboo_clack_16
	playsound sk8_terr_bamboo_clack_10
	playsound sk8_terr_bamboo_clack_09
	playsound sk8_terr_bamboo_clack_08
	playsound sk8_terr_bamboo_clack_07
	playsound sk8_terr_bamboo_clack_06
	playsound sk8_terr_bamboo_clack_05
	playsound sk8_terr_bamboo_clack_04
	playsound sk8_terr_bamboo_clack_03
	playsound sk8_terr_bamboo_clack_02
	playsound sk8_terr_bamboo_clack_01
	playsound sk8_terr_bamboo_clack_38
	playsound sk8_terr_sidewalk_grind
	playsound SK8_Asphalt_Truck_Grind_1
	playsound sk8_Cement_Grind
	playsound sk8_terr_concrete_grind
	playsound sk8_terr_metal_grind_loop
	playsound sk8_ter_plastic_grind_loop
	playsound sk8_SolidWood_Grind_01
	playsound sk8_rope_grind_03
	playsound sk8_metalpole_grind_01
	playsound sk8_terr_metal_slide_loop
	playsound sk8_terr_conc_slide_nose
	playsound sk8_ter_plastic_slide_loop
	playsound sk8_SolidWood_Slide_01
	playsound sk8_rope_slide_TEMP_03
	playsound sk8_metalpole_slide_01
	playsound sk9_Mud_Slide_forpogo
	playsound Male_KeepItUp_39
	playsound Male_KeepItUp_38
	playsound Male_KeepItUp_37
	playsound Male_KeepItUp_36
	playsound Male_KeepItUp_35
	playsound Male_KeepItUp_34
	playsound Male_KeepItUp_33
	playsound Male_KeepItUp_32
	playsound Male_KeepItUp_31
	playsound Male_KeepItUp_30
	playsound Male_KeepItUp_29
	playsound Male_KeepItUp_28
	playsound Male_KeepItUp_27
	playsound Male_KeepItUp_26
	playsound Male_KeepItUp_25
	playsound Male_KeepItUp_24
	playsound Male_KeepItUp_23
	playsound Male_KeepItUp_22
	playsound Male_KeepItUp_21
	playsound Male_KeepItUp_20
	playsound Male_KeepItUp_19
	playsound Male_KeepItUp_18
	playsound Male_KeepItUp_17
	playsound Male_KeepItUp_16
	playsound Male_KeepItUp_15
	playsound Male_KeepItUp_14
	playsound Male_KeepItUp_13
	playsound Male_KeepItUp_12
	playsound Male_KeepItUp_11
	playsound Male_KeepItUp_10
	playsound Male_KeepItUp_09
	playsound Male_KeepItUp_08
	playsound Male_KeepItUp_07
	playsound Male_KeepItUp_06
	playsound Male_KeepItUp_05
	playsound Male_KeepItUp_04
	playsound Male_KeepItUp_03
	playsound Male_KeepItUp_02
	playsound Male_KeepItUp_01
	playsound Male_KeepItUp_40
	playsound Female_KeepItUp_19
	playsound Female_KeepItUp_18
	playsound Female_KeepItUp_17
	playsound Female_KeepItUp_16
	playsound Female_KeepItUp_15
	playsound Female_KeepItUp_14
	playsound Female_KeepItUp_13
	playsound Female_KeepItUp_12
	playsound Female_KeepItUp_11
	playsound Female_KeepItUp_10
	playsound Female_KeepItUp_09
	playsound Female_KeepItUp_08
	playsound Female_KeepItUp_07
	playsound Female_KeepItUp_06
	playsound Female_KeepItUp_05
	playsound Female_KeepItUp_04
	playsound Female_KeepItUp_03
	playsound Female_KeepItUp_02
	playsound Female_KeepItUp_01
	playsound Female_KeepItUp_20
	playsound Sk8_Terr_Sidewalk_Click_06
	playsound Sk8_Terr_Sidewalk_Click_05
	playsound Sk8_Terr_Sidewalk_Click_04
	playsound Sk8_Terr_Sidewalk_Click_03
	playsound Sk8_Terr_Sidewalk_Click_02
	playsound Sk8_Terr_Sidewalk_Click_01
	playsound Sk8_Terr_Sidewalk_Clack_07
	playsound Sk8_Terr_Sidewalk_Clack_06
	playsound Sk8_Terr_Sidewalk_Clack_05
	playsound Sk8_Terr_Sidewalk_Clack_04
	playsound Sk8_Terr_Sidewalk_Clack_03
	playsound Sk8_Terr_Sidewalk_Clack_02
	playsound Sk8_Terr_Sidewalk_Clack_01
	playsound Sk8_Terr_Sidewalk_Click_07
	playsound SK8_Large_Fan
	playsound SK8_Bouncy_AlumTrashCan_Bounce_02M
	playsound SK8_Bouncy_AlumTrashCan_Bounce_01M
	playsound SK8_Bouncy_AlumTrashCan_Bounce_03M
	playsound SK8_Bouncy_ConcBlock_Collide_01
	playsound SK8_Bouncy_ConcBlock_Bounce_03
	playsound SK8_Bouncy_ConcBlock_Bounce_02
	playsound SK8_Bouncy_ConcBlock_Bounce_01
	playsound SK8_Bouncy_ConcBlock_Collide_02
	playsound SK8_Bouncy_Pendulum_Collide_01
	playsound SK8_Bouncy_Pendulum_Bounce_03
	playsound SK8_Bouncy_Pendulum_Bounce_02
	playsound SK8_Bouncy_Pendulum_Bounce_01
	playsound SK8_Bouncy_Pendulum_Collide_02
	playsound SK8_Bouncy_ConcBlock_Bounce_02_rev
	playsound SK8_Bouncy_ConcBlock_Bounce_01_rev
	playsound SK8_Bouncy_ConcBlock_Bounce_03_rev
endscript

script sk9_CAS_YOU_BailInitSmGrunt 
	RandomNoRepeat (
		@ skater :obj_playsound male_smbail_01 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_smbail_07 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_smbail_08 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_smbail_09 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		)
endscript

script sk9_CAS_YOU_BailSmGrunt 
	setspawnedscriptnorepeatfor time = 0.8
	setspawninstancelimits max = 1 management = kill_oldest
	RandomNoRepeat (
		@ skater :obj_playsound male_smbail_02 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_smbail_03 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_smbail_04 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_smbail_05 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_smbail_06 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_lgbail_04 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_lgbail_05 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		)
endscript

script sk9_CAS_YOU_BailLgGrunt 
	setspawnedscriptnorepeatfor time = 1.4
	setspawninstancelimits max = 1 management = kill_oldest
	RandomNoRepeat (
		@ skater :obj_playsound male_lgbail_09 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_lgbail_03 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_lgbail_04 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_lgbail_05 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_lgbail_08 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		)
endscript

script sk9_CAS_YOU_BailInitLgGrunt 
	RandomNoRepeat (
		@ skater :obj_playsound male_lgbail_06 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_lgbail_07 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_lgbail_10 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_lgbail_01 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		@ skater :obj_playsound male_lgbail_02 vol = RandomRange (305.0, 330.0) pitch = RandomRange (95.0, 105.0)
		)
endscript

script BG_OneShot_Bmore_City 
	if iscreated z_bcity_SFX_z_bcity_SFX_oneshots_object1
		begin
		wait 3 seconds
		if (PauseOneshotsCheck = 0)
			RandomNoRepeat (
				@ playsound sk9_BG_1shot_Bmore_City_Bus1 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 13 seconds
				@ playsound sk9_BG_1shot_Bmore_City_Bus2 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 10 seconds
				@ playsound sk9_BG_1shot_Bmore_City_Bus3 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 9 seconds
				@ playsound sk9_BG_1shot_Bmore_City_Car1 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 9 seconds
				@ playsound sk9_BG_1shot_Bmore_City_Car2 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 7 seconds
				@ playsound sk9_BG_1shot_Bmore_City_Car3 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 9 seconds
				@ playsound sk9_BG_1shot_Bmore_City_Car4 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 9 seconds
				@ playsound sk9_BG_1shot_Bmore_City_Car5 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 9 seconds
				@ playsound sk9_BG_1shot_Bmore_City_CarHorn1 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 5 seconds
				@ playsound sk9_BG_1shot_Bmore_City_CarHorn2 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 6 seconds
				@ SafePlaySound obj = z_bcity_SFX_z_bcity_SFX_oneshots_object1 sk9_BG_1shot_Bmore_City_ChurchBell1 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 33 seconds
				@ SafePlaySound obj = z_bcity_SFX_z_bcity_SFX_oneshots_object1 sk9_BG_1shot_Bmore_City_ChurchBell2 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 26 seconds
				@ playsound sk9_BG_1shot_Bmore_City_Train1 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 22 seconds
				@ playsound sk9_BG_1shot_Bmore_Harbor_Plane1 priority = $streamprioritylow vol = RandomRange (80.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 20 seconds
				)
		endif
		wait RandomRange (5.0, 10.0) seconds
		repeat
	endif
endscript

script BG_OneShot_Bmore_Harbor 
	begin
	HarborGhostObject = RandomNoRepeat (@ z_harbor_SFX_z_harbor_SFX_oneshots_object1 @ z_harbor_SFX_z_harbor_SFX_oneshots_object2 @ z_harbor_SFX_z_harbor_SFX_oneshots_object3 @ z_harbor_SFX_z_harbor_SFX_oneshots_object4 )
	if (PauseOneshotsCheck = 0)
		if iscreated <HarborGhostObject>
			RandomNoRepeat (
				@ <HarborGhostObject> :obj_playsound sk9_BG_1shot_Bmore_Harbor_Bell1 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 10 seconds
				@ playsound sk9_BG_1shot_Bmore_Harbor_Gull1 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 2 seconds
				@ playsound sk9_BG_1shot_Bmore_Harbor_Gull2 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 2 seconds
				@ playsound sk9_BG_1shot_Bmore_Harbor_Gull3 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 5 seconds
				@ SafePlaySound obj = <HarborGhostObject> sk9_BG_1shot_Bmore_Harbor_Horn1 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 6 seconds
				@ SafePlaySound obj = <HarborGhostObject> sk9_BG_1shot_Bmore_Harbor_Horn2 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 3 seconds
				@ playsound sk9_BG_1shot_Bmore_Harbor_Plane1 priority = $streamprioritylow vol = RandomRange (75.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 20 seconds
				@ playsound sk9_BG_1shot_Bmore_Harbor_Plane2 priority = $streamprioritylow vol = RandomRange (75.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
				wait 26 seconds
				)
		endif
	endif
	wait RandomRange (15.0, 20.0) seconds
	repeat
endscript

script BG_OneShot_Bmore_Lansdowne 
	begin
	wait RandomRange (2.0, 6.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ playsound sk8_BG_1shot_CretePark_01 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_02 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_03 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_04 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_05 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_06 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_07 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_08 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_09 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_10 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_11 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_12 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_13 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_14 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_15 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_16 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_17 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_BG_1shot_CretePark_18 priority = $streamprioritylow vol = RandomRange (75.0, 100.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_1shot_Lansdowne_dog1 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_1shot_Lansdowne_dog2 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_1shot_Lansdowne_dog3 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_1shot_Bmore_Harbor_Plane2 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (6.0, 10.0) seconds
	repeat
endscript

script BG_OneShot_Bmore_Roofs 
	begin
	wait RandomRange (5.0, 10.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ playsound sk9_BG_1shot_Bmore_Harbor_Plane1 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_1shot_Bmore_Harbor_Plane2 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (25.0, 30.0) seconds
	repeat
endscript

script BG_OneShot_DC_City 
	begin
	wait RandomRange (23.0, 30.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ playsound sk9_BG_1shot_DC_City_heli1 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_1shot_DC_City_heli2 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_1shot_DC_City_heli3 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (39.0, 49.0) seconds
	repeat
endscript

script BG_OneShot_DC_Museums 
	begin
	wait RandomRange (3.0, 10.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ playsound sk9_BG_1shot_DC_museums_baby priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_1shot_DC_museums_vending priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (30.0, 40.0) seconds
	repeat
endscript

script BG_OneShot_DC_Roofs 
	begin
	wait RandomRange (3.0, 10.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ playsound sk9_BG_1shot_DC_City_heli1 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_1shot_DC_City_heli2 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_1shot_DC_City_heli3 priority = $streamprioritylow vol = RandomRange (70.0, 90.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (39.0, 49.0) seconds
	repeat
endscript

script BG_OneShot_Moon 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ playsound DC_Moon_beep1 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound DC_Moon_beep2 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound DC_Moon_crash priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound DC_Moon_fall1 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound DC_Moon_fall2 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound DC_Moon_hatch priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound DC_Moon_launch priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound DC_Moon_windwoosh1 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound DC_Moon_windwoosh2 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (13.0, 25.0) seconds
	repeat
endscript

script BG_OneShot_Philly_Slums 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ playsound sk8_bg_1shot_ghetto_alrm_01 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_alrm_02 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_dog_01 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_dog_02 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_dog_03 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_dog_04 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_dog_05 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_dog_06 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_dog_07 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_dog_08 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_sirn_02 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_sirn_03 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_sirn_04 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_sirn_05 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_sirn_06 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_sirn_08 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_sirn_09 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_OneShot_Slums_Siren_01 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (13.0, 25.0) seconds
	repeat
endscript

script BG_OneShot_Philly_City 
	begin
	wait RandomRange (3.0, 8.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ playsound sk8_bg_1shot_ghetto_sirn_06 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_sirn_08 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk8_bg_1shot_ghetto_sirn_09 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_OneShot_Slums_Siren_01 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_City_Crow_Caw_01 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_City_Crow_Caw_02 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_City_Crow_Caw_03 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_City_Crow_Caw_04 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (13.0, 25.0) seconds
	repeat
endscript

script BG_OneShot_Philly_City_Parking 
	begin
	wait RandomRange (3.0, 8.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ playsound sk9_Philly_Parking_Alarm_01 priority = $streamprioritylow vol = RandomRange (30.0, 50.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_Parking_Alarm_02 priority = $streamprioritylow vol = RandomRange (30.0, 50.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_Parking_Alarm_03 priority = $streamprioritylow vol = RandomRange (30.0, 50.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_Parking_Starter_01 priority = $streamprioritylow vol = RandomRange (30.0, 50.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_Parking_Starter_02 priority = $streamprioritylow vol = RandomRange (30.0, 50.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_Parking_Tires_01 priority = $streamprioritylow vol = RandomRange (30.0, 50.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_Parking_Tires_02 priority = $streamprioritylow vol = RandomRange (30.0, 50.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_Philly_Parking_Tires_03 priority = $streamprioritylow vol = RandomRange (30.0, 50.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (5.0, 8.0) seconds
	repeat
endscript

script BG_OneShot_Bridges 
	begin
	wait RandomRange (3.0, 8.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ playsound sk9_BG_Oneshot_Seagull_01 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_Oneshot_Seagull_02 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_Oneshot_Seagull_03 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			@ playsound sk9_BG_Oneshot_Seagull_04 priority = $streamprioritylow vol = RandomRange (50.0, 70.0) pan1x = RandomRange (-1.0, 1.0) pan1y = RandomRange (-1.0, 1.0) id = SFX_Oneshots dropoff = 2000 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (13.0, 25.0) seconds
	repeat
endscript

script TurfWar_LandOnObject_HitTarget2 
	playsound \{sk8_goal_turfwar_04
		pitch_semitones = 1}
endscript

script TurfWar_LandOnObject_HitTarget3 
	playsound \{sk8_goal_turfwar_04
		pitch_semitones = 2}
endscript
Skater_landing_Explosion_SFX_struct = {
	default_priority = 50
	default_buss = ExploLandFXSounds
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 4
}

script Skater_landing_Explosion_SFX 
endscript

script Object_Wait_Then_Die 
	waittime = 3
	wait <waittime> seconds
	die
endscript

script Skaters_Eye_Into 
	printpushpopdebuginfo \{push
		name = "Skaters_Eye_Into"}
	pushsoundbussparams
	if ($global_user_sfx_number = 0)
		setsoundbussparams \{$default_bussset
			time = 0.5}
	else
		setsoundbussparams \{$Skaters_Eye_BussSet
			time = 0.5}
	endif
	playsound \{SK8_Skater_Eye_Transition}
endscript

script Skaters_Eye_OutOf 
	printpushpopdebuginfo \{pop
		name = "Skaters_Eye_OutOf"}
	popsoundbussparams
	playsound \{SK8_Skater_Eye_Transition
		pitch = 123
		vol = 50}
endscript

script Goal_UI_Negative_Text 
	wait \{0.15
		seconds}
	playsound \{small_negative_message_01
		vol = 70}
endscript

script PlayTrainingVO 
	stopsoundevent \{PlayTrainingVOSoundEvent}
	if gotparam \{filename}
		soundevent event = PlayTrainingVOSoundEvent filename = <filename>
	endif
	if gotparam \{wait}
		wait <waittime> seconds
	endif
endscript

script Medal_Screen_Am 
	wait \{0.2
		seconds}
	playsound \{sk9_MidGoal_Am
		vol = 80}
endscript

script Medal_Screen_Pro 
	wait \{0.2
		seconds}
	playsound \{sk9_MidGoal_Am
		vol = 80}
	wait \{0.5
		seconds}
	playsound \{sk9_MidGoal_Pro
		vol = 80}
endscript

script Medal_Screen_Sick 
	wait \{0.2
		seconds}
	playsound \{sk9_MidGoal_Am
		vol = 70}
	wait \{0.5
		seconds}
	playsound \{sk9_MidGoal_Pro
		vol = 70}
	wait \{0.5
		seconds}
	playsound \{sk9_MidGoal_Sick
		vol = 80}
endscript

script Goal_UI_Positive_Text 
	wait \{5
		gameframes}
	playsound \{small_positive_message_01
		vol = 50}
endscript

script PlayTrainingVOSoundEvent 
	playsound <filename> vol = 200
endscript

script Graffiti_Opponent_Stole_From_You_SFX 
	wait \{0.120000005
		seconds}
	playsound \{HUDtrickslopC
		vol = 60}
endscript

script Graffiti_You_Stole_From_An_Opponent_SFX 
	wait \{0.15
		seconds}
	playsound \{Graffiti_Stole_From_Other
		vol = 130}
endscript

script Crowd_Ped_Wait_Then_Play 
	wait \{1
		second
		ignoreslomo}
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_BIG}
endscript

script sk8_Blocker_SecGuard_Notice 
endscript

script Online_Generic_You_Took_The_Lead_SFX 
	wait \{0.15
		seconds}
	playsound \{Graffiti_Stole_From_Other
		vol = 130}
endscript

script Online_Generic_Other_Took_Lead_From_You_SFX 
	wait \{0.120000005
		seconds}
	playsound \{HUDtrickslopC
		vol = 60}
endscript

script Online_Generic_You_Won_Screen_SFX 
	wait \{0.2
		seconds}
	playsound \{sk9_MidGoal_Am
		vol = 70}
	wait \{0.5
		seconds}
	playsound \{sk9_MidGoal_Pro
		vol = 70}
	wait \{0.5
		seconds}
	playsound \{sk9_MidGoal_Sick
		vol = 80}
endscript

script Online_Walls_You_Took_Someone_Out_SFX 
	wait \{0.15
		seconds}
	playsound \{Graffiti_Stole_From_Other
		vol = 130}
endscript

script Online_Walls_Someone_Took_You_Out_SFX 
	wait \{0.120000005
		seconds}
	playsound \{HUDtrickslopC
		vol = 60}
endscript

script CAS_SFX_Skater_Change_Accessory 
	switch <desc_id>
		case ElbowPads
		case none
		playsound \{placeholder}
		default
		playsound \{CAS_Change_Accessory}
	endswitch
endscript

script RankUp_Tick 
	if gotparam tickcountdown
		switch <tickcountdown>
			case 5
			playsound SK8_Rank_Up5_highlight vol = 96 pitch = 50
			case 4
			playsound SK8_Rank_Up5_highlight vol = 112 pitch = 66.742
			case 3
			playsound SK8_Rank_Up5_highlight vol = 120 pitch = 74.916
			case 2
			playsound SK8_Rank_Up5_highlight vol = 128 pitch = 84.08988
			case 1
			playsound SK8_Rank_Up5_highlight vol = 136 pitch = 94.387436
			default
			printf "do nothing"
		endswitch
	endif
endscript

script RankUp_5_Highlight 
	playsound \{SK8_Rank_Up5_appear_version1
		vol = 56}
	playsound \{SK8_Rank_Up5_highlight
		vol = 120}
	playsound \{SK8_Rank_Up5_highlight
		vol = 80
		pitch = 200}
endscript

script UI_Menu_Rank_Screen_Page_Thru_SFX 
	thispitch = (200 - (<next_ranking> / 2))
	playsound sk8_NTT_boardspin_02 pitch = <thispitch>
endscript

script CAS_Jump_Land_In_Room_SFX 
	if gotparam \{fem}
		wait \{0.2
			seconds}
	else
		wait \{0.3
			seconds}
	endif
	Random (
		@ playsound \{sk8_wood_feet_land_01}
		@ playsound \{sk8_wood_feet_land_02}
		)
	sk8_Play_VO \{votype = landgrunt_large}
endscript

script Goal_Comp_Announcer_Scores_VO 
	wait \{1
		seconds}
	RandomNoRepeat (
		@ playsound \{sk8_CompAnnouncer_scores_5
			vol = 75}
		@ playsound \{sk8_CompAnnouncer_scores_4
			vol = 75}
		@ playsound \{sk8_CompAnnouncer_scores_3
			vol = 75}
		@ playsound \{sk8_CompAnnouncer_scores_2
			vol = 75}
		@ playsound \{sk8_CompAnnouncer_scores_1
			vol = 75}
		)
endscript

script Goal_Comp_Announcer_Callout_VO 
	wait \{1.5
		seconds}
	RandomNoRepeat (
		@ playsound \{sk8_CompAnnouncer_comp_1
			vol = 75}
		@ playsound \{sk8_CompAnnouncer_comp_2
			vol = 75}
		@ playsound \{sk8_CompAnnouncer_comp_3
			vol = 75}
		@ playsound \{sk8_CompAnnouncer_comp_4
			vol = 75}
		@ playsound \{sk8_CompAnnouncer_comp_5
			vol = 75}
		)
endscript

script Goal_Comp_Crowd_Pre_Run 
	if gotparam \{bracket}
		switch <bracket>
			case pro
			playsound \{Comp_Crowd_Pro
				vol = 400}
			case sick
			playsound \{Comp_Crowd_Sick
				vol = 300}
			case am
			playsound \{Comp_Crowd_Am
				vol = 130}
			case prelim
			playsound \{Comp_Crowd_Prelim}
		endswitch
	endif
endscript

script Break_Metal_Large_SFX 
	obj_spawnscriptnow \{Object_Wait_Then_Die
		params = {
			waittime = 2.0
		}}
	RandomNoRepeat (
		@ obj_playsound \{SK8_Metal_Fence_Break_02}
		@ obj_playsound \{SK8_Metal_Fence_Break_01}
		)
endscript

script Fence_Lansdowne 
	playsound \{SK8_Metal_Fence_Break_01
		vol = 50
		pitch = 110}
	playsound \{sk8_bonk_ChainlinkFence_06
		vol = 350}
	playsound \{BonkChainlink
		vol = 50}
	wait \{0.3
		seconds}
	playsound \{sk8_bonk_ChainlinkFence_04
		vol = 250}
endscript

script Fence_Lansdowne_Shatter 
	playsound \{SK8_Metal_Fence_Break_01
		vol = 150
		pitch = 130}
	playsound \{sk8_bonk_ChainlinkFence_06
		vol = 350}
	wait \{0.3
		seconds}
	playsound \{sk8_bonk_ChainlinkFence_05
		vol = 150}
endscript

script Fence_Lansdowne_BIG 
	playsound \{SK8_Explode_Chain_Link
		vol = 150
		pitch = 160}
	playsound \{sk8_bonk_ChainlinkFence_04
		vol = 400}
	playsound \{BonkChainlink
		vol = 60}
	wait \{0.3
		seconds}
	playsound \{sk8_bonk_ChainlinkFence_03
		vol = 250}
endscript

script Metal_Fence_Break_SFX 
	obj_spawnscriptnow \{Object_Wait_Then_Die
		params = {
			waittime = 2.0
		}}
	RandomNoRepeat (
		@ obj_playsound \{SK8_Metal_Fence_Break_02}
		@ obj_playsound \{SK8_Metal_Fence_Break_01}
		)
endscript

script chair_break_sfx 
	obj_spawnscriptnow \{Object_Wait_Then_Die
		params = {
			waittime = 2.0
		}}
	RandomNoRepeat (
		@ obj_playsound \{SK8_WoodBreak_Explode_02
			dropoff = 100
			dropoff_function = standard
			vol = 40
			pitch = 150}
		@ obj_playsound \{SK8_WoodBreak_Explode_01
			dropoff = 100
			dropoff_function = standard
			vol = 40
			pitch = 150}
		@ obj_playsound \{SK8_WoodBreak_Explode_03
			dropoff = 100
			dropoff_function = standard
			vol = 40
			pitch = 150}
		)
endscript

script plywood_break_sfx 
	obj_spawnscriptnow \{Object_Wait_Then_Die
		params = {
			waittime = 2.0
		}}
	RandomNoRepeat (
		@ obj_playsound \{SK8_WoodBreak_Explode_02
			dropoff = 100
			dropoff_function = standard
			vol = 40}
		@ obj_playsound \{SK8_WoodBreak_Explode_01
			dropoff = 100
			dropoff_function = standard
			vol = 40}
		@ obj_playsound \{SK8_WoodBreak_Explode_03
			dropoff = 100
			dropoff_function = standard
			vol = 40}
		)
endscript

script Slalom_Wood_Fence_Break_SFX 
	obj_spawnscriptnow \{Object_Wait_Then_Die
		params = {
			waittime = 2.0
		}}
	RandomNoRepeat (
		@ playsound \{SK8_WoodBreak_Explode_02
			dropoff = 100
			dropoff_function = standard
			vol = 90}
		@ playsound \{SK8_WoodBreak_Explode_01
			dropoff = 100
			dropoff_function = standard
			vol = 90}
		@ playsound \{SK8_WoodBreak_Explode_03
			dropoff = 100
			dropoff_function = standard
			vol = 90}
		)
endscript

script shoulder_check_SFX 
	RandomNoRepeat (
		@ obj_playsound SK9_shoulder_check_wsh1 pitch = RandomRange (85.0, 115.0) vol = RandomRange (150.0, 180.0)
		@ obj_playsound SK9_shoulder_check_wsh2 pitch = RandomRange (85.0, 115.0) vol = RandomRange (150.0, 180.0)
		)
	wait 0.07 seconds
	RandomNoRepeat (
		@ obj_playsound SK9_shoulder_check_imp1 pitch = RandomRange (85.0, 115.0) vol = RandomRange (200.0, 250.0)
		@ obj_playsound SK9_shoulder_check_imp2 pitch = RandomRange (85.0, 115.0) vol = RandomRange (200.0, 250.0)
		)
	RandomNoRepeat (
		@ obj_playsound SK9_shoulder_check_crck1 pitch = RandomRange (85.0, 115.0) vol = RandomRange (175.0, 225.0)
		@ obj_playsound SK9_shoulder_check_crck2 pitch = RandomRange (85.0, 115.0) vol = RandomRange (175.0, 225.0)
		@ obj_playsound SK9_shoulder_check_crck3 pitch = RandomRange (85.0, 115.0) vol = RandomRange (175.0, 225.0)
		)
	RandomNoRepeat (
		@ obj_playsound SK9_shoulder_check_bass1 pitch = RandomRange (85.0, 115.0) vol = RandomRange (250.0, 300.0)
		@ obj_playsound SK9_shoulder_check_bass2 pitch = RandomRange (85.0, 115.0) vol = RandomRange (250.0, 300.0)
		@ obj_playsound SK9_shoulder_check_bass3 pitch = RandomRange (85.0, 115.0) vol = RandomRange (250.0, 300.0)
		)
	RandomNoRepeat (
		@ obj_playsound SK9_shoulder_check_clth1 pitch = RandomRange (85.0, 115.0) vol = RandomRange (175.0, 225.0)
		@ obj_playsound SK9_shoulder_check_clth2 pitch = RandomRange (85.0, 115.0) vol = RandomRange (175.0, 225.0)
		@ obj_playsound SK9_shoulder_check_clth3 pitch = RandomRange (85.0, 115.0) vol = RandomRange (175.0, 225.0)
		@ obj_playsound SK9_shoulder_check_clth4 pitch = RandomRange (85.0, 115.0) vol = RandomRange (175.0, 225.0)
		)
	RandomNoRepeat (
		@ obj_playsound BailBodyFall03 pitch = RandomRange (85.0, 115.0) vol = RandomRange (175.0, 225.0)
		@ obj_playsound BailBodyFall01 pitch = RandomRange (85.0, 115.0) vol = RandomRange (175.0, 225.0)
		@ obj_playsound BailBodyFall04 pitch = RandomRange (85.0, 115.0) vol = RandomRange (175.0, 225.0)
		)
endscript

script NTG_Grab_Board_SFX 
	RandomNoRepeat (
		@ obj_playsound \{sk9_NTG_Foley_Grab_01
			vol = 400}
		@ obj_playsound \{sk9_NTG_Foley_Grab_02
			vol = 400}
		@ obj_playsound \{sk9_NTG_Foley_Grab_03
			vol = 400}
		@ obj_playsound \{sk9_NTG_Foley_Grab_04
			vol = 400}
		)
endscript

script NTG_FingerFlip_Start_SFX 
	RandomNoRepeat (
		@ obj_playsound \{sk9_NTG_Foley_Grab_01
			vol = 300}
		@ obj_playsound \{sk9_NTG_Foley_Grab_02
			vol = 300}
		)
endscript

script NTG_FingerFlip_SFX 
	obj_playsound \{sk8_NTT_boardspin_02
		pitch = 140}
endscript

script Music_Update_Playlist_Bmore 
	if inside
		SetPlaylistGenreWeights \{master
			metal = 25
			punk = 20
			rock = 15
			hiphop = 10
			FreeMuzik = 1}
	else
		if gotparam \{destroyed}
		else
			if gotparam \{created}
			else
			endif
		endif
	endif
endscript

script Music_Update_Playlist_DC 
	if inside
		SetPlaylistGenreWeights \{master
			metal = 45
			punk = 75
			rock = 60
			hiphop = 30
			FreeMuzik = 1}
	else
		if gotparam \{destroyed}
		else
			if gotparam \{created}
			else
			endif
		endif
	endif
endscript

script Music_Update_Playlist_Philly 
	if inside
		SetPlaylistGenreWeights \{master
			metal = 21
			punk = 45
			rock = 60
			hiphop = 75
			FreeMuzik = 0}
	else
		if gotparam \{destroyed}
		else
			if gotparam \{created}
			else
			endif
		endif
	endif
endscript

script sk9_AgroKick_BreathInhale 
	wait \{0.2
		seconds}
	RandomNoRepeat (
		@ skater :obj_playsound sk9_AgroKick_Vox_Breath01 pitch = RandomRange (90.0, 100.0) vol = RandomRange (150.0, 200.0)
		@ skater :obj_playsound sk9_AgroKick_Vox_Breath02 pitch = RandomRange (90.0, 100.0) vol = RandomRange (150.0, 200.0)
		@ skater :obj_playsound sk9_AgroKick_Vox_Breath03 pitch = RandomRange (90.0, 100.0) vol = RandomRange (150.0, 200.0)
		@ skater :obj_playsound sk9_AgroKick_Vox_Breath04 pitch = RandomRange (90.0, 100.0) vol = RandomRange (150.0, 200.0)
		)
endscript
AgroKickBadMode = 0

script Aggro_Kick_Bad_SFX 
	if (($AgroKickBadMode) = 1)
		RandomNoRepeat (
			@ playsound sk9_aggro_kick_bad1 vol = 175
			@ playsound sk9_aggro_kick_bad2 vol = 175
			)
		RandomNoRepeat (
			@ playsound sk9_AgroKick_Vox_Med01 vol = 250
			@ 
			@ 
			@ 
			@ 
			@ playsound sk9_AgroKick_Vox_Med02 vol = 250
			@ playsound sk9_AgroKick_Vox_Med03 vol = 250
			)
	endif
endscript

script Aggro_Kick_Bad_Switcher 
	if NOT (($AgroKickBadMode) = 1)
		change \{AgroKickBadMode = 1}
	endif
	wait \{0.2
		seconds}
	if NOT (($AgroKickBadMode) = 0)
		change \{AgroKickBadMode = 0}
	endif
endscript
epicpush_soundbuss_active = 0

script sk9_AgroKick_BoostWhoosh 
	getspeed
	if (<speed> < 5)
		<speed> = 5
	endif
	if (<speed> > 12)
		<speed> = 12
	endif
	if (($epicpush_soundbuss_active) = 0)
		if (($focus_mode_buss_set_active) = 0)
			if (($ntt_soundbuss_active) = 0)
				change epicpush_soundbuss_active = 1
				printpushpopdebuginfo push name = "sk9_AgroKick_BoostWhoosh"
				pushsoundbussparams
				setsoundbussparams $Agro_Kick_Mode_BussSet time = 0.5
			endif
		endif
	endif
	RandomNoRepeat (
		@ skater :obj_playsound sk9_AgroKick_FootGrit vol = (<speed> * 6) pitch = RandomRange (85.0, 100.0)
		@ skater :obj_playsound sk9_AgroKick_FootGrit2 vol = (<speed> * 6) pitch = RandomRange (85.0, 100.0)
		)
	if (<BoostSFXvol> > 4.0)
		RandomNoRepeat (
			@ skater :obj_playsound sk9_AgroKick_Vox_Hi03 vol = RandomRange (115.0, 125.0) pitch = RandomRange (95.0, 105.0)
			@ skater :obj_playsound sk9_AgroKick_Vox_Hi02 vol = RandomRange (115.0, 125.0) pitch = RandomRange (95.0, 105.0)
			@ skater :obj_playsound sk9_AgroKick_Vox_Hi01 vol = RandomRange (115.0, 125.0) pitch = RandomRange (95.0, 105.0)
			)
	endif
	if (<BoostSFXvol> > 2.0)
		RandomNoRepeat (
			@ skater :obj_playsound sk9_AgroKick_Vox_Med03 vol = RandomRange (125.0, 135.0) pitch = RandomRange (95.0, 105.0)
			@ skater :obj_playsound sk9_AgroKick_Vox_Med02 vol = RandomRange (125.0, 135.0) pitch = RandomRange (95.0, 105.0)
			@ skater :obj_playsound sk9_AgroKick_Vox_Med01 vol = RandomRange (125.0, 135.0) pitch = RandomRange (95.0, 105.0)
			)
	endif
	if (<BoostSFXvol> > 0.5)
		RandomNoRepeat (
			@ skater :obj_playsound sk9_AgroKick_Vox_Low03 vol = RandomRange (115.0, 125.0) pitch = RandomRange (95.0, 105.0)
			@ skater :obj_playsound sk9_AgroKick_Vox_Low02 vol = RandomRange (115.0, 125.0) pitch = RandomRange (95.0, 105.0)
			@ skater :obj_playsound sk9_AgroKick_Vox_Low01 vol = RandomRange (115.0, 125.0) pitch = RandomRange (95.0, 105.0)
			)
	endif
	wait 0.5 seconds
	if ($epicpush_soundbuss_active = 1)
		if (($focus_mode_buss_set_active) = 0)
			if (($ntt_soundbuss_active) = 0)
				change epicpush_soundbuss_active = 0
				printpushpopdebuginfo pop name = "sk9_AgroKick_BoostWhoosh - epicpush_soundbuss_active = 1, others equal 0 "
				popsoundbussparams
			endif
		endif
	endif
endscript

script sk9_agro_woosh_SFX 
	getspeed
	agro_woosh_vol = ((<speed> * 14) + 50)
	if (<agro_woosh_vol> > 400)
		agro_woosh_vol = 400
	endif
	agro_woosh_pitch = ((<speed> * 4) + 55)
	if (<agro_woosh_pitch> > 200)
		agro_woosh_pitch = 200
	endif
	wshsoundpan = 0.3
	playsound sk9_agro_woosh vol = <agro_woosh_vol> pitch = <agro_woosh_pitch> pan1y = <wshsoundpan>
	begin
	if issoundplaying sk9_agro_woosh
		wshsoundpan = (<wshsoundpan> -0.2)
		if (<wshsoundpan> < -0.9)
			wshsoundpan = -1.0
		endif
		setsoundparams sk9_agro_woosh pan1y = <wshsoundpan>
	else
		return
	endif
	wait 1 gameframes
	repeat
endscript

script sk9_wall_boost_SFX 
	wait \{0.35000002
		seconds}
	RandomNoRepeat (
		@ skater :obj_playsound \{sk8_terr_roof_scuff_02
			vol = 160}
		@ skater :obj_playsound \{sk8_terr_roof_scuff_05
			vol = 160}
		)
	skater :obj_playsound \{sk9_agro_woosh
		vol = 250}
endscript

script sk9_car_boost_SFX 
	RandomNoRepeat (
		@ skater :obj_playsound \{SK8_CarHood_Runstep_02
			vol = 250
			pitch = 200}
		@ skater :obj_playsound \{SK8_CarHood_Runstep_03
			vol = 250
			pitch = 200}
		)
	skater :obj_playsound \{sk8_CarHood_Footland_01
		vol = 300}
	skater :obj_playsound \{sk8_CarHood_Revert_02
		vol = 150}
	skater :obj_playsound \{sk9_agro_woosh
		vol = 250}
endscript

script sk9_FDR_CarBy_01 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound \{sk9_FDR_CarBy_01
				vol = 50
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_01
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarBy_02
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_01
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarBy_03
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_01
				dropoff_function = inv_exponential}
			)
	endif
	wait RandomRange (5.0, 8.0) seconds
	repeat
endscript

script sk9_FDR_CarBy_02 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound \{sk9_FDR_CarBy_01
				vol = 50
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_02
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarBy_02
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_02
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarBy_03
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_02
				dropoff_function = inv_exponential}
			)
	endif
	wait RandomRange (5.0, 8.0) seconds
	repeat
endscript

script sk9_FDR_CarBy_03 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound \{sk9_FDR_CarByUnder_01
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_03
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarByUnder_02
				vol = 150
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_03
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarByUnder_03
				vol = 150
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_03
				dropoff_function = inv_exponential}
			)
	endif
	wait RandomRange (5.0, 8.0) seconds
	repeat
endscript

script sk9_FDR_CarBy_04 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound \{sk9_FDR_CarByUnder_01
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_04
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarByUnder_02
				vol = 150
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_04
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarByUnder_03
				vol = 150
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_04
				dropoff_function = inv_exponential}
			)
	endif
	wait RandomRange (5.0, 8.0) seconds
	repeat
endscript

script sk9_FDR_CarBy_05 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound \{sk9_FDR_CarByUnder_01
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_05
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarByUnder_02
				vol = 150
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_05
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarByUnder_03
				vol = 150
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_05
				dropoff_function = inv_exponential}
			)
	endif
	wait RandomRange (5.0, 8.0) seconds
	repeat
endscript

script sk9_FDR_CarBy_06 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound \{sk9_FDR_CarByUnder_01
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_06
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarByUnder_02
				vol = 150
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_06
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarByUnder_03
				vol = 150
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_06
				dropoff_function = inv_exponential}
			)
	endif
	wait RandomRange (5.0, 8.0) seconds
	repeat
endscript

script sk9_FDR_CarBy_07 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound \{sk9_FDR_CarByUnder_01
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_07
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarByUnder_02
				vol = 150
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_07
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarByUnder_03
				vol = 150
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_07
				dropoff_function = inv_exponential}
			)
	endif
	wait RandomRange (5.0, 8.0) seconds
	repeat
endscript

script sk9_FDR_CarBy_08 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound \{sk9_FDR_CarBy_01
				vol = 50
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_08
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarBy_02
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_08
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarBy_03
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_08
				dropoff_function = inv_exponential}
			)
	endif
	wait RandomRange (5.0, 8.0) seconds
	repeat
endscript

script sk9_FDR_CarBy_09 
	begin
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound \{sk9_FDR_CarBy_01
				vol = 50
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_09
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarBy_02
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_09
				dropoff_function = inv_exponential}
			@ obj_playsound \{sk9_FDR_CarBy_03
				emitter = z_fdr_SFX_SFX_Emitter_FDR_Carby_09
				dropoff_function = inv_exponential}
			)
	endif
	wait RandomRange (5.0, 8.0) seconds
	repeat
endscript

script sk9_BW_Bridge_Ship_Horn_01 
	begin
	wait RandomRange (5.0, 10.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound sk9_OneShot_Bridge_Horn_01 vol = RandomRange (20.0, 30.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Horn_01 dropoff_function = inv_exponential
			@ obj_playsound sk9_OneShot_Bridge_Horn_02 vol = RandomRange (20.0, 30.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Horn_01 dropoff_function = inv_exponential
			@ obj_playsound sk9_BG_1shot_Bmore_Harbor_Horn1 vol = RandomRange (50.0, 70.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Horn_01 dropoff_function = inv_exponential
			@ obj_playsound sk9_BG_1shot_Bmore_Harbor_Horn2 vol = RandomRange (50.0, 70.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Horn_01 dropoff_function = inv_exponential
			@ obj_playsound sk9_BG_1shot_Bmore_Harbor_Bell1 vol = RandomRange (50.0, 70.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Horn_01 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (10.0, 15.0) seconds
	repeat
endscript

script sk9_BW_Bridge_Ship_Horn_02 
	begin
	wait RandomRange (5.0, 10.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound sk9_OneShot_Bridge_Horn_01 vol = RandomRange (20.0, 30.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Horn_02 dropoff_function = inv_exponential
			@ obj_playsound sk9_OneShot_Bridge_Horn_02 vol = RandomRange (20.0, 30.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Horn_02 dropoff_function = inv_exponential
			@ obj_playsound sk9_BG_1shot_Bmore_Harbor_Horn1 vol = RandomRange (50.0, 70.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Horn_02 dropoff_function = inv_exponential
			@ obj_playsound sk9_BG_1shot_Bmore_Harbor_Horn2 vol = RandomRange (50.0, 70.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Horn_02 dropoff_function = inv_exponential
			@ obj_playsound sk9_BG_1shot_Bmore_Harbor_Bell1 vol = RandomRange (50.0, 70.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Horn_02 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (10.0, 15.0) seconds
	repeat
endscript

script sk9_BW_Bridge_Construction_01 
	begin
	wait RandomRange (1.0, 2.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound sk9_BG_Oneshot_Const_01 vol = RandomRange (50.0, 70.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Const_01 dropoff_function = inv_exponential
			@ obj_playsound sk9_BG_Oneshot_Const_02 vol = RandomRange (50.0, 70.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Const_01 dropoff_function = inv_exponential
			@ obj_playsound sk9_BG_Oneshot_Const_03 vol = RandomRange (50.0, 70.0) emitter = z_bw_bridge_SFX_SFX_Emitter_Bridge_BW_Const_01 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (10.0, 20.0) seconds
	repeat
endscript

script sk9_PB_Bridge_Shipyard_01 
	begin
	wait RandomRange (1.0, 2.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound sk9_BG_Oneshot_Const_01 vol = RandomRange (50.0, 70.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_01 dropoff_function = inv_exponential
			@ obj_playsound sk9_BG_Oneshot_Const_02 vol = RandomRange (50.0, 70.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_01 dropoff_function = inv_exponential
			@ obj_playsound sk9_BG_Oneshot_Const_03 vol = RandomRange (50.0, 70.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_01 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (10.0, 20.0) seconds
	repeat
endscript

script sk9_PB_Bridge_Shipyard_Horn_01 
	begin
	wait RandomRange (4.0, 8.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound sk9_PB_Shipyard_Horn_01 vol = RandomRange (40.0, 55.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_Horn_01 dropoff_function = inv_exponential
			@ obj_playsound sk9_PB_Shipyard_Horn_02 vol = RandomRange (40.0, 55.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_Horn_01 dropoff_function = inv_exponential
			@ obj_playsound sk9_PB_Shipyard_Horn_03 vol = RandomRange (40.0, 55.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_Horn_01 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (10.0, 20.0) seconds
	repeat
endscript

script sk9_PB_Bridge_Shipyard_Horn_02 
	begin
	wait RandomRange (4.0, 8.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound sk9_PB_Shipyard_Horn_01 vol = RandomRange (40.0, 55.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_Horn_02 dropoff_function = inv_exponential
			@ obj_playsound sk9_PB_Shipyard_Horn_02 vol = RandomRange (40.0, 55.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_Horn_02 dropoff_function = inv_exponential
			@ obj_playsound sk9_PB_Shipyard_Horn_03 vol = RandomRange (40.0, 55.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_Horn_02 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (10.0, 20.0) seconds
	repeat
endscript

script sk9_PB_Bridge_Shipyard_Horn_03 
	begin
	wait RandomRange (4.0, 8.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound sk9_PB_Shipyard_Horn_01 vol = RandomRange (40.0, 55.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_Horn_03 dropoff_function = inv_exponential
			@ obj_playsound sk9_PB_Shipyard_Horn_02 vol = RandomRange (40.0, 55.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_Horn_03 dropoff_function = inv_exponential
			@ obj_playsound sk9_PB_Shipyard_Horn_03 vol = RandomRange (40.0, 55.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Shipyard_Horn_03 dropoff_function = inv_exponential
			)
	endif
	wait RandomRange (10.0, 20.0) seconds
	repeat
endscript

script ntt_into_sfx_loop 
	playsound \{sk9_ntt_sfx_loop_front
		priority = 100
		vol = 350
		num_loops = -1
		pan1x = -1
		pan1y = 1
		pan2x = 1
		pan2y = 1}
	playsound \{sk9_ntt_sfx_loop_rear
		priority = 100
		vol = 350
		num_loops = -1
		pan1x = -1
		pan1y = -1
		pan2x = 1
		pan2y = -1}
endscript

script ntt_outof_sfx_loop 
	wait \{0.2
		seconds}
	stopsound \{sk9_ntt_sfx_loop_front}
	stopsound \{sk9_ntt_sfx_loop_rear}
endscript

script SFX_Trig_m_h2_boneless_ThugWalla 
	obj_playsound \{sk9_m_h2_boneless_thugwalla
		vol = 180
		emitter = m_h2_boneless_SFX_Emitter_m_h2_boneless_ThugWalla
		dropoff_function = inv_exponential}
endscript

script Sk9_VO_Pro_GoalCompletion_Cheer 
	if NOT issoundeventplaying VO_m_c2_revman_inc_pos
		RandomNoRepeat (
			@ playsound burnquist_cheerland_01 vol = 400
			@ playsound burnquist_cheerland_02 vol = 400
			@ playsound burnquist_cheerland_03 vol = 400
			@ playsound burnquist_cheerland_04 vol = 400
			@ playsound burnquist_cheerland_05 vol = 400
			@ playsound burnquist_cheerland_06 vol = 400
			@ playsound burnquist_cheerland_07 vol = 400
			@ playsound burnquist_cheerland_08 vol = 400
			@ playsound burnquist_cheerland_09 vol = 400
			)
	endif
endscript

script m_c2_revman_Inst_01 
	playsound \{m_c2_revman_Inst_01
		vol = 375}
endscript

script m_c2_revman_Inst_02 
	playsound \{m_c2_revman_Inst_02
		vol = 375}
endscript

script m_c2_revman_Inst_03 
	playsound \{m_c2_revman_Inst_03
		vol = 375}
endscript

script m_c2_revman_Inst_04 
	playsound \{m_c2_revman_Inst_04
		vol = 375}
endscript

script Sk9_SFX_Goal_Land_for_Am 
	playsound \{TEMP_land_for_am
		vol = 150}
endscript

script Sk9_SFX_Goal_Land_for_Pro 
	playsound \{TEMP_land_for_pro
		vol = 150}
endscript

script Sk9_SFX_Goal_Land_for_Sick 
	playsound \{TEMP_land_for_Sick
		vol = 150}
endscript

script sk9_m_h2_learncheck_chk1 
	playsound \{m_h2_learncheck_inst_02
		vol = 350}
endscript

script sk9_m_h2_learncheck_chk2_pt1 
	playsound \{m_h2_learncheck_inst_03
		vol = 350}
endscript

script sk9_m_h2_learncheck_chk2_pt2 
	playsound \{m_h2_learncheck_inst_04
		vol = 350}
endscript

script sk9_arcade_mzk_loop_start 
	begin
	wait RandomRange (0.3, 1.0) seconds
	Random (
		@ obj_playsound \{sk9_arcade_stand_sfx1
			emitter = z_museums_SFX_arcade1_sfx_emitter
			dropoff_function = linear}
		@ obj_playsound \{sk9_arcade_stand_sfx2
			emitter = z_museums_SFX_arcade1_sfx_emitter
			dropoff_function = linear
			vol = 125}
		@ obj_playsound \{sk9_arcade_stand_sfx3
			emitter = z_museums_SFX_arcade1_sfx_emitter
			dropoff_function = linear
			vol = 110}
		)
	repeat
endscript

script VO_m_h2_takefdr_Thug_Callout 
	RandomNoRepeat (
		@ obj_playsound \{PedAI_SecGuard3_Chase_04
			dropoff = 150
			dropoff_function = standard}
		@ obj_playsound \{PedAI_SecGuard3_Chase_03
			dropoff = 150
			dropoff_function = standard}
		@ obj_playsound \{PedAI_SecGuard3_Chase_01
			dropoff = 150
			dropoff_function = standard}
		@ obj_playsound \{PedAI_SecGuard3_Chase_01
			dropoff = 150
			dropoff_function = standard}
		@ obj_playsound \{PedAI_SecGuard3_Chase_04
			dropoff = 150
			dropoff_function = standard}
		)
endscript

script SecurityGuard3_Knockdown_Sound 
	RandomNoRepeat (
		@ agent_playvo \{Generic_Male_KnockedDown01
			dropoff = 50
			dropoff_function = standard}
		@ agent_playvo \{Generic_Male_KnockedDown02
			dropoff = 50
			dropoff_function = standard}
		@ agent_playvo \{Generic_Male_KnockedDown03
			dropoff = 50
			dropoff_function = standard}
		@ agent_playvo \{Generic_Male_KnockedDown04
			dropoff = 50
			dropoff_function = standard}
		@ agent_playvo \{Generic_Male_KnockedDown05
			dropoff = 50
			dropoff_function = standard}
		)
endscript

script VO_m_h2_clearbcity_scream 
	if gotparam pedname
		wait RandomRange (0.5, 1.0) seconds
		RandomNoRepeat (
			@ <pedname> :obj_playsound VO_thug_scream_01 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_02 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_03 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_04 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_05 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_06 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_07 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_08 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_09 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_10 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_11 vol = 250 dropoff = 100 dropoff_function = standard
			@ <pedname> :obj_playsound VO_thug_scream_12 vol = 250 dropoff = 100 dropoff_function = standard
			)
	endif
endscript

script VO_m_h2_learncheck_scream 
	if gotparam pedname
		if (<pedname> = m_h2_learncheck_ped_worker_00)
			RandomNoRepeat (
				@ <pedname> :obj_playsound VO_thug_scream_01 vol = 250 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound VO_thug_scream_02 vol = 250 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound VO_thug_scream_03 vol = 250 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound VO_thug_scream_04 vol = 250 dropoff = 100 dropoff_function = standard
				)
		else
			RandomNoRepeat (
				@ <pedname> :obj_playsound VO_thug_scream_01 vol = 400 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound VO_thug_scream_02 vol = 400 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound VO_thug_scream_03 vol = 400 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound VO_thug_scream_04 vol = 400 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound VO_thug_scream_08 vol = 400 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound m1_knockdown_01 vol = 400 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound m1_knockdown_04 vol = 400 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound m1_knockdown_06 vol = 400 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound m1_knockdown_07 vol = 400 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound m1_knockdown_08 vol = 400 dropoff = 100 dropoff_function = standard
				@ <pedname> :obj_playsound m1_knockdown_09 vol = 400 dropoff = 100 dropoff_function = standard
				)
		endif
	endif
endscript
checkslowmobuss_active = 0

script Check_SlowMo_SFX 
	playsound SK8_Focus_Into vol = 200
	if (($ntt_soundbuss_active) = 1)
		change ntt_soundbuss_active = 0
		printpushpopdebuginfo pop name = "Check_SlowMo_SFX - ntt_soundbuss_active = 1 "
		popsoundbussparams
	endif
	if ($epicpush_soundbuss_active = 1)
		change epicpush_soundbuss_active = 0
		printpushpopdebuginfo pop name = "Check_SlowMo_SFX - epicpush_soundbuss_active = 1 "
		popsoundbussparams
	endif
	if (($focus_mode_buss_set_active) = 1)
		change focus_mode_buss_set_active = 0
		printpushpopdebuginfo pop name = "Check_SlowMo_SFX - focus_mode_buss_set_active = 1 "
		popsoundbussparams
	endif
	if (($checkslowmobuss_active) = 0)
		change checkslowmobuss_active = 1
		printpushpopdebuginfo push name = "Check_SlowMo_SFX"
		pushsoundbussparams
		setsoundbussparams $SkateCheck_SlowMo_BussSet time = 0.3
	endif
endscript

script Check_SlowMo_Out_SFX 
	if issoundeventplaying \{VO_m_h2_learncheck_scream}
		stopsoundevent \{VO_m_h2_learncheck_scream}
	endif
	if (($checkslowmobuss_active) = 1)
		change \{checkslowmobuss_active = 0}
		playsound \{SK8_Focus_OutOf
			vol = 400}
		printpushpopdebuginfo \{pop
			name = "Check_SlowMo_Out_SFX - no checking "}
		popsoundbussparams
	endif
endscript

script sk9_goal_comp_crowd_surges 
	if (<landed> = 1)
		if (<score> > 100000)
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_BIG
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
										if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
											if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
												soundevent event = VO_m_c2_localcomp_Announc_SICKLAND
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
			if gman_getactivatedgoalid
				if (<activated_goal_id> = m_c2_localcomp)
					soundevent event = Eric_CheerLand_Stream_02
				elseif (<activated_goal_id> = m_c2_compvert)
					soundevent event = Eric_CheerLand_Stream_02
				elseif (<activated_goal_id> = m_c2_comppark)
					soundevent event = Eric_CheerLand_Stream_02
				endif
			endif
		else
			if (<score> > 50000)
				stars
				stars
				soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
				soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
										if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
											if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
												if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
													soundevent event = VO_m_c2_localcomp_Announc_PROLAND
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
				if gman_getactivatedgoalid
					if (<activated_goal_id> = m_c2_localcomp)
						soundevent event = Eric_CheerLand_Stream_02
					elseif (<activated_goal_id> = m_c2_compvert)
						soundevent event = Eric_CheerLand_Stream_02
					elseif (<activated_goal_id> = m_c2_comppark)
						soundevent event = Eric_CheerLand_Stream_02
					endif
				endif
			else
				if (<score> > 25000)
					stars
					stars
					soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
										if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
											if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
												if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
													if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
														soundevent event = VO_m_c2_localcomp_Annouc_AMLAND
													endif
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
					if gman_getactivatedgoalid
						if (<activated_goal_id> = m_c2_localcomp)
							soundevent event = Eric_CheerLand_Stream_02
						elseif (<activated_goal_id> = m_c2_compvert)
							soundevent event = Eric_CheerLand_Stream_02
						elseif (<activated_goal_id> = m_c2_comppark)
							soundevent event = Eric_CheerLand_Stream_02
						endif
					endif
				endif
				if (<score> > 10000)
					soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
										if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
											if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
												if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
													if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
														soundevent event = VO_m_c2_localcomp_Annouc_AMLAND
													endif
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	else
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
								if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
										if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
											soundevent event = VO_m_c2_localcomp_Bails
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
		if gman_getactivatedgoalid
			if (<activated_goal_id> = m_c2_localcomp)
				soundevent event = Eric_BooLand_Stream_02
			elseif (<activated_goal_id> = m_c2_compvert)
				soundevent event = Eric_BooLand_Stream_02
			elseif (<activated_goal_id> = m_c2_comppark)
				soundevent event = Eric_BooLand_Stream_02
			endif
		endif
	endif
endscript

script sk9_goal_comp_crowd_surges_event2 
	if (<landed> = 1)
		if (<score> > 100000)
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_BIG
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
										if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
											if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
												soundevent event = VO_m_c2_localcomp_Announc_SICKLAND
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		else
			if (<score> > 50000)
				stars
				stars
				soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
				soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
										if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
											if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
												if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
													soundevent event = VO_m_c2_localcomp_Announc_PROLAND
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			else
				if (<score> > 25000)
					stars
					stars
					soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
										if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
											if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
												if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
													if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
														soundevent event = VO_m_c2_localcomp_Annouc_AMLAND
													endif
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
				if (<score> > 10000)
					soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
										if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
											if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
												if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
													if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
														soundevent event = VO_m_c2_localcomp_Annouc_AMLAND
													endif
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	else
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
								if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
										if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
											soundevent event = VO_m_c2_localcomp_Bails
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script sk9_goal_comp_crowd_surges_event3 
	if (<landed> = 1)
	else
		soundevent \{event = Eric_BooLand_Stream_03}
	endif
endscript

script sk9_goal_comp_crowd_surges_compstreet 
	gman_getdata goal = m_c2_compstreet name = trick_spots
	if (<trick_spots> > 7)
		soundevent event = Crowd_Ped_AI_Comp_CheerLand_BIG
		soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
		soundevent event = VO_m_c2_localcomp_Announc_SICKLAND
	else
		if (<trick_spots> > 5)
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
			soundevent event = VO_m_c2_localcomp_Announc_PROLAND
		else
			if (<trick_spots> > 3)
				soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
				soundevent event = VO_m_c2_localcomp_Annouc_AMLAND
			endif
			if (<trick_spots> > 0)
				soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
				soundevent event = VO_m_c2_localcomp_Annouc_AMLAND
			endif
		endif
	endif
endscript

script sk9_goal_comp_crowd_surges_compvert 
	gman_getdata goal = m_c2_compvert name = dair_cur_trick
	if (<dair_cur_trick> > 6)
		wait 1 second
		soundevent event = Crowd_Ped_AI_Comp_CheerLand_BIG
		soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
		soundevent event = VO_m_c2_localcomp_Announc_SICKLAND
	else
		if (<dair_cur_trick> > 4)
			wait 1 second
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
			soundevent event = VO_m_c2_localcomp_Announc_PROLAND
		else
			if (<dair_cur_trick> > 2)
				wait 1 second
				soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
				soundevent event = VO_m_c2_localcomp_Annouc_AMLAND
			endif
			if (<dair_cur_trick> > 0)
				wait 1 second
				soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
				soundevent event = VO_m_c2_localcomp_Annouc_AMLAND
			endif
		endif
	endif
endscript

script sk9_goal_comp_crowd_surges_bowlcomp1 
	GMan_ScoreAccumulatorFunc \{goal = m_h3_bowlcomp
		tool = accumulator
		func = get_score}
	if (<accumulated_score> > 30000)
		soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_BIG}
		soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM}
		soundevent \{event = VO_m_c2_localcomp_Announc_PROLAND}
	else
		soundevent \{event = VO_m_c2_localcomp_Annouc_AMLAND}
		soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM}
		soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_BIG}
	endif
endscript

script sk9_goal_comp_crowd_surges_bowlcomp2 
	wait \{0.4
		second}
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_BIG}
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_SMALL}
	soundevent \{event = VO_m_c2_localcomp_Announc_SICKLAND}
endscript

script sk9_goal_comp_crowd_surges_compvert_2 
	gman_getdata goal = m_c2_compvert name = pending
	gman_getdata goal = m_c2_compvert name = got
	stars
	stars
	stars
	printstruct <...>
	if (<pending> > 0)
		if (<got> > 4)
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_BIG
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
			soundevent event = VO_m_c2_localcomp_Announc_SICKLAND
		endif
		if (<got> > 3)
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
			soundevent event = VO_m_c2_localcomp_Announc_PROLAND
		endif
		if (<got> > 2)
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
			soundevent event = VO_m_c2_localcomp_Annouc_AMLAND
		endif
		if (<got> > 0)
			soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
			soundevent event = VO_m_c2_localcomp_Annouc_AMLAND
		endif
	endif
endscript

script sk9_goal_comp_Bails 
	soundevent \{event = VO_m_c2_localcomp_Bails}
endscript

script VO_m_c2_localcomp_chk1_pt1 
	playsound \{m_c2_localcomp_inst_01
		vol = 80}
	soundevent \{event = m_c2_localcomp_CrowdCheer}
endscript

script VO_m_c2_compvert_chk1_pt1 
	soundevent \{event = m_c2_compvert_CrowdCheer}
endscript

script m_c2_localcomp_CrowdCheer 
	m_c2_localcomp_ped_crowd_1 :obj_playsound \{Crowd_Cheer_Loop_01
		vol = 25
		num_loops = -1
		dropoff = 150
		dropoff_function = inv_exponential}
	m_c2_localcomp_ped_crowd_2 :obj_playsound \{Crowd_Cheer_Loop_02
		vol = 25
		num_loops = -1
		dropoff = 150
		dropoff_function = inv_exponential}
endscript

script m_c2_compvert_CrowdCheer 
	m_c2_compvert_ped_crowd_3 :obj_playsound \{Crowd_Cheer_Loop_01
		vol = 25
		num_loops = -1
		dropoff = 150
		dropoff_function = inv_exponential}
	m_c2_compvert_ped_crowd_12 :obj_playsound \{Crowd_Cheer_Loop_02
		vol = 25
		num_loops = -1
		dropoff = 150
		dropoff_function = inv_exponential}
endscript
arcade_mzk_playing = 0

script arcade_mzk_background 
	change arcade_mzk_playing = 1
	printpushpopdebuginfo push name = "going into arcade"
	pushsoundbussparams
	setsoundbussparams $Cell_Phone_FMV_BussSet time = 0.2
	wait 0.2 seconds
	if NOT (isusermusicplaying)
		if (($sfx_background_is_crossfading) = false)
			playsound SK9_ArcadeSk9_Music num_loops = -1 vol = 250
		endif
		if (($sfx_background_is_crossfading) = true)
			begin
			if (($sfx_background_is_crossfading) = true)
				wait 1 gameframe
			else
				wait 0.2 seconds
				playsound SK9_ArcadeSk9_Music num_loops = -1 vol = 250
				return
			endif
			repeat
		endif
	endif
endscript

script arcade_mzk_background_stop 
	if (($arcade_mzk_playing) = 1)
		printpushpopdebuginfo \{pop
			name = "leaving arcade"}
		change \{arcade_mzk_playing = 0}
		popsoundbussparams
		stopsoundevent \{arcade_mzk_background}
	else
		stopsound \{SK9_ArcadeSk9_Music}
	endif
endscript

script Stall_Sfx_Logic 
	begin
	skater :getmanuallean
	if NOT skater :onstall
		if NOT skater :onrail
			return
		endif
	endif
	truck_sfx_check1 = <lean>
	wait 2 gameframes
	skater :getmanuallean
	truck_sfx_check2 = <lean>
	truck_sfx_diff = (<truck_sfx_check1> - <truck_sfx_check2>)
	if (<truck_sfx_diff> < 0)
		truck_sfx_diff = (<truck_sfx_diff> * -1)
	endif
	if (<truck_sfx_diff> > 120)
		if NOT issoundeventplaying stall_truck_squeak truck_pitch = (<truck_sfx_diff> -10)
			soundevent event = stall_truck_squeak
		else
			if (<truck_sfx_diff> > 200)
				stopsound $truck_sfx_name
				soundevent event = stall_truck_squeak
			endif
		endif
	endif
	if (<truck_sfx_diff> < 100)
		if issoundplaying $truck_sfx_name
			stopsound $truck_sfx_name
		endif
	endif
	wait 2 gameframes
	repeat
endscript
truck_sfx_name = `default`

script stall_truck_squeak 
	RandomNoRepeat (
		@ skater :obj_playsound sk9_truck_squeak_01 pitch = <truck_pitch>
		change truck_sfx_name = sk9_truck_squeak_01
		@ skater :obj_playsound sk9_truck_squeak_02 pitch = <truck_pitch>
		change truck_sfx_name = sk9_truck_squeak_02
		@ skater :obj_playsound sk9_truck_squeak_03 pitch = <truck_pitch>
		change truck_sfx_name = sk9_truck_squeak_03
		@ skater :obj_playsound sk9_truck_squeak_04 pitch = <truck_pitch>
		change truck_sfx_name = sk9_truck_squeak_04
		@ skater :obj_playsound sk9_truck_squeak_05 pitch = <truck_pitch>
		change truck_sfx_name = sk9_truck_squeak_05
		)
	begin
	if issoundplaying $truck_sfx_name
		skater :getmanuallean
		if (<lean> < 0)
			lean = (<lean> * -1)
		endif
		new_truck_pitch = ((<lean> * 0.01) + 95)
		setsoundparams $truck_sfx_name pitch = <new_truck_pitch>
	else
		return
	endif
	wait 2 gameframes
	repeat
endscript

script m_r2_climb_temp_vo 
	m_r2_climb_ped_bam :obj_playsound \{m_r2_climb_temp_vo
		vol = 400
		dropoff = 80}
endscript

script m_r2_breakin_vo_chk1p1 
	playsound \{Temp_vo_Chk1_p1
		vol = 400}
endscript

script m_r2_breakin_vo_chk2p1 
	wait \{0.5
		seconds}
	playsound \{Temp_vo_Chk2_p1
		vol = 400}
endscript

script m_r2_breakin_vo_chk3p1 
	wait \{0.5
		seconds}
	playsound \{Temp_vo_Chk3_p1
		vol = 400}
endscript

script m_r2_breakin_vo_chk4p1 
	wait \{0.5
		seconds}
	playsound \{Temp_vo_Chk4_p1
		vol = 400}
endscript

script Air_Bonus_SFX 
	if (<airbonus> = 10)
		playsound \{sk9_MidGoal_Am
			vol = 70}
	endif
	if (<airbonus> = 20)
		playsound \{sk9_MidGoal_Pro
			vol = 70}
	endif
	if (<airbonus> > 20)
		playsound \{sk9_MidGoal_Sick
			vol = 80}
	endif
endscript

script goalutils_sfx_failgoal 
	playsound \{sk9_GoalFail
		vol = 175}
	if gotparam \{GoalTypeSfx}
		if (<GoalTypeSfx> = "Collect COMBO")
			return
		endif
	else
		soundevent \{event = GoalFailMusicHandler}
	endif
endscript
goalfail_music_pitching = 0

script GoalFailMusicHandler 
	if (($goalfail_music_pitching) = 0)
		printpushpopdebuginfo push name = "Music Pitching"
		pushsoundbussparams
		change goalfail_music_pitching = 1
	endif
	newpitch = -1
	newvol = -13
	begin
	wait 1 gameframes
	if NOT (<newpitch> = -18)
		newvol = (<newvol> -0.15)
		newpitch = (<newpitch> -0.5)
		wait 1 gameframes
		setsoundbussparams {playlist = {pitch = <newpitch> vol = <newvol>}}
	else
		PlaylistStop
		wait 0.3 seconds
		PlaylistNextTrack
		if (($goalfail_music_pitching) = 1)
			printpushpopdebuginfo pop name = "Music Pitching Pop"
			popsoundbussparams
			change goalfail_music_pitching = 0
		endif
		PlaylistPlay
		return
	endif
	repeat
endscript

script Music_Pitch_Fixer_Logic 
	if (($goalfail_music_pitching) = 1)
		if issoundeventplaying GoalFailMusicHandler
			PlaylistStop
			stopsoundevent GoalFailMusicHandler
			wait 0.2 seconds
			PlaylistNextTrack
			printpushpopdebuginfo pop name = "Music Pitching"
			popsoundbussparams
			change goalfail_music_pitching = 0
			PlaylistPlay
		else
			printpushpopdebuginfo pop name = "Music Pitching"
			popsoundbussparams
			change goalfail_music_pitching = 0
		endif
	endif
endscript

script Music_Pitch_Fixer_Logic2 
	if (($goalfail_music_pitching) = 1)
		if issoundeventplaying \{GoalFailMusicHandler}
			stopsoundevent \{GoalFailMusicHandler}
		endif
		printpushpopdebuginfo \{pop
			name = "Music Pitching"}
		popsoundbussparams
		change \{goalfail_music_pitching = 0}
	endif
endscript

script sk9_PED_Drumming 
	RandomNoRepeat (
		@ obj_playsound Drumming_01 vol = RandomRange (180.0, 200.0) pitch = RandomRange (90.0, 110.0) dropoff = 30 dropoff_function = inv_exponential
		@ obj_playsound Drumming_02 vol = RandomRange (180.0, 200.0) pitch = RandomRange (90.0, 110.0) dropoff = 30 dropoff_function = inv_exponential
		@ obj_playsound Drumming_03 vol = RandomRange (180.0, 200.0) pitch = RandomRange (90.0, 110.0) dropoff = 30 dropoff_function = inv_exponential
		@ obj_playsound Drumming_04 vol = RandomRange (180.0, 200.0) pitch = RandomRange (90.0, 110.0) dropoff = 30 dropoff_function = inv_exponential
		@ obj_playsound Drumming_05 vol = RandomRange (180.0, 200.0) pitch = RandomRange (90.0, 110.0) dropoff = 30 dropoff_function = inv_exponential
		)
endscript

script sk8_handclaps 
	RandomNoRepeat (
		@ obj_playsound sk8_handclap_01 randompitch = {type = randomrangetype vals = [75 , 90]} dropoff = 15 dropoff_function = standard
		@ obj_playsound sk8_handclap_02 randompitch = {type = randomrangetype vals = [75 , 90]} dropoff = 15 dropoff_function = standard
		@ obj_playsound sk8_handclap_03 randompitch = {type = randomrangetype vals = [75 , 90]} dropoff = 15 dropoff_function = standard
		@ obj_playsound sk8_handclap_04 randompitch = {type = randomrangetype vals = [75 , 90]} dropoff = 15 dropoff_function = standard
		@ obj_playsound sk8_handclap_05 randompitch = {type = randomrangetype vals = [75 , 90]} dropoff = 15 dropoff_function = standard
		@ obj_playsound sk8_handclap_06 randompitch = {type = randomrangetype vals = [75 , 90]} dropoff = 15 dropoff_function = standard
		@ obj_playsound sk8_handclap_07 randompitch = {type = randomrangetype vals = [75 , 90]} dropoff = 15 dropoff_function = standard
		@ obj_playsound sk8_handclap_08 randompitch = {type = randomrangetype vals = [75 , 90]} dropoff = 15 dropoff_function = standard
		)
endscript

script sk9_checkpoint_sfx 
	playsound \{sk9_checkpoint_sfx
		vol = 125}
	wait \{0.1
		seconds}
	checkpointpan = 0
	begin
	if issoundplaying \{sk9_checkpoint_sfx}
		checkpointpan = (<checkpointpan> -0.1)
		if (<checkpointpan> < -0.9)
			checkpointpan = -1.0
		endif
		setsoundparams sk9_checkpoint_sfx pan1y = <checkpointpan> pan2y = <checkpointpan>
		printf <checkpointpan>
	else
		return
	endif
	wait \{1
		gameframes}
	repeat
endscript

script sk9_m_h1_KickNow_SFX 
	wait \{0.28
		seconds}
	playsound \{sk9_m_h1_KickNow_SFX}
endscript

script Adjust_Rain_SFX_Intensity 
	if (<intensity> < 0.35000002)
		if issoundplaying Sk9_Rain_Heavy_Loop
			stopsound Sk9_Rain_Heavy_Loop
		endif
		if (<intensity> = 0)
			stopsound Sk9_Rain_Light_Loop
			return
		endif
		if NOT issoundplaying Sk9_Rain_Light_Loop
			soundevent event = Sk9_Rain_Loop_Light
		endif
		setsoundparams Sk9_Rain_Light_Loop vol = (<intensity> * 300)
	else
		if ((0.7 - <intensity>) > 0)
			if NOT issoundplaying Sk9_Rain_Light_Loop
				soundevent event = Sk9_Rain_Loop_Light
			endif
		endif
		setsoundparams Sk9_Rain_Light_Loop vol = ((0.7 - <intensity>) * 300)
		if ((0.7 - <intensity>) <= 0)
			stopsound Sk9_Rain_Light_Loop
		endif
		if NOT issoundplaying Sk9_Rain_Heavy_Loop
			soundevent event = Sk9_Rain_Loop_Heavy
		endif
		setsoundparams Sk9_Rain_Heavy_Loop vol = ((<intensity> - 0.35000002) * 200)
	endif
endscript

script sk9_Water_Loop_1 
	if gotparam \{Emitter2use}
		obj_playsound sk9_Water_Loop_1 vol = 150 num_loops = -1 emitter = <Emitter2use> dropoff = 5 dropoff_function = standard
	endif
endscript

script sk9_Water_Loop_2 
	if gotparam \{Emitter2use}
		obj_playsound sk9_Water_Loop_2 vol = 200 num_loops = -1 emitter = <Emitter2use> dropoff = 5 dropoff_function = standard
	endif
endscript

script sk9_Water_Loop_3 
	if gotparam \{Emitter2use}
		obj_playsound sk9_Water_Loop_1 pitch = 120 num_loops = -1 emitter = <Emitter2use> dropoff = 5 dropoff_function = standard
	endif
endscript

script sk9_Water_Loop_4 
	if gotparam \{Emitter2use}
		obj_playsound sk9_Water_Loop_1 pitch = 120 num_loops = -1 emitter = <Emitter2use> dropoff = 5 dropoff_function = standard
	endif
endscript

script sk9_Revolving_Door 
	if gotparam \{Emitter2use}
		obj_playsound Revolving_Door vol = 400 num_loops = -1 emitter = <Emitter2use> dropoff = 100 dropoff_function = standard
	endif
endscript

script sk9_Secret_Pipe_Loop 
	if gotparam \{Emitter2use}
		printf <Emitter2use>
		obj_playsound \{sk9_Secret_Pipe_SFX
			vol = 400
			num_loops = -1
			emitter = z_harbor_SFX_SFX_Secret_Pipes_Emitter
			dropoff = 1
			dropoff_function = standard}
	endif
endscript

script netmessage_timer_runout_beep_sfx 
	playsound \{sk9_timer1a
		vol = 150}
endscript

script sk9_Globe_Spinning 
	if gotparam \{Emitter2use}
		obj_playsound sk9_Globe_Spinning_SFX vol = 300 num_loops = -1 emitter = <Emitter2use> dropoff = 5 dropoff_function = standard
	endif
endscript

script m_h1_bigspines_inst_01 
	playsound \{m_h1_bigspines_inst_01
		vol = 350}
	wait \{2
		seconds}
	playsound \{m_h1_bigspines_inst_02
		vol = 350}
endscript

script VO_m_r2_Skateoff_chkp2p1 
	m_r2_skateoff_ped_bam :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp2p1
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp2p2 
	m_r2_skateoff_ped_bam :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp2p2
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp2ap1 
	m_r2_skateoff_ped_bam :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp2ap1
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp2ap2 
	m_r2_skateoff_ped_bam :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp2ap2
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp3ap1 
	m_r2_skateoff_ped_bam_skater :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp3ap1
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp3p1 
	m_r2_skateoff_ped_bam :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp3p1
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp3p2 
	m_r2_skateoff_ped_bam :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp3p2
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp4ap1 
	m_r2_skateoff_ped_bam_skater :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp4ap1
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp4ap2 
	m_r2_skateoff_ped_bam_skater :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp4ap2
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp4ap3 
	m_r2_skateoff_ped_bam_skater :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp4ap3
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp4p1 
	m_r2_skateoff_ped_bam :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp4p1
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp4p2 
	m_r2_skateoff_ped_bam :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp4p1
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp5ap1 
	m_r2_skateoff_ped_bam_skater :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp5ap1
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp5ap2 
	m_r2_skateoff_ped_bam_skater :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp5ap2
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp5p1 
	m_r2_skateoff_ped_bam :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp5p1
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_chkp5p2 
	m_r2_skateoff_ped_bam :obj_playsound \{Temp_vo_m_r2_Skateoff_chkp5p2
		vol = 400
		dropoff = 200}
endscript

script VO_m_r2_Skateoff_BAM_Negatives_01 
	if objectexists \{id = m_r2_skateoff_ped_bam}
		m_r2_skateoff_ped_bam :obj_playsound \{TEMP_VO_Bam_Negatives_01
			vol = 400
			dropoff = 200}
	else
		playsound \{TEMP_VO_Bam_Negatives_01}
	endif
endscript

script VO_m_r2_Skateoff_BAM_Negatives_02 
	if objectexists \{id = m_r2_skateoff_ped_bam}
		m_r2_skateoff_ped_bam :obj_playsound \{TEMP_VO_Bam_Negatives_02
			vol = 400
			dropoff = 200}
	else
		playsound \{TEMP_VO_Bam_Negatives_02}
	endif
endscript

script VO_m_r2_Skateoff_BAM_Negatives_03 
	if objectexists \{id = m_r2_skateoff_ped_bam}
		m_r2_skateoff_ped_bam :obj_playsound \{TEMP_VO_Bam_Negatives_03
			vol = 400
			dropoff = 200}
	else
		playsound \{TEMP_VO_Bam_Negatives_03}
	endif
endscript

script VO_m_r2_Skateoff_BAM_Negatives_04 
	if objectexists \{id = m_r2_skateoff_ped_bam}
		m_r2_skateoff_ped_bam :obj_playsound \{TEMP_VO_Bam_Negatives_04
			vol = 400
			dropoff = 200}
	else
		playsound \{TEMP_VO_Bam_Negatives_04}
	endif
endscript

script VO_m_r2_Skateoff_BAM_Negatives_05 
	if objectexists \{name = m_r2_skateoff_ped_bam}
		m_r2_skateoff_ped_bam_skater :obj_playsound \{TEMP_VO_Bam_Negatives_05
			vol = 400
			dropoff = 200}
	else
		playsound \{TEMP_VO_Bam_Negatives_05}
	endif
endscript

script Medal_AM_SFX_chk1 
	wait \{1
		seconds}
	soundevent \{event = medal_am_sfx}
	if NOT issoundeventplaying \{VO_m_r2_Skateoff_BAM_Negatives_05}
		if NOT issoundeventplaying \{VO_m_r2_Skateoff_Crew_Negatives_01}
			if NOT issoundeventplaying \{VO_m_r2_Skateoff_Crew_Negatives_02}
				if NOT issoundeventplaying \{VO_m_r2_Skateoff_Crew_Negatives_03}
				else
					stopsoundevent \{VO_m_r2_Skateoff_Crew_Negatives_03}
				endif
			else
				stopsoundevent \{VO_m_r2_Skateoff_Crew_Negatives_02}
			endif
		else
			stopsoundevent \{VO_m_r2_Skateoff_Crew_Negatives_01}
		endif
	else
		stopsoundevent \{VO_m_r2_Skateoff_BAM_Negatives_05}
	endif
	soundevent \{event = medal_am_sfx}
endscript

script Medal_AM_SFX_chk2 
	soundevent \{event = medal_am_sfx}
	if NOT issoundeventplaying \{VO_m_r2_Skateoff_BAM_Negatives_05}
		if NOT issoundeventplaying \{VO_m_r2_Skateoff_Crew_Negatives_01}
			if NOT issoundeventplaying \{VO_m_r2_Skateoff_Crew_Negatives_02}
				if NOT issoundeventplaying \{VO_m_r2_Skateoff_Crew_Negatives_03}
				else
					stopsoundevent \{VO_m_r2_Skateoff_Crew_Negatives_03}
				endif
			else
				stopsoundevent \{VO_m_r2_Skateoff_Crew_Negatives_02}
			endif
		else
			stopsoundevent \{VO_m_r2_Skateoff_Crew_Negatives_01}
		endif
	else
		stopsoundevent \{VO_m_r2_Skateoff_BAM_Negatives_05}
	endif
endscript

script Medal_AM_SFX_StoppingSoundEvents 
	soundevent \{event = medal_am_sfx}
	if NOT issoundeventplaying \{VO_m_r2_Skateoff_BAM_Negatives_01}
		if NOT issoundeventplaying \{VO_m_r2_Skateoff_BAM_Negatives_02}
			if NOT issoundeventplaying \{VO_m_r2_Skateoff_BAM_Negatives_03}
				if NOT issoundeventplaying \{VO_m_r2_Skateoff_BAM_Negatives_04}
				else
					stopsoundevent \{VO_m_r2_Skateoff_BAM_Negatives_04}
				endif
			else
				stopsoundevent \{VO_m_r2_Skateoff_BAM_Negatives_03}
			endif
		else
			stopsoundevent \{VO_m_r2_Skateoff_BAM_Negatives_02}
		endif
	else
		stopsoundevent \{VO_m_r2_Skateoff_BAM_Negatives_01}
	endif
endscript

script goalfail_nomusicmessing 
	playsound \{sk9_GoalFail
		vol = 175}
	if issoundplaying \{sk9_Cart_Loop}
		stopsound \{sk9_Cart_Loop}
	endif
endscript

script sk9_m_r2_skateoff_platform_SFX 
	if NOT issoundplaying \{sk9_Platform_SFX}
		playsound \{sk9_Platform_SFX
			vol = 200
			num_loops = -1}
	endif
endscript

script sk9_LovePark_Revolving_Door 
	if gotparam \{Emitter2use}
		obj_playsound Revolving_Door vol = 400 num_loops = -1 emitter = <Emitter2use> dropoff = 100 dropoff_function = inv_exponential
	endif
endscript

script sk9_Street_Lamp_Break 
	playsound sk9_Lamp_Break vol = RandomRange (350.0, 400.0)
endscript

script sk9_Door_Open_1 
	if iscreated \{z_monuments_SFX_SFX_Door_1_Emitter}
		z_monuments_SFX_SFX_Door_1_Emitter :obj_playsound \{sk9_Door_Open
			vol = 250
			dropoff = 15
			dropoff_function = inv_exponential}
	endif
endscript

script sk9_Door_Open_2 
	if iscreated \{z_monuments_SFX_SFX_Door_2_Emitter}
		z_monuments_SFX_SFX_Door_2_Emitter :obj_playsound \{sk9_Door_Open
			vol = 300
			dropoff = 15
			dropoff_function = inv_exponential}
	endif
endscript

script sk9_Door_Open_3 
	if iscreated \{z_monuments_SFX_SFX_Door_3_Emitter}
		z_monuments_SFX_SFX_Door_3_Emitter :obj_playsound \{sk9_Door_Open
			vol = 250
			dropoff = 15
			dropoff_function = inv_exponential}
	endif
endscript

script sk9_Door_Open_4 
	if iscreated \{z_monuments_SFX_SFX_Door_4_Emitter}
		z_monuments_SFX_SFX_Door_4_Emitter :obj_playsound \{sk9_Door_Open
			vol = 200
			dropoff = 15
			dropoff_function = inv_exponential}
	endif
endscript

script sk9_Glass_Break_Big_1 
	playsound sk9_Glass_Break_Big_1 vol = RandomRange (120.0, 170.0) pitch = RandomRange (80.0, 110.0)
	wait \{0.5
		seconds}
	playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0)
endscript

script Water_Splash_slow 
	playsound sk9_Water_Splash pitch = RandomRange (100.0, 150.0)
endscript

script Water_Splash_Med 
	playsound sk9_Water_Splash vol = 130 pitch = RandomRange (150.0, 200.0)
endscript
Water_Splash_Fast_struct = {
	default_priority = 50
	default_buss = zonesfx
	norepeatfor = 0.1
	instancemanagement = ignore
	instancelimit = 1
}

script Water_Splash_Fast 
	playsound sk9_Water_Splash vol = 160 pitch = RandomRange (200.0, 250.0)
endscript

script sk9_Water_Boost 
	playsound \{sk9_Water_Splash
		vol = 160}
endscript

script Hit_Glass_Railing 
	playsound HitGlassRailing2 vol = 80 pitch = RandomRange (87.0, 130.0)
endscript

script PhotoSFX_page_turn 
	if NOT issoundplaying \{SK8_Generic_Select_01}
		playsound \{sk9_remove_photo
			vol = 90}
	endif
endscript

script Sk9_Tesla_Sparks_SFX 
	skater :getspeed
	RandomNoRepeat (
		@ skater :obj_playsound sk9_Tesla_Spark_01 vol = RandomRange (150.0, 170.0) pitch = (90 + (<speed> * 2))
		@ skater :obj_playsound sk9_Tesla_Spark_02 vol = RandomRange (150.0, 170.0) pitch = (90 + (<speed> * 2))
		@ skater :obj_playsound sk9_Tesla_Spark_03 vol = RandomRange (150.0, 170.0) pitch = (90 + (<speed> * 2))
		@ skater :obj_playsound sk9_Tesla_Spark_04 vol = RandomRange (150.0, 170.0) pitch = (90 + (<speed> * 2))
		@ skater :obj_playsound sk9_Tesla_Spark_05 vol = RandomRange (150.0, 170.0) pitch = (90 + (<speed> * 2))
		)
endscript

script Sk9_Museums_Radio_Transmission_SatDish_SFX 
	RandomNoRepeat (
		@ z_museums_SFX_SFX_Emitter_Radio_Static_SatDish :obj_playsound Sk9_Museums_Radio_Static_01 vol = 200 dropoff = 25 dropoff_function = inv_exponential
		@ z_museums_SFX_SFX_Emitter_Radio_Static_SatDish :obj_playsound Sk9_Museums_Radio_Static_02 vol = 200 dropoff = 25 dropoff_function = inv_exponential
		@ z_museums_SFX_SFX_Emitter_Radio_Static_SatDish :obj_playsound Sk9_Museums_Radio_Static_03 vol = 200 dropoff = 25 dropoff_function = inv_exponential
		@ z_museums_SFX_SFX_Emitter_Radio_Static_SatDish :obj_playsound Sk9_Museums_Radio_Static_04 vol = 200 dropoff = 25 dropoff_function = inv_exponential
		@ z_museums_SFX_SFX_Emitter_Radio_Static_SatDish :obj_playsound Sk9_Museums_Radio_Static_05 vol = 200 dropoff = 25 dropoff_function = inv_exponential
		)
endscript

script Sk9_Museums_Radio_Transmission_Rocket_SFX 
	RandomNoRepeat (
		@ z_museums_SFX_SFX_Emitter_Radio_Static_Rocket :obj_playsound Sk9_Museums_Radio_Static_01 vol = 200 dropoff = 35 dropoff_function = inv_exponential
		@ z_museums_SFX_SFX_Emitter_Radio_Static_Rocket :obj_playsound Sk9_Museums_Radio_Static_02 vol = 200 dropoff = 35 dropoff_function = inv_exponential
		@ z_museums_SFX_SFX_Emitter_Radio_Static_Rocket :obj_playsound Sk9_Museums_Radio_Static_03 vol = 200 dropoff = 35 dropoff_function = inv_exponential
		@ z_museums_SFX_SFX_Emitter_Radio_Static_Rocket :obj_playsound Sk9_Museums_Radio_Static_04 vol = 200 dropoff = 35 dropoff_function = inv_exponential
		@ z_museums_SFX_SFX_Emitter_Radio_Static_Rocket :obj_playsound Sk9_Museums_Radio_Static_05 vol = 200 dropoff = 35 dropoff_function = inv_exponential
		)
endscript

script sk9_Museums_Toilet_Flush_South 
	RandomNoRepeat (
		@ z_museums_SFX_SFX_Emitter_Toilet_Flush_South :obj_playsound \{Sk9_Museums_Toilet_Flush_01
			vol = 200
			dropoff = 30
			dropoff_function = inv_exponential}
		@ z_museums_SFX_SFX_Emitter_Toilet_Flush_South :obj_playsound \{Sk9_Museums_Toilet_Flush_02
			vol = 200
			dropoff = 30
			dropoff_function = inv_exponential}
		)
endscript

script sk9_Museums_Toilet_Flush_North 
	RandomNoRepeat (
		@ z_museums_SFX_SFX_Emitter_Toilet_Flush_North :obj_playsound \{Sk9_Museums_Toilet_Flush_01
			vol = 200
			dropoff = 30
			dropoff_function = inv_exponential}
		@ z_museums_SFX_SFX_Emitter_Toilet_Flush_North :obj_playsound \{Sk9_Museums_Toilet_Flush_02
			vol = 200
			dropoff = 30
			dropoff_function = inv_exponential}
		)
endscript

script sk9_Museums_ArtGallery_Doors 
	z_museums_SFX_SFX_Emitter_Museums_ArtGallery_Door :obj_playsound \{sk9_Door_Open
		vol = 300
		dropoff = 20
		dropoff_function = inv_exponential}
endscript

script Sk9_Museums_Cannon_Move_North 
	z_museums_SFX_SFX_Emitter_Cannon_North :obj_playsound \{Sk9_Museums_Cannon_Move
		vol = 200
		dropoff = 15
		dropoff_function = inv_exponential}
endscript

script Sk9_Museums_Cannon_Move_South 
	z_museums_SFX_SFX_Emitter_Cannon_South :obj_playsound \{Sk9_Museums_Cannon_Move
		vol = 200
		dropoff = 15
		dropoff_function = inv_exponential}
endscript

script Sk9_Museums_Cannon_Fire_North 
	z_museums_SFX_SFX_Emitter_Cannon_North :obj_playsound \{Sk9_Museums_Cannon_Fire
		vol = 200
		dropoff = 25
		dropoff_function = inv_exponential}
endscript

script Sk9_Museums_Cannon_Fire_South 
	z_museums_SFX_SFX_Emitter_Cannon_South :obj_playsound \{Sk9_Museums_Cannon_Fire
		vol = 200
		dropoff = 25
		dropoff_function = inv_exponential}
endscript

script sk9_Focus_Timer_1Second_Left 
	wait \{0.55
		seconds}
	soundevent \{event = sk9_Focus_Timer}
endscript

script Focus_Out_HighFreq 
	playsound \{Focus_Out_HighFreq_5sec
		vol = 150}
	wait \{0.55
		seconds}
	soundevent \{event = sk9_Focus_Timer}
	wait \{1
		seconds}
	soundevent \{event = sk9_Focus_Timer}
endscript

script Sk9_BW_Bridge_Log_Movement_Down_SFX 
	if (<log_emitter> = 1)
		obj_playsound Water_Spurt_Splash_02 vol = 150 pitch = RandomRange (80.0, 90.0) emitter = z_bw_bridge_SFX_SFX_Emitter_BW_Bridge_Log_01 dropoff = 25 dropoff_function = inv_exponential
		obj_playsound sk9_BW_Bridge_Log_Movement_04 vol = 150 pitch = RandomRange (60.0, 80.0) emitter = z_bw_bridge_SFX_SFX_Emitter_BW_Bridge_Log_01 dropoff = 25 dropoff_function = inv_exponential
	endif
	if (<log_emitter> = 2)
		obj_playsound Water_Spurt_Splash_02 vol = 150 pitch = RandomRange (80.0, 90.0) emitter = z_bw_bridge_SFX_SFX_Emitter_BW_Bridge_Log_02 dropoff = 25 dropoff_function = inv_exponential
		obj_playsound sk9_BW_Bridge_Log_Movement_02 vol = 150 pitch = RandomRange (60.0, 80.0) emitter = z_bw_bridge_SFX_SFX_Emitter_BW_Bridge_Log_02 dropoff = 25 dropoff_function = inv_exponential
	endif
	if (<log_emitter> = 3)
		obj_playsound Water_Spurt_Splash_02 vol = 150 pitch = RandomRange (80.0, 90.0) emitter = z_bw_bridge_SFX_SFX_Emitter_BW_Bridge_Log_03 dropoff = 25 dropoff_function = inv_exponential
		obj_playsound sk9_BW_Bridge_Log_Movement_50 vol = 150 pitch = RandomRange (60.0, 80.0) emitter = z_bw_bridge_SFX_SFX_Emitter_BW_Bridge_Log_03 dropoff = 25 dropoff_function = inv_exponential
	endif
	if (<log_emitter> = 4)
		obj_playsound Water_Spurt_Splash_02 vol = 150 pitch = RandomRange (80.0, 90.0) emitter = z_bw_bridge_SFX_SFX_Emitter_BW_Bridge_Log_04 dropoff = 25 dropoff_function = inv_exponential
		obj_playsound sk9_BW_Bridge_Log_Movement_01 vol = 150 pitch = RandomRange (60.0, 80.0) emitter = z_bw_bridge_SFX_SFX_Emitter_BW_Bridge_Log_04 dropoff = 25 dropoff_function = inv_exponential
	endif
endscript

script WoodBreak_Lansdowne 
	playsound \{sk8_WoodBreak_03
		vol = 150}
	playsound \{SK8_WoodBreak_Explode_01
		vol = 150}
	playsound \{SK8_WoodBreak_Explode_03
		vol = 250}
endscript

script Wood_Shatter 
	playsound \{SK8_Bouncy_WoodTable_Collide_02}
	playsound \{SK8_Bouncy_WoodPallete_Collide_01
		vol = 200}
	playsound \{Fence_Break_02
		vol = 150
		pitch = 140}
	wait \{0.3
		seconds}
	playsound \{SK8_Bouncy_WoodPallete_Bounce_01
		vol = 150
		pitch = 80}
endscript

script sk8_Roof_Scuffs 
	RandomNoRepeat (
		@ playsound \{sk8_terr_roof_scuff_04
			vol = 200}
		@ playsound \{sk8_terr_roof_scuff_06
			vol = 200}
		@ playsound \{sk8_terr_roof_scuff_07
			vol = 200}
		)
	playsound \{sk8_terr_roof_slide_on_09
		pitch = 90}
endscript

script sk9_Cart_Start 
	playsound \{sk9_Cart_Start
		vol = 400}
	wait \{4.3
		seconds}
	playsound \{sk9_Cart_Loop
		vol = 400
		num_loops = -1}
endscript

script sk9_Lever_Move 
	wait \{0.2
		seconds}
	playsound \{sk9_Lever_Move
		vol = 300}
endscript

script sk9_Train_Loop 
	z_wp_bridge_train :obj_playsound \{sk9_Train
		vol = 300
		dropoff = 50
		num_loops = -1
		pitch = 150
		dropoff_function = inv_exponential}
endscript

script m_c3_Photo2_intro_2 
	playsound \{m_c3_photo2_gp_02
		vol = 350}
	wait \{2.5
		seconds}
	playsound \{m_c3_photo2_gp_05
		vol = 350}
endscript

script PhotoSFX_Take_Photo__Short 
	playsound \{sk9_take_photo
		vol = 150}
	wait \{0.5
		seconds}
	setsoundparams \{sk9_take_photo
		vol = 0}
endscript

script m_r2_show1_Bam_Angry_At_Cart 
	RandomNoRepeat (
		@ m_r2_show1_ped_bam_skater :obj_playsound \{r2_show1_inc_01
			vol = 400
			dropoff = 100
			dropoff_function = inv_exponential}
		@ m_r2_show1_ped_bam_skater :obj_playsound \{r2_show1_inc_02
			vol = 400
			dropoff = 100
			dropoff_function = inv_exponential}
		)
endscript

script m_r2_Show1_Bam_Fed_Up 
	m_r2_show1_ped_bam :obj_playsound \{r2_show1_inc_03
		vol = 400
		dropoff = 100
		dropoff_function = inv_exponential}
endscript

script m_r2_Show1_Bam_Sees_Train 
	if objectexists \{name = m_r2_show1_ped_bam}
		m_r2_show1_ped_bam :obj_playsound \{r2_show1_inc_04
			vol = 400
			dropoff = 100
			dropoff_function = inv_exponential}
	else
		playsound \{r2_show1_inc_04
			vol = 375}
	endif
endscript

script m_r2_Show1_Bam_Warning_You 
	if objectexists name = m_r2_show1_ped_bam
		RandomNoRepeat (
			@ m_r2_show1_ped_bam :obj_playsound r2_show1_inc_07 vol = 400 dropoff = 100 dropoff_function = inv_exponential
			@ m_r2_show1_ped_bam :obj_playsound r2_show1_inc_08 vol = 400 dropoff = 100 dropoff_function = inv_exponential
			@ m_r2_show1_ped_bam :obj_playsound r2_show1_inc_09 vol = 400 dropoff = 100 dropoff_function = inv_exponential
			)
	else
		RandomNoRepeat (
			@ playsound r2_show1_inc_07 vol = 375
			@ playsound r2_show1_inc_08 vol = 375
			@ playsound r2_show1_inc_09 vol = 375
			)
	endif
endscript

script m_r2_Show1_Bam_Dies 
	if objectexists name = m_r2_show1_ped_bam
		m_r2_show1_ped_bam :obj_playsound sk9_Slums_TrainHit vol = 200
		m_r2_show1_ped_bam :obj_playsound sk8_BodySplat vol = 200
		RandomNoRepeat (
			@ m_r2_show1_ped_bam :obj_playsound r2_show1_inc_05 vol = 400 dropoff = 100 dropoff_function = inv_exponential
			@ m_r2_show1_ped_bam :obj_playsound r2_show1_inc_06 vol = 400 dropoff = 100 dropoff_function = inv_exponential
			)
	else
		playsound sk9_Slums_TrainHit vol = 200
		playsound sk8_BodySplat vol = 200
		RandomNoRepeat (
			@ playsound r2_show1_inc_05 vol = 375
			@ playsound r2_show1_inc_06 vol = 375
			)
	endif
endscript

script sk9_Z_Slums_Train_Loop 
	soundevent \{event = sk9_Slums_Rumble}
	if iscreated \{Z_Slums_train}
		Z_Slums_train :obj_playsound \{sk9_Slums_Train_Loop
			num_loops = -1
			vol = 200
			dropoff = 40
			dropoff_function = linear}
	endif
	if iscreated \{z_slums_train2}
		z_slums_train2 :obj_playsound \{sk9_Slums_Train_Loop
			num_loops = -1
			vol = 200
			dropoff = 40
			dropoff_function = linear}
	endif
endscript

script sk9_Slums_Train_ArriveStation 
	wait 0.9 seconds
	if iscreated Z_Slums_train
		Z_Slums_train :obj_playsound sk9_Slums_Train_ArriveStation vol = 300 dropoff = 40 dropoff_function = linear
		if issoundplaying sk9_Slums_Train_Loop
			setsoundparams sk9_Slums_Train_Loop vol = 175
		endif
		if issoundeventplaying soundevent sk9_Slums_Rumble
			stopsoundevent sk9_Slums_Rumble
		endif
		wait 0.5 seconds
		if issoundplaying sk9_Slums_Train_Loop
			setsoundparams sk9_Slums_Train_Loop vol = 150
		endif
		setsoundparams sk9_Slums_Train_ArriveStation vol = 300
		wait 0.5 seconds
		if issoundplaying sk9_Slums_Train_Loop
			setsoundparams sk9_Slums_Train_Loop
		endif
		setsoundparams sk9_Slums_Train_ArriveStation vol = 350
		wait 0.5 seconds
		if issoundplaying sk9_Slums_Train_Loop
			stopsound sk9_Slums_Train_Loop
		endif
		setsoundparams sk9_Slums_Train_ArriveStation vol = 400
	endif
endscript

script sk9_Slums_Train_LeaveStation 
	wait 5 seconds
	soundevent event = sk9_Slums_Rumble_Start_Slums
	if iscreated z_slums_train2
		z_slums_train2 :obj_playsound sk9_Slums_Train_LeaveStation vol = 400 dropoff = 40 dropoff_function = linear
		wait 2 seconds
		soundevent event = sk9_Train_Screech
		if iscreated z_slums_train2
			setsoundparams sk9_Slums_Train_LeaveStation vol = 350
			z_slums_train2 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 50 dropoff = 40 dropoff_function = linear
			wait 0.5 seconds
			setsoundparams sk9_Slums_Train_LeaveStation vol = 200
			setsoundparams sk9_Slums_Train_Loop
			wait 0.5 seconds
			setsoundparams sk9_Slums_Train_LeaveStation
			setsoundparams sk9_Slums_Train_Loop vol = 125
			wait 0.5 seconds
			setsoundparams sk9_Slums_Train_LeaveStation vol = 50
			setsoundparams sk9_Slums_Train_Loop vol = 150
			wait 0.5 seconds
			if issoundplaying sk9_Slums_Train_LeaveStation
				stopsound sk9_Slums_Train_LeaveStation
			endif
			setsoundparams sk9_Slums_Train_Loop vol = 175
			wait 0.5 seconds
			setsoundparams sk9_Slums_Train_Loop vol = 200
		endif
	endif
endscript

script sk9_Z_Slums_Crane_Loop 
	obj_playsound \{sk9_Slums_Crane_Loop
		emitter = z_slums_SFX_SFX_Slums_Crane_Emitter
		num_loops = -1
		dropoff = 15
		dropoff_function = linear
		vol = 275}
endscript

script sk9_Slums_Metal_Break 
	playsound sk9_Slums_Metal_Break vol = 400 pitch = RandomRange (90.0, 130.0)
endscript

script sk9_Slums_Gate_Open 
	if gotparam \{gatespeed}
		if (<gatespeed> < 400)
			playsound sk9_Slums_Gate_Open vol = 200 pitch = RandomRange (100.0, 90.0)
		elseif (<gatespeed> < 550)
			playsound sk9_Slums_Gate_Open vol = 250 pitch = RandomRange (110.0, 120.0)
		elseif (<gatespeed> > 500)
			playsound sk9_Slums_Gate_Open vol = 400 pitch = RandomRange (140.0, 145.0)
			playsound \{sk8_bonk_ChainlinkFence_05
				vol = 400
				pitch = 120}
		endif
	endif
endscript

script sk9_Slums_Gate_Close 
	if gotparam \{gatespeed}
		if (<gatespeed> < 400)
			playsound sk8_bonk_ChainlinkFence_06 vol = 250 pitch = RandomRange (100.0, 90.0)
		elseif (<gatespeed> < 550)
			playsound sk8_bonk_ChainlinkFence_06 vol = 250 pitch = RandomRange (110.0, 120.0)
		elseif (<gatespeed> > 500)
			playsound sk8_bonk_ChainlinkFence_06 vol = 250 pitch = RandomRange (140.0, 145.0)
		endif
	endif
endscript

script sk9_Z_Slums_Crane_Movement 
	if iscreated \{z_slums_SFX_SFX_Crane_Move_GhostObject}
		RandomNoRepeat (
			@ z_slums_SFX_SFX_Crane_Move_GhostObject :obj_playsound \{sk9_Slums_Crane_Movement
				vol = 300
				dropoff = 30
				dropoff_function = linear}
			@ z_slums_SFX_SFX_Crane_Move_GhostObject :obj_playsound \{sk9_Slums_Crane_Movement_2
				vol = 300
				dropoff = 30
				dropoff_function = linear}
			)
	endif
endscript

script sk9_Z_Slums_Crane_Movement2 
	if iscreated \{z_slums_SFX_SFX_Crane_Move_GhostObject}
		z_slums_SFX_SFX_Crane_Move_GhostObject :obj_playsound sk9_Slums_Crane_Movement vol = 400 dropoff = 30 dropoff_function = linear pitch = RandomRange (120.0, 150.0)
	endif
endscript

script sk9_Slums_Door 
	if iscreated \{z_slums_SFX_SFX_Secret_Door_Ghost}
		z_slums_SFX_SFX_Secret_Door_Ghost :obj_playsound \{sk9_Slums_Door
			vol = 400
			dropoff = 40
			dropoff_function = linear}
	endif
endscript

script sk9_Slums_Crane_Movement_Loop 
	if iscreated \{z_slums_SFX_SFX_Crane_Move_GhostObject}
		z_slums_SFX_SFX_Crane_Move_GhostObject :obj_playsound \{sk9_Slums_Crane_Movement_Loop
			num_loops = -1
			vol = 200
			dropoff = 50
			dropoff_function = linear}
	endif
endscript

script sk9_Slums_Rumble 
	if iscreated \{Z_Slums_train}
		Z_Slums_train :obj_playsound \{sk9_Slums_Rumble
			num_loops = -1
			vol = 300
			dropoff = 30
			dropoff_function = linear}
	endif
	if iscreated \{z_slums_train2}
		z_slums_train2 :obj_playsound \{sk9_Slums_Rumble
			num_loops = -1
			vol = 300
			dropoff = 30
			dropoff_function = linear}
	endif
endscript

script sk9_Slums_Rumble_Start_Slums 
	if iscreated Z_Slums_train
		Z_Slums_train :obj_playsound sk9_Slums_Rumble num_loops = -1 vol = 10 dropoff = 30 dropoff_function = linear
	endif
	if iscreated z_slums_train2
		z_slums_train2 :obj_playsound sk9_Slums_Rumble num_loops = -1 vol = 10 dropoff = 30 dropoff_function = linear
	endif
	setsoundparams sk9_Slums_Rumble vol = 50
	wait 0.5 seconds
	setsoundparams sk9_Slums_Rumble vol = 100
	wait 0.5 seconds
	setsoundparams sk9_Slums_Rumble vol = 200
	wait 0.5 seconds
	setsoundparams sk9_Slums_Rumble vol = 300
	wait 0.5 seconds
	setsoundparams sk9_Slums_Rumble vol = 300
endscript

script sk9_WPBridge_Rumble_Start 
	if iscreated Z_WP_Bridge_Train_01
		Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Rumble num_loops = -1 vol = 10 dropoff = 30 dropoff_function = linear
	endif
	if iscreated Z_WP_Bridge_Train_02
		Z_WP_Bridge_Train_02 :obj_playsound sk9_Slums_Rumble num_loops = -1 vol = 10 dropoff = 30 dropoff_function = linear
	endif
	if iscreated Z_WP_Bridge_Train_03
		Z_WP_Bridge_Train_03 :obj_playsound sk9_Slums_Rumble num_loops = -1 vol = 10 dropoff = 30 dropoff_function = linear
	endif
	if iscreated Z_WP_Bridge_Train_04
		Z_WP_Bridge_Train_04 :obj_playsound sk9_Slums_Rumble num_loops = -1 vol = 10 dropoff = 30 dropoff_function = linear
	endif
	setsoundparams sk9_Slums_Rumble vol = 50
	wait 0.5 seconds
	setsoundparams sk9_Slums_Rumble vol = 100
	wait 0.5 seconds
	setsoundparams sk9_Slums_Rumble vol = 200
	wait 0.5 seconds
	setsoundparams sk9_Slums_Rumble vol = 300
	wait 0.5 seconds
	setsoundparams sk9_Slums_Rumble vol = 400
endscript

script sk9_Slums_Sliding_Gate 
	if gotparam gatespeed
		if issoundplaying sk9_Slums_Sliding_Gate
			stopsound sk9_Slums_Sliding_Gate
		endif
		if (<gatespeed> < 1)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate num_loops = -1 vol = 200 dropoff = 20 pitch = RandomRange (90.0, 95.0)
			wait 5 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 150
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 50
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		elseif (<gatespeed> < 2)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate num_loops = -1 dropoff = 20 vol = 200 pitch = RandomRange (90.0, 95.0)
			wait 2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 150
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 50
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		elseif (<gatespeed> < 3)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate num_loops = -1 dropoff = 20 vol = 200 pitch = RandomRange (90.0, 95.0)
			wait 1.5 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 150
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 50
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		elseif (<gatespeed> < 4)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate num_loops = -1 dropoff = 20 vol = 200 pitch = RandomRange (90.0, 95.0)
			wait 1 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 150
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 50
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		elseif (<gatespeed> < 5)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate dropoff = 20 vol = 250 pitch = RandomRange (95.0, 100.0)
			wait 0.5 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 150
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 50
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		elseif (<gatespeed> > 4)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate dropoff = 20 vol = 400
			wait 0.2 seconds
			wait 0.2 seconds
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		endif
	endif
endscript

script sk9_Slums_Sliding_Gate_Close 
	if gotparam gatespeed
		if issoundplaying sk9_Slums_Sliding_Gate
			stopsound sk9_Slums_Sliding_Gate
		endif
		if (<gatespeed> < 1)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate num_loops = -1 dropoff = 20 pitch = 95
			wait 4.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 150
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 50
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		elseif (<gatespeed> < 2)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate num_loops = -1 dropoff = 20 pitch = 95
			wait 2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 150
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 50
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		elseif (<gatespeed> < 3)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate num_loops = -1 dropoff = 20 pitch = 95
			wait 1.5 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 150
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 50
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		elseif (<gatespeed> < 4)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate num_loops = -1 dropoff = 20 pitch = 95
			wait 1 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 150
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 50
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		elseif (<gatespeed> < 5)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate vol = 150 dropoff = 20 pitch = 95
			wait 0.5 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 150
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 50
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		elseif (<gatespeed> > 4)
			z_slums_SFX_SFX_Slums_Sliding_Gate_Ghost :obj_playsound sk9_Slums_Sliding_Gate dropoff = 20 vol = 200 pitch = 95
			wait 0.2 seconds
			wait 0.2 seconds
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate
			wait 0.2 seconds
			setsoundparams sk9_Slums_Sliding_Gate vol = 0
			stopsound sk9_Slums_Sliding_Gate
		endif
	endif
endscript

script sk9_Love_Fountain_Spray_SFX 
	RandomNoRepeat (
		@ z_love_SFX_SFX_Fountain_Spray_GHOST :obj_playsound sk9_Love_Fountain_Spray_01 dropoff = 100 dropoff_function = inv_exponential vol = RandomRange (100.0, 130.0) pitch = RandomRange (95.0, 105.0)
		@ z_love_SFX_SFX_Fountain_Spray_GHOST :obj_playsound sk9_Love_Fountain_Spray_02 dropoff = 100 dropoff_function = inv_exponential vol = RandomRange (100.0, 130.0) pitch = RandomRange (95.0, 105.0)
		)
endscript

script Sk9_Z_Love_BreakWood_SFX_01 
	z_love_SFX_SFX_Plywood_Explo_01 :obj_playsound Fence_Break_01 dropoff = 100 dropoff_function = inv_exponential vol = RandomRange (140.0, 150.0) pitch = RandomRange (95.0, 105.0)
endscript

script Sk9_Z_Love_BreakWood_SFX_02 
	z_love_SFX_SFX_Plywood_Explo_02 :obj_playsound Fence_Break_02 dropoff = 100 dropoff_function = inv_exponential vol = RandomRange (140.0, 150.0) pitch = RandomRange (95.0, 105.0)
endscript

script Sk9_Z_Love_BreakWood_SFX_03 
	z_love_SFX_SFX_Plywood_Explo_03 :obj_playsound Fence_Break_03 dropoff = 100 dropoff_function = inv_exponential vol = RandomRange (140.0, 150.0) pitch = RandomRange (95.0, 105.0)
endscript

script Sk9_Z_Love_BreakWood_SFX_04 
	z_love_SFX_SFX_Plywood_Explo_04 :obj_playsound Fence_Break_01 dropoff = 100 dropoff_function = inv_exponential vol = RandomRange (140.0, 150.0) pitch = RandomRange (95.0, 105.0)
endscript

script SK8_Large_Fan 
	obj_playsound \{SK8_Large_Fan
		emitter = z_slums_SFX_SFX_Fans_Emitter
		num_loops = -1
		dropoff = 40
		dropoff_function = linear
		vol = 400}
endscript

script sk9_Slums_Train_Horn 
	<play> = RandomRange (0.0, 1.0)
	switch <play>
		case 0
		if iscreated \{Z_Slums_train}
			Z_Slums_train :obj_playsound \{sk9_Slums_Train_Horn
				vol = 400
				dropoff = 2000
				dropoff_function = linear}
		endif
		if iscreated \{z_slums_train2}
			z_slums_train2 :obj_playsound \{sk9_Slums_Train_Horn
				vol = 400
				dropoff = 2000
				dropoff_function = linear}
		endif
		case 1
	endswitch
endscript

script sk9_Slums_Sliding_Gate_Opener 
	playsound \{sk9_Slums_Sliding_Gate
		vol = 400}
endscript

script sk9_Slums_Magnet 
	wait \{5.4
		seconds}
	playsound \{sk9_Slums_Magnet
		vol = 400}
	wait \{4.6
		seconds}
	soundevent \{event = sk9_Slums_Unlock_Gate}
endscript

script sk9_WPBridge_Train_Horn 
	<play> = RandomRange (0.0, 1.0)
	switch <play>
		case 0
		if iscreated Z_WP_Bridge_Train_01
			Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Horn vol = 400 dropoff = 2000 dropoff_function = linear
		endif
		if iscreated Z_WP_Bridge_Train_02
			Z_WP_Bridge_Train_02 :obj_playsound sk9_Slums_Train_Horn vol = 400 dropoff = 2000 dropoff_function = linear
		endif
		if iscreated Z_WP_Bridge_Train_03
			Z_WP_Bridge_Train_03 :obj_playsound sk9_Slums_Train_Horn vol = 400 dropoff = 2000 dropoff_function = linear
		endif
		if iscreated Z_WP_Bridge_Train_04
			Z_WP_Bridge_Train_04 :obj_playsound sk9_Slums_Train_Horn vol = 400 dropoff = 2000 dropoff_function = linear
		endif
		case 1
	endswitch
endscript

script sk9_WPBridge_Train 
	if ($WP_BRIDGE_TRAIN_SFX_ON = 1)
		if ($WP_BRIDGE_TRAIN_FLAG = 0)
			if iscreated Z_WP_Bridge_Train_01
				Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 400 dropoff = 50 dropoff_function = linear
			endif
			if iscreated Z_WP_Bridge_Train_02
				Z_WP_Bridge_Train_02 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 400 dropoff = 50 dropoff_function = linear
			endif
			if iscreated Z_WP_Bridge_Train_03
				Z_WP_Bridge_Train_03 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 400 dropoff = 50 dropoff_function = linear
			endif
			if iscreated Z_WP_Bridge_Train_04
				Z_WP_Bridge_Train_04 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 400 dropoff = 50 dropoff_function = linear
			endif
		elseif ($WP_BRIDGE_TRAIN_FLAG = 1)
			if iscreated Z_WP_Bridge_Train_01
				Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 0 dropoff = 50 dropoff_function = linear
			endif
			if iscreated Z_WP_Bridge_Train_02
				Z_WP_Bridge_Train_02 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 0 dropoff = 50 dropoff_function = linear
			endif
			if iscreated Z_WP_Bridge_Train_03
				Z_WP_Bridge_Train_03 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 0 dropoff = 50 dropoff_function = linear
			endif
			if iscreated Z_WP_Bridge_Train_04
				Z_WP_Bridge_Train_04 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 0 dropoff = 50 dropoff_function = linear
			endif
		endif
	endif
endscript

script sk9_WPBridge_Train_Arrive 
	wait 10 seconds
	if ($WP_BRIDGE_TRAIN_SFX_ON = 1)
		if ($WP_BRIDGE_TRAIN_FLAG = 0)
			if iscreated Z_WP_Bridge_Train_01
				Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_ArriveStation vol = 300 dropoff = 50 dropoff_function = linear
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_Loop vol = 200
				endif
				wait 0.5 seconds
				if issoundeventplaying sk9_WPBridge_Rumble_Start
					stopsoundevent sk9_WPBridge_Rumble_Start
				endif
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_Loop vol = 150
				endif
				setsoundparams sk9_Slums_Train_ArriveStation vol = 300
				wait 0.5 seconds
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_Loop
				endif
				setsoundparams sk9_Slums_Train_ArriveStation vol = 350
				wait 0.5 seconds
				if issoundplaying sk9_Slums_Train_Loop
					stopsound sk9_Slums_Train_Loop
				endif
				setsoundparams sk9_Slums_Train_ArriveStation vol = 400
			endif
			wait 0.9 seconds
			if iscreated Z_WP_Bridge_Train_02
				Z_WP_Bridge_Train_02 :obj_playsound sk9_Slums_Train_ArriveStation vol = 300 dropoff = 50 dropoff_function = linear
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_Loop vol = 200
				endif
				wait 0.5 seconds
				if issoundeventplaying sk9_WPBridge_Rumble_Start
					stopsoundevent sk9_WPBridge_Rumble_Start
				endif
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_Loop vol = 150
				endif
				setsoundparams sk9_Slums_Train_ArriveStation vol = 300
				wait 0.5 seconds
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_Loop
				endif
				setsoundparams sk9_Slums_Train_ArriveStation vol = 350
				wait 0.5 seconds
				if issoundplaying sk9_Slums_Train_Loop
					stopsound sk9_Slums_Train_Loop
				endif
				setsoundparams sk9_Slums_Train_ArriveStation vol = 400
			endif
			wait 0.9 seconds
			if iscreated Z_WP_Bridge_Train_03
				Z_WP_Bridge_Train_03 :obj_playsound sk9_Slums_Train_ArriveStation vol = 300 dropoff = 50 dropoff_function = linear
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_Loop vol = 200
				endif
				wait 0.5 seconds
				if issoundeventplaying sk9_WPBridge_Rumble_Start
					stopsoundevent sk9_WPBridge_Rumble_Start
				endif
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_ArriveStation vol = 150
				endif
				setsoundparams sk9_WPBridge_Train_Arrive vol = 300
				wait 0.5 seconds
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_ArriveStation
				endif
				setsoundparams sk9_WPBridge_Train_Arrive vol = 350
				wait 0.5 seconds
				if issoundplaying sk9_Slums_Train_Loop
					stopsound sk9_Slums_Train_Loop
				endif
				setsoundparams sk9_Slums_Train_ArriveStation vol = 400
			endif
			wait 0.9 seconds
			if iscreated Z_WP_Bridge_Train_04
				Z_WP_Bridge_Train_04 :obj_playsound sk9_Slums_Train_ArriveStation vol = 300 dropoff = 50 dropoff_function = linear
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_Loop vol = 200
				endif
				wait 0.5 seconds
				if issoundeventplaying sk9_WPBridge_Rumble_Start
					stopsoundevent sk9_WPBridge_Rumble_Start
				endif
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_Loop vol = 150
				endif
				setsoundparams sk9_Slums_Train_ArriveStation vol = 300
				wait 0.5 seconds
				if issoundplaying sk9_Slums_Train_Loop
					setsoundparams sk9_Slums_Train_Loop
				endif
				setsoundparams sk9_Slums_Train_ArriveStation vol = 350
				wait 0.5 seconds
				if issoundplaying sk9_Slums_Train_Loop
					stopsound sk9_Slums_Train_Loop
				endif
				setsoundparams sk9_Slums_Train_ArriveStation vol = 400
			endif
		elseif ($WP_BRIDGE_TRAIN_FLAG = 1)
			wait 1.5 seconds
			if issoundplaying sk9_Slums_Train_Loop
				stopsound sk9_Slums_Train_Loop
			endif
		endif
	endif
endscript

script sk9_WPBridge_Train_Leave 
	if ($WP_BRIDGE_TRAIN_SFX_ON = 1)
		if ($WP_BRIDGE_TRAIN_FLAG = 0)
			soundevent event = sk9_WPBridge_Train_Arrive
			soundevent event = sk9_WPBridge_Rumble_Start
			if iscreated Z_WP_Bridge_Train_04
				Z_WP_Bridge_Train_04 :obj_playsound sk9_Slums_Train_LeaveStation vol = 400 dropoff = 50 dropoff_function = linear
				wait 2 seconds
				if iscreated Z_WP_Bridge_Train_04
					setsoundparams sk9_Slums_Train_LeaveStation vol = 350
					Z_WP_Bridge_Train_04 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 50 dropoff = 50 dropoff_function = linear
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation vol = 200
					setsoundparams sk9_Slums_Train_Loop
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation
					setsoundparams sk9_Slums_Train_Loop vol = 125
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation vol = 50
					setsoundparams sk9_Slums_Train_Loop vol = 150
					wait 0.5 seconds
					if issoundplaying sk9_Slums_Train_LeaveStation
						stopsound sk9_Slums_Train_LeaveStation
					endif
					setsoundparams sk9_Slums_Train_Loop vol = 175
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_Loop vol = 200
				endif
			endif
			if iscreated Z_WP_Bridge_Train_03
				Z_WP_Bridge_Train_03 :obj_playsound sk9_Slums_Train_LeaveStation vol = 400 dropoff = 50 dropoff_function = linear
				wait 2 seconds
				if iscreated Z_WP_Bridge_Train_03
					setsoundparams sk9_Slums_Train_LeaveStation vol = 350
					Z_WP_Bridge_Train_03 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 50 dropoff = 50 dropoff_function = linear
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation vol = 200
					setsoundparams sk9_Slums_Train_Loop
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation
					setsoundparams sk9_Slums_Train_Loop vol = 150
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation vol = 50
					setsoundparams sk9_Slums_Train_Loop vol = 200
					wait 0.5 seconds
					if issoundplaying sk9_Slums_Train_LeaveStation
						stopsound sk9_Slums_Train_LeaveStation
					endif
					setsoundparams sk9_Slums_Train_Loop vol = 300
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_Loop vol = 400
				endif
			endif
			if iscreated Z_WP_Bridge_Train_02
				Z_WP_Bridge_Train_02 :obj_playsound sk9_Slums_Train_LeaveStation vol = 400 dropoff = 50 dropoff_function = linear
				wait 2 seconds
				if iscreated Z_WP_Bridge_Train_02
					setsoundparams sk9_Slums_Train_LeaveStation vol = 350
					Z_WP_Bridge_Train_02 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 50 dropoff = 50 dropoff_function = linear
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation vol = 200
					setsoundparams sk9_Slums_Train_Loop
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation
					setsoundparams sk9_Slums_Train_Loop vol = 150
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation vol = 50
					setsoundparams sk9_Slums_Train_Loop vol = 200
					wait 0.5 seconds
					if issoundplaying sk9_Slums_Train_LeaveStation
						stopsound sk9_Slums_Train_LeaveStation
					endif
					setsoundparams sk9_Slums_Train_Loop vol = 300
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_Loop vol = 400
				endif
			endif
			if iscreated Z_WP_Bridge_Train_01
				Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_LeaveStation vol = 400 dropoff = 50 dropoff_function = linear
				wait 2 seconds
				if iscreated Z_WP_Bridge_Train_01
					setsoundparams sk9_Slums_Train_LeaveStation vol = 350
					Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 50 dropoff = 50 dropoff_function = linear
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation vol = 200
					setsoundparams sk9_Slums_Train_Loop
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation
					setsoundparams sk9_Slums_Train_Loop vol = 150
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_LeaveStation vol = 50
					setsoundparams sk9_Slums_Train_Loop vol = 200
					wait 0.5 seconds
					if issoundplaying sk9_Slums_Train_LeaveStation
						stopsound sk9_Slums_Train_LeaveStation
					endif
					setsoundparams sk9_Slums_Train_Loop vol = 300
					wait 0.5 seconds
					setsoundparams sk9_Slums_Train_Loop vol = 400
				endif
			endif
		elseif ($WP_BRIDGE_TRAIN_FLAG = 1)
			soundevent event = sk9_WPBridge_Train_Arrive
			soundevent event = sk9_WPBridge_Rumble_Start
			if iscreated Z_WP_Bridge_Train_04
				Z_WP_Bridge_Train_04 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 10 dropoff = 50 dropoff_function = linear
			endif
			if iscreated Z_WP_Bridge_Train_03
				Z_WP_Bridge_Train_03 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 10 dropoff = 50 dropoff_function = linear
			endif
			if iscreated Z_WP_Bridge_Train_02
				Z_WP_Bridge_Train_02 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 10 dropoff = 50 dropoff_function = linear
			endif
			if iscreated Z_WP_Bridge_Train_01
				Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Loop num_loops = -1 vol = 10 dropoff = 50 dropoff_function = linear
			endif
		endif
	endif
endscript

script sk9_WPBridge_UndergroundTrain 
	if iscreated \{z_wp_bridge_SFX_SFX_Underground_Train_Ghost}
		z_wp_bridge_SFX_SFX_Underground_Train_Ghost :obj_playsound \{WPBridge_UndergroundTrain_SFX
			vol = 300
			dropoff = 40
			dropoff_function = linear}
	endif
endscript

script sk9_Elevator_Open_01 
	if NOT issoundeventplaying \{Teleport_Back_SFX}
		if iscreated \{Z_WP_Bridge_SFX_SFX_Elevator_1_Ghost}
			Z_WP_Bridge_SFX_SFX_Elevator_1_Ghost :obj_playsound \{sk9_elevator_Open
				vol = 400
				dropoff = 50
				dropoff_function = linear}
		endif
	endif
endscript

script sk9_Elevator_Close_01 
	if NOT issoundeventplaying \{Teleport_Back_SFX}
		if iscreated \{Z_WP_Bridge_SFX_SFX_Elevator_1_Ghost}
			Z_WP_Bridge_SFX_SFX_Elevator_1_Ghost :obj_playsound \{sk9_Elevator_Close
				vol = 400
				dropoff = 15
				dropoff_function = linear}
		endif
	endif
endscript

script sk9_Elevator_Open_02 
	if NOT issoundeventplaying \{Teleport_Back_SFX}
		if iscreated \{Z_WP_Bridge_SFX_SFX_Elevator_2_Ghost}
			Z_WP_Bridge_SFX_SFX_Elevator_2_Ghost :obj_playsound \{sk9_elevator_Open
				vol = 400
				dropoff = 50
				dropoff_function = linear}
		endif
	endif
endscript

script sk9_Elevator_Close_02 
	if NOT issoundeventplaying \{Teleport_Back_SFX}
		if iscreated \{Z_WP_Bridge_SFX_SFX_Elevator_2_Ghost}
			Z_WP_Bridge_SFX_SFX_Elevator_2_Ghost :obj_playsound \{sk9_Elevator_Close
				vol = 400
				dropoff = 15
				dropoff_function = linear}
		endif
	endif
endscript

script sk9_WPBridge_Croc_SFX 
	if iscreated \{Z_WP_Bridge_LO_JG_Sub_CrocHead01}
		RandomNoRepeat (
			@ Z_WP_Bridge_LO_JG_Sub_CrocHead01 :obj_playsound \{WPBridge_Croc_SFX
				vol = 300
				dropoff = 30
				dropoff_function = linear}
			@ Z_WP_Bridge_LO_JG_Sub_CrocHead01 :obj_playsound \{WPBridge_Croc_SFX_2
				vol = 300
				dropoff = 30
				dropoff_function = linear}
			@ Z_WP_Bridge_LO_JG_Sub_CrocHead01 :obj_playsound \{WPBridge_Croc_SFX_3
				vol = 300
				dropoff = 30
				dropoff_function = linear}
			)
	endif
endscript

script WPBridge_Boost 
	playsound \{SK8_Skater_Boost_Sound
		vol = 400}
endscript

script m_r3_Museums_chk2p1 
	wait \{1
		seconds}
	playsound \{m_r3_museum_inst_02
		vol = 350}
endscript

script sk9_Landsdowne_Bathroom 
	RandomNoRepeat (
		@ obj_playsound \{Sk9_Museums_Toilet_Flush_01
			emitter = Z_lansdowne_SFX_SFX_Bathroom_SFX_Emitter
			vol = 200
			dropoff = 30
			dropoff_function = linear}
		@ obj_playsound \{Sk9_Museums_Toilet_Flush_02
			emitter = Z_lansdowne_SFX_SFX_Bathroom_SFX_Emitter
			vol = 200
			dropoff = 30
			dropoff_function = linear}
		@ 
		@ 
		@ 
		@ 
		@ 
		@ 
		@ 
		@ 
		)
endscript

script sk9_Museum_Int_Rocket_Steam_SFX 
	obj_playsound \{sk9_Museum_Int_Rocket_Steam_Sound
		vol = 225
		pitch = 100
		dropoff_function = standard
		num_loops = -1
		emitter = z_museum_int_SFX_SFX_Emitter_Rocket_Steam}
endscript

script sk9_Museum_Int_Simulator_Countdown_SFX 
	begin
	if NOT issoundplaying \{sk9_Museum_Int_Simulator_Countdown}
		wait RandomRange (2.0, 10.0) seconds
		obj_playsound \{sk9_Museum_Int_Simulator_Countdown
			vol = 150
			pitch = 100
			dropoff_function = standard
			emitter = z_museum_int_SFX_SFX_Emitter_Simulator_Countdown}
	endif
	wait RandomRange (5.0, 10.0) seconds
	repeat
endscript

script sk9_museum_int_Catapult_Flyby 
	skater :obj_playsound \{sk9_Catapult_Flyby
		vol = 250}
endscript

script sk9_museum_int_Catapult_Turbine 
	skater :obj_playsound \{Sk9_Catapult_Turbine_Spool
		vol = 250}
endscript

script sk9_Museum_Int_Slingshot_Steam 
endscript

script sk9_Museum_Int_WrightBros_Plane_move 
	playsound \{Sk9_Museums_Cannon_Move}
endscript
SFX_Current_Helicopter_Blade_Pitch = 0

script sk9_PB_Bridge_Helicopter_Loop_SFX 
	if NOT inmultiplayergame
		z_pb_bridge_g_heli_01 :obj_playsound \{sk9_PB_Bridge_Helicopter_Loop
			pitch = 90
			vol = 200
			num_loops = -1
			dropoff = 50
			dropoff_function = standard}
	endif
endscript

script Adjust_Helicopter_Engine_Intensity_Mid_to_Up 
	if NOT inmultiplayergame
		begin
		setsoundparams sk9_PB_Bridge_Helicopter_Loop pitch = <Blade_Pitch>
		wait \{1
			gameframes}
		if (<Blade_Pitch> = 115)
			break
		endif
		Blade_Pitch = (<Blade_Pitch> + 1)
		repeat
	endif
endscript

script Adjust_Helicopter_Engine_Intensity_Up_to_Mid 
	if NOT inmultiplayergame
		begin
		setsoundparams sk9_PB_Bridge_Helicopter_Loop pitch = <Blade_Pitch>
		wait \{1
			gameframes}
		if (<Blade_Pitch> = 100)
			break
		endif
		Blade_Pitch = (<Blade_Pitch> - 1)
		repeat
	endif
endscript

script Adjust_Helicopter_Engine_Intensity_Mid_to_Down 
	if NOT inmultiplayergame
		begin
		setsoundparams sk9_PB_Bridge_Helicopter_Loop pitch = <Blade_Pitch>
		wait \{1
			gameframes}
		if (<Blade_Pitch> = 85)
			break
		endif
		Blade_Pitch = (<Blade_Pitch> - 1)
		repeat
	endif
endscript

script Adjust_Helicopter_Engine_Intensity_Down_to_Mid 
	if NOT inmultiplayergame
		begin
		setsoundparams sk9_PB_Bridge_Helicopter_Loop pitch = <Blade_Pitch>
		wait \{1
			gameframes}
		if (<Blade_Pitch> = 90)
			break
		endif
		Blade_Pitch = (<Blade_Pitch> + 1)
		repeat
	endif
endscript
SFX_Helicopter_Movement = 0

script Adjust_Helicopter_Engine_Intensity_Lip_Mid_to_Up 
	if NOT inmultiplayergame
		begin
		setsoundparams sk9_PB_Bridge_Helicopter_Loop pitch = <Blade_Pitch>
		wait \{1
			gameframes}
		if (<Blade_Pitch> = 115)
			break
		endif
		Blade_Pitch = (<Blade_Pitch> + 1)
		repeat
	endif
endscript

script Adjust_Helicopter_Engine_Intensity_Lip_Up_to_Mid 
endscript

script Adjust_Helicopter_Engine_Intensity_Lip_Mid_to_Down 
	if NOT inmultiplayergame
		begin
		setsoundparams sk9_PB_Bridge_Helicopter_Loop pitch = <Blade_Pitch>
		wait \{1
			gameframes}
		if (<Blade_Pitch> = 100)
			break
		endif
		Blade_Pitch = (<Blade_Pitch> - 1)
		repeat
	endif
endscript

script Adjust_Helicopter_Engine_Intensity_Lip_Down_to_Mid 
endscript

script sk9_PB_Bridge_Ship_Door_Open 
	switch <door>
		case 1
		playsound \{sk9_PB_Bridge_Door_Open_01
			vol = 250}
		case 2
		playsound \{sk9_PB_Bridge_Door_Open_02
			vol = 250}
		case 3
		playsound \{sk9_PB_Bridge_Door_Open_03
			vol = 250}
		case 4
		playsound \{sk9_PB_Bridge_Door_Open_04
			vol = 250}
		case 5
		playsound \{sk9_PB_Bridge_Door_Open_05
			vol = 250}
		case `default`
		playsound \{sk9_PB_Bridge_Door_Open_01
			vol = 250}
	endswitch
endscript

script sk9_PB_Toll_Booth_Gate_SFX 
	switch <direction>
		case up
		<Emittah> :obj_playsound sk9_PB_Bridge_Door_Open_03 pitch = RandomRange (95.0, 105.0) vol = 120 dropoff = 40 dropoff_function = inv_exponential
		case down
		<Emittah> :obj_playsound sk9_PB_Bridge_Door_Open_03 pitch = RandomRange (115.0, 125.0) vol = 120 dropoff = 40 dropoff_function = inv_exponential
		case `default`
		<Emittah> :obj_playsound sk9_PB_Bridge_Door_Open_03 pitch = 130 vol = 120 dropoff = 40 dropoff_function = inv_exponential
	endswitch
endscript

script sk9_PB_Bridge_Seagulls 
	begin
	wait RandomRange (3.0, 8.0) seconds
	if (PauseOneshotsCheck = 0)
		RandomNoRepeat (
			@ obj_playsound sk9_BG_Oneshot_Seagull_01 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls01
			@ obj_playsound sk9_BG_Oneshot_Seagull_02 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls01
			@ obj_playsound sk9_BG_Oneshot_Seagull_03 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls01
			@ obj_playsound sk9_BG_Oneshot_Seagull_04 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls01
			@ obj_playsound sk9_BG_Oneshot_Seagull_01 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls02
			@ obj_playsound sk9_BG_Oneshot_Seagull_02 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls02
			@ obj_playsound sk9_BG_Oneshot_Seagull_03 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls02
			@ obj_playsound sk9_BG_Oneshot_Seagull_04 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls02
			@ obj_playsound sk9_BG_Oneshot_Seagull_01 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls03
			@ obj_playsound sk9_BG_Oneshot_Seagull_02 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls03
			@ obj_playsound sk9_BG_Oneshot_Seagull_03 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls03
			@ obj_playsound sk9_BG_Oneshot_Seagull_04 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls03
			@ obj_playsound sk9_BG_Oneshot_Seagull_01 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls04
			@ obj_playsound sk9_BG_Oneshot_Seagull_02 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls04
			@ obj_playsound sk9_BG_Oneshot_Seagull_03 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls04
			@ obj_playsound sk9_BG_Oneshot_Seagull_04 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls04
			@ obj_playsound sk9_BG_Oneshot_Seagull_01 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls05
			@ obj_playsound sk9_BG_Oneshot_Seagull_02 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls05
			@ obj_playsound sk9_BG_Oneshot_Seagull_03 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls05
			@ obj_playsound sk9_BG_Oneshot_Seagull_04 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls05
			@ obj_playsound sk9_BG_Oneshot_Seagull_01 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls06
			@ obj_playsound sk9_BG_Oneshot_Seagull_02 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls06
			@ obj_playsound sk9_BG_Oneshot_Seagull_03 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls06
			@ obj_playsound sk9_BG_Oneshot_Seagull_04 vol = RandomRange (250.0, 300.0) pitch = RandomRange (95.0, 105.0) emitter = z_pb_bridge_SFX_SFX_Emitter_PB_Bridge_Seagulls06
			)
	endif
	repeat
endscript

script sk9_PB_Bridge_Cannery_SFX_01 
	obj_playsound \{sk9_PB_Bridge_Cannery_01
		vol = 250
		emitter = z_pb_bridge_SFX_SFX_Trig_PB_Bridge_Cannery_01
		num_loops = -1}
endscript

script sk9_PB_Bridge_Cannery_SFX_02 
	obj_playsound \{sk9_PB_Bridge_Cannery_02
		vol = 250
		emitter = z_pb_bridge_SFX_SFX_Trig_PB_Bridge_Cannery_02
		num_loops = -1}
endscript

script Sk9_pb_bridge_trapped_monkey 
	wait RandomRange (0.2, 1.0) seconds
	begin
	RandomNoRepeat (
		@ obj_playsound sk9_PB_Bridge_Trapped_Monkey_SFX_01 vol = 250 pitch = 100 dropoff = 50 dropoff_function = inv_exponential emitter = z_pb_bridge_SFX_SFX_Emitter_Trapped_Monkey_01
		@ obj_playsound sk9_PB_Bridge_Trapped_Monkey_SFX_02 vol = 250 pitch = 100 dropoff = 50 dropoff_function = inv_exponential emitter = z_pb_bridge_SFX_SFX_Emitter_Trapped_Monkey_01
		@ obj_playsound sk9_PB_Bridge_Trapped_Monkey_SFX_03 vol = 250 pitch = 100 dropoff = 50 dropoff_function = inv_exponential emitter = z_pb_bridge_SFX_SFX_Emitter_Trapped_Monkey_01
		)
	wait RandomRange (5.0, 10.0) seconds
	repeat
endscript

script m_hu_Director_Wrap 
	if NOT issoundeventplaying \{m_hu_Director_TryFaster}
		if NOT issoundeventplaying \{m_hu_Director_StayOnSet}
			if NOT issoundeventplaying \{m_hu_Director_StayOnBoard}
				if NOT issoundeventplaying \{m_hu_Director_LetsDoitAgain}
					if NOT issoundeventplaying \{m_hu_Director_HitTheRest}
						if NOT issoundeventplaying \{m_hu_Director_FasterThanThat}
							if NOT issoundeventplaying \{m_hu_Director_DownSet}
								playsound \{m_hu_Director_Wrap_TEMPVO
									vol = 400}
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script m_hu_Director_TryFaster 
	if NOT issoundeventplaying \{m_hu_Director_StayOnSet}
		if NOT issoundeventplaying \{m_hu_Director_StayOnBoard}
			if NOT issoundeventplaying \{m_hu_Director_LetsDoitAgain}
				if NOT issoundeventplaying \{m_hu_Director_HitTheRest}
					if NOT issoundeventplaying \{m_hu_Director_FasterThanThat}
						if NOT issoundeventplaying \{m_hu_Director_DownSet}
							if NOT issoundeventplaying \{m_hu_Director_Wrap}
								playsound \{m_hu_Director_TryFaster_TEMPVO
									vol = 400}
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script m_hu_Director_StayOnSet 
	if NOT issoundeventplaying \{m_hu_Director_TryFaster}
		if NOT issoundeventplaying \{m_hu_Director_StayOnBoard}
			if NOT issoundeventplaying \{m_hu_Director_LetsDoitAgain}
				if NOT issoundeventplaying \{m_hu_Director_HitTheRest}
					if NOT issoundeventplaying \{m_hu_Director_FasterThanThat}
						if NOT issoundeventplaying \{m_hu_Director_DownSet}
							if NOT issoundeventplaying \{m_hu_Director_Wrap}
								playsound \{m_hu_Director_StayOnSet_TEMPVO
									vol = 400}
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script m_hu_Director_HitTheRest 
	if NOT issoundeventplaying \{m_hu_Director_TryFaster}
		if NOT issoundeventplaying \{m_hu_Director_StayOnSet}
			if NOT issoundeventplaying \{m_hu_Director_StayOnBoard}
				if NOT issoundeventplaying \{m_hu_Director_LetsDoitAgain}
					if NOT issoundeventplaying \{m_hu_Director_FasterThanThat}
						if NOT issoundeventplaying \{m_hu_Director_DownSet}
							if NOT issoundeventplaying \{m_hu_Director_Wrap}
								playsound \{m_hu_Director_HitTheRest_TEMPVO
									vol = 400}
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script m_hu_Director_FasterThanThat 
	if NOT issoundeventplaying \{m_hu_Director_TryFaster}
		if NOT issoundeventplaying \{m_hu_Director_StayOnSet}
			if NOT issoundeventplaying \{m_hu_Director_StayOnBoard}
				if NOT issoundeventplaying \{m_hu_Director_LetsDoitAgain}
					if NOT issoundeventplaying \{m_hu_Director_HitTheRest}
						if NOT issoundeventplaying \{m_hu_Director_DownSet}
							if NOT issoundeventplaying \{m_hu_Director_Wrap}
								playsound \{m_hu_Director_FasterThanThat_TEMPVO
									vol = 400}
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script m_hu_Director_DownSet 
	if NOT issoundeventplaying \{m_hu_Director_TryFaster}
		if NOT issoundeventplaying \{m_hu_Director_StayOnSet}
			if NOT issoundeventplaying \{m_hu_Director_StayOnBoard}
				if NOT issoundeventplaying \{m_hu_Director_LetsDoitAgain}
					if NOT issoundeventplaying \{m_hu_Director_HitTheRest}
						if NOT issoundeventplaying \{m_hu_Director_FasterThanThat}
							if NOT issoundeventplaying \{m_hu_Director_Wrap}
								playsound \{m_hu_Director_DownSet_TEMPVO
									vol = 400}
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script m_hu_Director_StayOnBoard 
	if NOT issoundeventplaying \{m_hu_Director_TryFaster}
		if NOT issoundeventplaying \{m_hu_Director_StayOnSet}
			if NOT issoundeventplaying \{m_hu_Director_DownSet}
				if NOT issoundeventplaying \{m_hu_Director_LetsDoitAgain}
					if NOT issoundeventplaying \{m_hu_Director_HitTheRest}
						if NOT issoundeventplaying \{m_hu_Director_FasterThanThat}
							if NOT issoundeventplaying \{m_hu_Director_Wrap}
								playsound \{m_hu_Director_StayOnBoard_TempVO
									vol = 400}
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script m_hu_Director_Action 
	if NOT issoundeventplaying m_hu_Director_TryFaster
		if NOT issoundeventplaying m_hu_Director_StayOnSet
			if NOT issoundeventplaying m_hu_Director_StayOnBoard
				if NOT issoundeventplaying m_hu_Director_LetsDoitAgain
					if NOT issoundeventplaying m_hu_Director_HitTheRest
						if NOT issoundeventplaying m_hu_Director_FasterThanThat
							if NOT issoundeventplaying m_hu_Director_DownSet
								if NOT issoundeventplaying m_hu_Director_Wrap
								else
									stopsoundevent m_hu_Director_Wrap
								endif
							else
								stopsoundevent m_hu_Director_DownSet
							endif
						else
							stopsoundevent m_hu_Director_FasterThanThat
						endif
					else
						stopsoundevent m_hu_Director_HitTheRest
					endif
				else
					stopsoundevent m_hu_Director_LetsDoitAgain
				endif
			else
				stopsoundevent m_hu_Director_StayOnBoard
			endif
		else
			stopsoundevent m_hu_Director_StayOnSet
		endif
	else
		stopsoundevent m_hu_Director_TryFaster
	endif
	playsound m_hu_Director_Action_TEMPVO vol = 400
endscript

script m_hu_Director_LetsDoitAgain 
	if NOT issoundeventplaying m_hu_Director_TryFaster
		if NOT issoundeventplaying m_hu_Director_StayOnSet
			if NOT issoundeventplaying m_hu_Director_StayOnBoard
				if NOT issoundeventplaying m_hu_Director_HitTheRest
					if NOT issoundeventplaying m_hu_Director_FasterThanThat
						if NOT issoundeventplaying m_hu_Director_DownSet
							if NOT issoundeventplaying m_hu_Director_Wrap
							else
								stopsoundevent m_hu_Director_Wrap
							endif
						else
							stopsoundevent m_hu_Director_DownSet
						endif
					else
						stopsoundevent m_hu_Director_FasterThanThat
					endif
				else
					stopsoundevent m_hu_Director_HitTheRest
				endif
			else
				stopsoundevent m_hu_Director_StayOnBoard
			endif
		else
			stopsoundevent m_hu_Director_StayOnSet
		endif
	else
		stopsoundevent m_hu_Director_TryFaster
	endif
	playsound m_hu_Director_LetsDoItAgain_TEMPVO vol = 400
endscript

script m_hu_chk3p1 
	if NOT issoundeventplaying \{m_hu_Director_Wrap}
		playsound \{m_hu_chk3p1_TEMPVO
			vol = 400}
	else
		wait \{1
			second}
		playsound \{m_hu_chk3p1_TEMPVO
			vol = 400}
	endif
endscript

script m_hu_chk2p1 
	if NOT issoundeventplaying \{m_hu_Director_Wrap}
		playsound \{m_hu_chk2p1_TEMPVO
			vol = 400}
	else
		wait \{1
			second}
		playsound \{m_hu_chk2p1_TEMPVO
			vol = 400}
	endif
endscript

script m_hu_WoodBreak 
	printstruct <...>
	if gotparam BreakThis
		if (<BreakThis> = m_hu_cp1_o_mb_pole_set1)
			RandomNoRepeat (
				@ m_hu_SFX_SFX_Break1_Ghost01 :obj_playsound SK8_WoodBreak_Explode_03 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost01 :obj_playsound SK8_WoodBreak_Explode_01 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost01 :obj_playsound SK8_WoodBreak_Explode_02 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost01 :obj_playsound SK8_WoodBreak_Explode_01 vol = 130 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				wait RandomRange (0.0, 0.3) seconds
				m_hu_SFX_SFX_Break1_Ghost01 :obj_playsound sk8_WoodBreak_03 vol = 150 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				)
		endif
		if (<BreakThis> = m_hu_cp1_o_mb_pole_set2)
			RandomNoRepeat (
				@ m_hu_SFX_SFX_Break1_Ghost02 :obj_playsound SK8_WoodBreak_Explode_03 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost02 :obj_playsound SK8_WoodBreak_Explode_01 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost02 :obj_playsound SK8_WoodBreak_Explode_02 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost02 :obj_playsound SK8_WoodBreak_Explode_01 vol = 130 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				wait RandomRange (0.0, 0.3) seconds
				m_hu_SFX_SFX_Break1_Ghost02 :obj_playsound sk8_WoodBreak_03 vol = 150 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				)
		endif
		if (<BreakThis> = m_hu_cp1_o_mb_pole_set3)
			RandomNoRepeat (
				@ m_hu_SFX_SFX_Break1_Ghost03 :obj_playsound SK8_WoodBreak_Explode_03 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost03 :obj_playsound SK8_WoodBreak_Explode_01 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost03 :obj_playsound SK8_WoodBreak_Explode_02 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost03 :obj_playsound SK8_WoodBreak_Explode_01 vol = 130 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				wait RandomRange (0.0, 0.3) seconds
				m_hu_SFX_SFX_Break1_Ghost03 :obj_playsound sk8_WoodBreak_03 vol = 150 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				)
		endif
		if (<BreakThis> = m_hu_cp1_o_mb_pole_set4)
			RandomNoRepeat (
				@ m_hu_SFX_SFX_Break1_Ghost04 :obj_playsound SK8_WoodBreak_Explode_03 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost04 :obj_playsound SK8_WoodBreak_Explode_01 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost04 :obj_playsound SK8_WoodBreak_Explode_02 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost04 :obj_playsound SK8_WoodBreak_Explode_01 vol = 130 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				wait RandomRange (0.0, 0.3) seconds
				m_hu_SFX_SFX_Break1_Ghost04 :obj_playsound sk8_WoodBreak_03 vol = 150 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				)
		endif
		if (<BreakThis> = m_hu_cp1_o_mb_pole_set5)
			RandomNoRepeat (
				@ m_hu_SFX_SFX_Break1_Ghost05 :obj_playsound SK8_WoodBreak_Explode_03 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost05 :obj_playsound SK8_WoodBreak_Explode_01 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost05 :obj_playsound SK8_WoodBreak_Explode_02 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost05 :obj_playsound SK8_WoodBreak_Explode_01 vol = 130 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				wait RandomRange (0.0, 0.3) seconds
				m_hu_SFX_SFX_Break1_Ghost05 :obj_playsound sk8_WoodBreak_03 vol = 150 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				)
		endif
		if (<BreakThis> = m_hu_cp1_o_mb_pole_set6)
			RandomNoRepeat (
				@ m_hu_SFX_SFX_Break1_Ghost06 :obj_playsound SK8_WoodBreak_Explode_03 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost06 :obj_playsound SK8_WoodBreak_Explode_01 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost06 :obj_playsound SK8_WoodBreak_Explode_02 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost06 :obj_playsound SK8_WoodBreak_Explode_01 vol = 130 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				wait RandomRange (0.0, 0.3) seconds
				m_hu_SFX_SFX_Break1_Ghost06 :obj_playsound sk8_WoodBreak_03 vol = 150 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				)
		endif
		if (<BreakThis> = m_hu_cp1_o_mb_pole_set7)
			RandomNoRepeat (
				@ m_hu_SFX_SFX_Break1_Ghost07 :obj_playsound SK8_WoodBreak_Explode_03 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost07 :obj_playsound SK8_WoodBreak_Explode_01 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost07 :obj_playsound SK8_WoodBreak_Explode_02 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost07 :obj_playsound SK8_WoodBreak_Explode_01 vol = 130 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				wait RandomRange (0.0, 0.3) seconds
				m_hu_SFX_SFX_Break1_Ghost07 :obj_playsound sk8_WoodBreak_03 vol = 150 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				)
		endif
		if (<BreakThis> = m_hu_cp1_o_mb_pole_set8)
			RandomNoRepeat (
				@ m_hu_SFX_SFX_Break1_Ghost08 :obj_playsound SK8_WoodBreak_Explode_03 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost08 :obj_playsound SK8_WoodBreak_Explode_01 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost08 :obj_playsound SK8_WoodBreak_Explode_02 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost08 :obj_playsound SK8_WoodBreak_Explode_01 vol = 130 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				wait RandomRange (0.0, 0.3) seconds
				m_hu_SFX_SFX_Break1_Ghost08 :obj_playsound sk8_WoodBreak_03 vol = 150 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				)
		endif
		if (<BreakThis> = m_hu_cp1_o_mb_pole_set9)
			RandomNoRepeat (
				@ m_hu_SFX_SFX_Break1_Ghost09 :obj_playsound SK8_WoodBreak_Explode_03 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost09 :obj_playsound SK8_WoodBreak_Explode_01 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost09 :obj_playsound SK8_WoodBreak_Explode_02 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost09 :obj_playsound SK8_WoodBreak_Explode_01 vol = 130 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				wait RandomRange (0.0, 0.3) seconds
				m_hu_SFX_SFX_Break1_Ghost09 :obj_playsound sk8_WoodBreak_03 vol = 150 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				)
		endif
		if (<BreakThis> = m_hu_cp1_o_mb_pole_10)
			RandomNoRepeat (
				@ m_hu_SFX_SFX_Break1_Ghost10 :obj_playsound SK8_WoodBreak_Explode_03 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost10 :obj_playsound SK8_WoodBreak_Explode_01 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost10 :obj_playsound SK8_WoodBreak_Explode_02 vol = 150 dropoff = 15
				@ m_hu_SFX_SFX_Break1_Ghost10 :obj_playsound SK8_WoodBreak_Explode_01 vol = 130 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				wait RandomRange (0.0, 0.3) seconds
				m_hu_SFX_SFX_Break1_Ghost10 :obj_playsound sk8_WoodBreak_03 vol = 150 dropoff = 15 pitch = RandomRange (90.0, 100.0)
				)
		endif
	else
		RandomNoRepeat (
			@ playsound SK8_WoodBreak_Explode_03 vol = 150
			@ playsound SK8_WoodBreak_Explode_01 vol = 150
			@ playsound SK8_WoodBreak_Explode_02 vol = 150
			@ playsound SK8_WoodBreak_Explode_01 vol = 130 pitch = RandomRange (90.0, 100.0)
			wait RandomRange (0.0, 0.3) seconds
			obj_playsound sk8_WoodBreak_03 vol = 150 pitch = RandomRange (90.0, 100.0)
			)
	endif
endscript

script NTM_scrape_SFX 
	skater :obj_playsound \{sk8_SolidWood_Slide_01
		vol = 90}
	begin
	if NOT skater :onground
		if issoundplaying \{sk8_SolidWood_Slide_01}
			stopsound \{sk8_SolidWood_Slide_01}
			return
		endif
	endif
	wait \{1
		gameframe}
	repeat
endscript

script NTM_scrape_SFX_off 
	if issoundeventplaying \{NTM_scrape_SFX}
		stopsoundevent \{NTM_scrape_SFX}
	endif
	if issoundplaying \{sk8_SolidWood_Slide_01}
		stopsound \{sk8_SolidWood_Slide_01}
	endif
endscript

script z_BCity_Water_Splash 
	playsound sk9_Water_Splash vol = RandomRange (100.0, 130.0) pitch = RandomRange (150.0, 200.0)
endscript

script z_BCity_Door1 
	if NOT issoundeventplaying \{Teleport_Back_SFX}
		if iscreated \{z_bcity_SFX_SFX_TheaterDoor_Ghost01}
			z_bcity_SFX_SFX_TheaterDoor_Ghost01 :obj_playsound \{sk9_Door_Open
				vol = 400
				dropoff = 20}
		endif
	endif
endscript

script z_BCity_Door2 
	if NOT issoundeventplaying \{Teleport_Back_SFX}
		if iscreated \{z_bcity_SFX_SFX_TheaterDoor_Ghost02}
			z_bcity_SFX_SFX_TheaterDoor_Ghost02 :obj_playsound \{sk9_Door_Open
				vol = 400
				dropoff = 20}
		endif
	endif
endscript

script z_BCity_Door3 
	if iscreated \{z_bcity_SFX_SFX_PlazaDoor_Ghost01}
		z_bcity_SFX_SFX_PlazaDoor_Ghost01 :obj_playsound \{sk9_Door_Open
			vol = 400
			dropoff = 20}
	endif
endscript

script sk9_TramStart 
	if iscreated Z_bcity_train_01
		Z_bcity_train_01 :obj_playsound sk9_TramStart vol = 400 dropoff = 30
		Z_bcity_train_01 :obj_playsound sk9_Tram vol = 100 dropoff = 30 num_loops = -1
		Z_bcity_train_01 :obj_playsound sk9_Slums_Rumble num_loops = -1 vol = 400 dropoff = 40 dropoff_function = linear
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 200
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 300
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 400
	elseif iscreated Z_bcity_train_02
		Z_bcity_train_02 :obj_playsound sk9_TramStart vol = 400
		Z_bcity_train_02 :obj_playsound sk9_Tram vol = 100 dropoff = 30 num_loops = -1
		Z_bcity_train_02 :obj_playsound sk9_Slums_Rumble num_loops = -1 vol = 400 dropoff = 40 dropoff_function = linear
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 200
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 300
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 400
	endif
endscript

script sk9_tram_stop_1 
	if iscreated Z_bcity_train_01
		wait 1.4 seconds
		Z_bcity_train_01 :obj_playsound sk9_Tram_Stop vol = 200
		setsoundparams sk9_Tram vol = 400
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 400
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 300
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 200
		setsoundparams sk9_Tram_Stop vol = 300
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 100
		wait 0.5 seconds
		stopsoundevent sk9_TramStart
	endif
endscript

script sk9_tram_stop_2 
	if iscreated Z_bcity_train_02
		wait 17.5 seconds
		Z_bcity_train_02 :obj_playsound sk9_Tram_Stop vol = 200
		setsoundparams sk9_Tram vol = 400
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 400
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 300
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 200
		setsoundparams sk9_Tram_Stop vol = 300
		wait 0.5 seconds
		setsoundparams sk9_Tram vol = 100
		wait 0.5 seconds
		stopsoundevent sk9_TramStart
	endif
endscript

script BCity_Fountain 
	obj_playsound \{sk9_Water_Loop_2
		vol = 200
		num_loops = -1
		emitter = z_bcity_SFX_SFX_Fountain_Emitter
		dropoff = 5
		dropoff_function = standard}
endscript

script m_c3_PhotoThemed_Positives 
	Random (
		@ playsound \{m_c3_Photothemed_Positives_TEMPVO
			vol = 400}
		@ 
		@ 
		)
endscript

script sk9_PhotoThemed_Text_Sound 
	wait \{0.120000005
		seconds}
	playsound \{sk9_m_h1_KickNow_SFX
		vol = 110}
endscript

script sk9_PhotoThemed_Text_Sound2 
	playsound \{sk9_m_h1_KickNow_SFX
		vol = 110}
endscript

script sk9_PhotoThemed_Text_Sound3 
	wait \{0.06
		seconds}
	playsound \{sk9_m_h1_KickNow_SFX
		vol = 110}
endscript

script sk9_Skater_Stop_SFX 
	wait \{0.05
		seconds}
	playsound \{SK8_Focus_Into
		vol = 150
		pitch = 190}
	setsoundparams \{sk9_ntt_sfx_loop_front
		vol = 10}
endscript

script sk9_Skater_Stop_SFX2 
	playsound \{SK8_Focus_Into
		vol = 200
		pitch = 190}
	setsoundparams \{sk9_ntt_sfx_loop_front
		vol = 10}
endscript

script sk9_Outof_Skater_Stop 
	setsoundparams \{sk9_ntt_sfx_loop_front
		vol = 350}
endscript

script sk9_Bell_Glass_Break 
	if gotparam BreakThis
		if (<BreakThis> = Z_Bell_f_LBC_glass_top_back_panel06)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost6
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost6 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost6 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost6 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost6 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_top_back_panel05)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost5
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost5 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost5 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost5 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost5 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_top_back_panel04)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost4
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost4 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost4 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost4 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost4 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_top_back_panel03)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost3
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost3 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost3 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost3 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost3 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_top_back_panel02)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost2
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost2 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost2 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost2 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost2 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_top_back_panel01)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost1
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost1 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost1 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost1 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost1 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_right_panel06)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost7
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost7 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost7 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost7 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost7 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_right_panel01)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost8
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost8 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost8 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost8 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost8 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_right_panel03)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost9
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost9 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost9 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost9 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost9 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_right_panel02)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost10
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost10 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost10 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost10 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost10 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_right_panel00)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost11
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost11 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost11 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost11 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost11 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_right_panel05)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost12
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost12 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost12 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost12 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost12 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_left_panel01)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost13
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost13 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost13 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost13 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost13 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_left_panel00)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost14
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost14 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost14 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost14 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost14 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_left_panel02)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost15
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost15 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost15 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost15 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost15 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_left_panel03)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost16
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost16 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost16 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost16 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost16 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_left_panel04)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost17
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost17 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost17 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost17 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost17 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_left_panel05)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost18
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost18 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost18 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost18 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost18 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel05)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost19
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost19 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost19 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost19 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost19 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel04)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost20
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost20 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost20 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost20 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost20 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel06)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost21
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost21 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost21 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost21 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost21 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel07)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost22
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost22 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost22 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost22 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost22 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel03)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost30
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost30 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost30 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost30 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost30 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel02)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost29
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost29 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost29 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost29 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost29 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel12)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost32
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost32 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost32 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost32 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost32 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel00)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost28
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost28 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost28 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost28 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost28 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel01)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost27
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost27 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost27 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost27 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost27 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel13)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost31
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost31 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost31 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost31 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost31 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel14)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost33
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost33 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost33 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost33 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost33 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel15)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost34
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost34 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost34 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost34 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost34 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel10)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost26
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost26 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost26 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost26 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost26 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel08)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost25
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost25 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost25 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost25 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost25 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel09)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost24
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost24 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost24 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost24 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost24 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
		if (<BreakThis> = Z_Bell_f_LBC_glass_front_panel11)
			if iscreated z_Bell_SFX_SFX_Glass_Ghost23
				RandomNoRepeat (
					@ z_Bell_SFX_SFX_Glass_Ghost23 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (220.0, 270.0) pitch = RandomRange (80.0, 110.0) dropoff = 20
					wait 0.5 seconds
					z_Bell_SFX_SFX_Glass_Ghost23 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost23 :obj_playsound sk8_large_glass_break_01 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					@ z_Bell_SFX_SFX_Glass_Ghost23 :obj_playsound sk8_large_glass_break_02 vol = RandomRange (320.0, 370.0) pitch = RandomRange (80.0, 105.0) dropoff = 20
					)
			endif
		endif
	endif
endscript

script Goal_UI_Negative_Less_Delay 
	wait \{0.1
		seconds}
	playsound \{small_negative_message_01
		vol = 70}
endscript

script m_r2_skateoff_inst_01 
	playsound \{r2_skateoff_inst_01
		vol = 350}
endscript

script m_r2_skateoff_inst_02 
	playsound \{r2_skateoff_inst_02
		vol = 350}
endscript

script m_r2_skateoff_inst_03 
	playsound \{r2_skateoff_inst_03
		vol = 350}
endscript

script m_r2_skateoff_inst_04 
	playsound \{r2_skateoff_inst_04
		vol = 350}
endscript

script m_r2_skateoff_inst_05 
	playsound \{r2_skateoff_inst_05
		vol = 350}
endscript

script m_r2_skateoff_inst_06 
	playsound \{r2_skateoff_inst_06
		vol = 350}
endscript

script m_r2_skateoff_inst_07 
	playsound \{r2_skateoff_inst_07
		vol = 350}
endscript

script m_r2_skateoff_inst_08 
	playsound \{r2_skateoff_inst_08
		vol = 350}
endscript

script m_r2_skateoff_inst_09 
	playsound \{r2_skateoff_inst_09
		vol = 350}
endscript

script m_r2_skateoff_inst_10 
	playsound \{r2_skateoff_inst_10
		vol = 350}
endscript

script m_r2_skateoff_inst_11 
	playsound \{r2_skateoff_inst_11
		vol = 350}
endscript

script m_r2_skateoff_inst_12 
	playsound \{r2_skateoff_inst_12
		vol = 350}
endscript

script m_r2_skateoff_inst_13 
	playsound \{r2_skateoff_inst_13
		vol = 350}
endscript

script m_r2_skateoff_inst_14 
	playsound \{r2_skateoff_inst_14
		vol = 350}
endscript

script m_r2_skateoff_scared_01 
	if objectexists \{id = m_r2_skateoff_ped_bam}
		m_r2_skateoff_ped_bam :obj_playsound \{m_r2_skateoff_scared_01
			vol = 100
			dropoff = 90}
	else
		playsound \{m_r2_skateoff_scared_01}
	endif
endscript

script m_r2_skateoff_scared_02 
	if objectexists \{id = m_r2_skateoff_ped_bam}
		m_r2_skateoff_ped_bam :obj_playsound \{m_r2_skateoff_scared_02
			vol = 100
			dropoff = 90}
	else
		playsound \{m_r2_skateoff_scared_02}
	endif
endscript

script m_r2_skateoff_scared_03 
	if objectexists \{id = m_r2_skateoff_ped_bam}
		m_r2_skateoff_ped_bam :obj_playsound \{m_r2_skateoff_scared_03
			vol = 100
			dropoff = 90}
	else
		playsound \{m_r2_skateoff_scared_03}
	endif
endscript

script m_r2_skateoff_scared_04 
	if objectexists \{id = m_r2_skateoff_ped_bam}
		m_r2_skateoff_ped_bam :obj_playsound \{m_r2_skateoff_scared_04
			vol = 100
			dropoff = 90}
	else
		playsound \{m_r2_skateoff_scared_04}
	endif
endscript

script m_r2_skateoff_scared_05 
	if objectexists \{id = m_r2_skateoff_ped_bam}
		m_r2_skateoff_ped_bam :obj_playsound \{m_r2_skateoff_scared_05
			vol = 100
			dropoff = 90}
	else
		playsound \{m_r2_skateoff_scared_05}
	endif
endscript

script m_h2_takefdr_inst_01 
	playsound \{m_h2_takefdr_inst_01
		vol = 350}
endscript

script m_h2_takefdr_inst_02 
	playsound \{m_h2_takefdr_inst_02
		vol = 350}
endscript

script m_h2_takefdr_inc_01 
	obj_playsound \{m_h2_takefdr_inc_01
		vol = 300
		dropoff = 100}
endscript

script m_h2_takefdr_inc_02 
	obj_playsound \{m_h2_takefdr_inc_02
		vol = 300
		dropoff = 100}
endscript

script m_h2_takefdr_inc_03 
	obj_playsound \{m_h2_takefdr_inc_03
		vol = 300
		dropoff = 100}
endscript

script m_h2_takefdr_inc_04 
	obj_playsound \{m_h2_takefdr_inc_04
		vol = 300
		dropoff = 100}
endscript

script sk9_Liberty_Bell_SFX 
	if iscreated \{z_bell_sfx_sfx_bell_ghost}
		wait \{0.2
			seconds}
		if iscreated \{z_bell_sfx_sfx_bell_ghost}
			z_bell_sfx_sfx_bell_ghost :obj_playsound \{sk9_Liberty_Bell_SFX
				vol = 150
				pitch = 104
				dropoff = 30
				dropoff_function = inv_exponential}
		endif
	endif
endscript

script sk9_Bell_SecretWoodBreak 
	playsound \{sk9_Bell_SecretWoodBreak
		vol = 300}
endscript

script sk9_Train_Screech 
	if iscreated z_slums_train2
		RandomNoRepeat (
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	elseif iscreated Z_Slums_train
		RandomNoRepeat (
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	endif
	wait RandomRange (0.3, 0.8) seconds
	if iscreated z_slums_train2
		RandomNoRepeat (
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	elseif iscreated Z_Slums_train
		RandomNoRepeat (
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	endif
	wait RandomRange (0.3, 0.8) seconds
	if iscreated z_slums_train2
		RandomNoRepeat (
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	elseif iscreated Z_Slums_train
		RandomNoRepeat (
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	endif
	wait RandomRange (0.3, 0.8) seconds
	if iscreated z_slums_train2
		RandomNoRepeat (
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ z_slums_train2 :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	elseif iscreated Z_Slums_train
		RandomNoRepeat (
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ Z_Slums_train :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	endif
endscript

script m_r2_Show1_Train_Loop 
	if iscreated \{Z_WP_Bridge_Train_01}
		Z_WP_Bridge_Train_01 :obj_playsound \{sk9_Slums_Train_Loop
			num_loops = -1
			vol = 400
			dropoff = 40
			dropoff_function = linear}
		Z_WP_Bridge_Train_01 :obj_playsound \{sk9_Slums_Rumble
			num_loops = -1
			vol = 300
			dropoff = 30
			dropoff_function = linear}
	endif
endscript

script sk9_m_r2_Show1_Train_Screech 
	if iscreated Z_WP_Bridge_Train_01
		RandomNoRepeat (
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	endif
	wait RandomRange (0.3, 0.8) seconds
	if iscreated Z_WP_Bridge_Train_01
		RandomNoRepeat (
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	endif
	wait RandomRange (0.3, 0.8) seconds
	if iscreated Z_WP_Bridge_Train_01
		RandomNoRepeat (
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	endif
	wait RandomRange (0.3, 0.8) seconds
	if iscreated Z_WP_Bridge_Train_01
		RandomNoRepeat (
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_01 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_02 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_03 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_04 vol = 100 dropoff = 30
			@ Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Screech_05 vol = 100 dropoff = 30
			)
	endif
endscript

script VO_gangarrest 
	getsingletag profile
	switch (<profile>.voice_profile)
		case Bum1
		RandomNoRepeat (
			@ agent_playvo VO_gangarrest_bum_01 vol = 130 dropoff = 20 dropoff_function = linear stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			@ agent_playvo VO_gangarrest_bum_02 vol = 130 dropoff = 20 dropoff_function = linear stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			)
		case thug1
		RandomNoRepeat (
			@ agent_playvo VO_gangarrest_thug_01 vol = 130 dropoff = 20 dropoff_function = linear stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			@ agent_playvo VO_gangarrest_thug_02 vol = 130 dropoff = 20 dropoff_function = linear stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			)
	endswitch
endscript

script Sk9_Temp_Goal_Chkpt_SFX_Finalepic 
	wait \{0.5
		seconds}
	playsound \{Temp_Goal_Chkpt_SFX
		vol = 65}
endscript

script TwoPedsLeanTalk_MF 
	RandomNoRepeat (
		@ wait 4.4 seconds
		agent_playvo TwoPedsLeanTalkA vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ wait 3.8 seconds
		agent_playvo TwoPedsLeanTalkB vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ wait 7.3 seconds
		agent_playvo TwoPedsLeanTalkC vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		)
endscript
VO_bumharass01_a_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}

script VO_bumharass01_a 
	RandomNoRepeat (
		@ agent_playvo \{VO_bumharass01_a1
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		@ agent_playvo \{VO_bumharass01_b1
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		)
endscript
VO_bumharass01_b_struct = {
	default_priority = 80
	default_buss = AmbScenes
	norepeatfor = 0.1
	instancemanagement = stop_oldest
	instancelimit = 1
}

script VO_bumharass01_b 
	agent_playvo \{VO_bumharass01_a2
		vol = 50
		dropoff = 15
		dropoff_function = standard
		stream_priority = 50
		logic_priority = 50
		animate_mouth = false
		can_use_stream = true
		no_pitch_mod = false
		use_pos_info = true}
endscript

script VO_bumharass01_c 
	Random (
		@ agent_playvo \{VO_bumharass01_a3
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		@ agent_playvo \{VO_bumharass01_b3
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		)
endscript

script VO_CopHarassSkater 
	Random (
		@ agent_playvo \{copharasssk8er01
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		@ agent_playvo \{copharasssk8er02
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		)
endscript

script VO_CSI_withhorrorlook01 
	RandomNoRepeat (
		@ agent_playvo CSI_withhorrorlook01_a vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo CSI_withhorrorlook01_b vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo CSI_withhorrorlook01_c vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo CSI_withhorrorlook01_d vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		)
endscript

script VO_goatbum 
	RandomNoRepeat (
		@ agent_playvo goatbum_01 vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo goatbum_02 vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo goatbum_04 vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo goatbum_05 vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		)
endscript

script VO_PedM_2PedsTalk_Sit 
	RandomNoRepeat (
		@ agent_playvo PedM_2PedsTalk_Sit_a vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo PedM_2PedsTalk_Sit_b vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo PedM_2PedsTalk_Sit_c vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo PedM_2PedsTalk_Sit_d vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		)
endscript

script VO_PedM_2PedsTalk 
	RandomNoRepeat (
		@ agent_playvo PedM_2PedsTalk_a vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo PedM_2PedsTalk_b vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo PedM_2PedsTalk_c vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		)
endscript

script VO_PedM_2PedsTalk_Sit01 
	RandomNoRepeat (
		@ agent_playvo PedM_2PedsTalk_Sit_01_a vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo PedM_2PedsTalk_Sit_01_b vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo PedM_2PedsTalk_Sit_01_c vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo PedM_2PedsTalk_Sit_01_d vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		)
endscript

script VO_PedM_GuyInPlane 
	RandomNoRepeat (
		@ agent_playvo \{VO_pedm_guyinplane01a_a
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		@ agent_playvo \{VO_pedm_guyinplane01a_b
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		)
endscript

script VO_PedM_RidingCanon01a 
	RandomNoRepeat (
		@ agent_playvo \{VO_pedm_ridingcanon01a_a
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		@ agent_playvo \{VO_pedm_ridingcanon01a_b
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		)
endscript

script VO_PedM_TourGuide01 
	agent_playvo \{VO_busf1_tourguide01
		vol = 50
		dropoff = 15
		dropoff_function = standard
		stream_priority = 50
		logic_priority = 50
		animate_mouth = false
		can_use_stream = true
		no_pitch_mod = false
		use_pos_info = true}
endscript

script VO_PedM_TourGuide02 
	agent_playvo \{VO_busf1_tourguide02
		vol = 50
		dropoff = 15
		dropoff_function = standard
		stream_priority = 50
		logic_priority = 50
		animate_mouth = false
		can_use_stream = true
		no_pitch_mod = false
		use_pos_info = true}
endscript

script VO_PedM_TourGuide03 
	agent_playvo \{VO_busf1_tourguide03
		vol = 50
		dropoff = 15
		dropoff_function = standard
		stream_priority = 50
		logic_priority = 50
		animate_mouth = false
		can_use_stream = true
		no_pitch_mod = false
		use_pos_info = true}
endscript

script VO_PlayingPlanes 
	agent_playvo \{VO_PlayingPlanes_01
		vol = 50
		dropoff = 15
		dropoff_function = standard
		stream_priority = 50
		logic_priority = 50
		animate_mouth = false
		can_use_stream = true
		no_pitch_mod = false
		use_pos_info = true}
endscript

script VO_PedM_Tourists01_TalkA 
	RandomNoRepeat (
		@ agent_playvo VO_tourists01_talka_a vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo VO_tourists01_talka_b vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo VO_tourists01_talka_c vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		)
endscript

script VO_PedMsk8r_talk01 
	RandomNoRepeat (
		@ agent_playvo VO_pedmsk8r_talk01a vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo VO_pedmsk8r_talk01c vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo VO_pedmsk8r_talk01d vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		)
endscript

script VO_PedMSk8r_talk02 
	RandomNoRepeat (
		@ agent_playvo VO_pedmsk8r_talk02b vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo VO_pedmsk8r_talk02c vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		@ agent_playvo VO_pedmsk8r_talk02d vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
		)
endscript

script VO_pedmworker_talk 
	RandomNoRepeat (
		@ agent_playvo \{pedmworker_talk_a
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		@ agent_playvo \{pedmworker_talk_b
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		)
endscript

script VO_stealingdeck 
	RandomNoRepeat (
		@ agent_playvo \{VO_stealing_deck_01
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		@ agent_playvo \{VO_stealing_deck_02
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		)
endscript

script VO_touchnose 
	RandomNoRepeat (
		@ agent_playvo \{VO_touch_nose_02
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		@ agent_playvo \{VO_touch_nose_01
			vol = 50
			dropoff = 15
			dropoff_function = standard
			stream_priority = 50
			logic_priority = 50
			animate_mouth = false
			can_use_stream = true
			no_pitch_mod = false
			use_pos_info = true}
		)
endscript

script Tourists01_TalkA 
	RandomNoRepeat (
		@ wait 5.4 seconds
		agent_playvo Tourists01_TalkA_a vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true audiocone = {lpfcone = {insideangle = 20 outsideangle = 161 outsidelevel = 1000}}
		@ wait 7.0 seconds
		agent_playvo Tourists01_TalkA_b vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true audiocone = {lpfcone = {insideangle = 20 outsideangle = 161 outsidelevel = 1000}}
		@ wait 5.4 seconds
		agent_playvo Tourists01_TalkA_c vol = 50 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true audiocone = {lpfcone = {insideangle = 20 outsideangle = 161 outsidelevel = 1000}}
		)
endscript

script NotEnough_sfx 
	wait \{0.3
		seconds}
	playsound \{small_negative_message_01}
endscript

script GoalFail_NoMusicMessing_ntt 
	if NOT issoundeventplaying m_c1_ntt_inst_01
		if NOT issoundeventplaying m_c1_ntt_inst_02
			if NOT issoundeventplaying m_c1_ntt_inst_03
				if NOT issoundeventplaying m_c1_ntt_inst_04
					if NOT issoundeventplaying m_c1_ntt_inst_05
						if NOT issoundeventplaying m_c1_ntt_inst_06
							if NOT issoundeventplaying m_c1_ntt_inst_07
								if NOT issoundeventplaying m_c1_ntt_inst_08
									if NOT issoundeventplaying m_c1_ntt_inst_09
										if NOT issoundeventplaying m_c1_ntt_inst_10
											if NOT issoundeventplaying m_c1_ntt_inst_11
												playsound sk9_GoalFail vol = 175
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script sk9_m_h1_KickNow_SFX_clearmuseums 
	playsound \{sk9_m_h1_KickNow_SFX
		vol = 150}
endscript

script Sk9_Temp_Goal_Chkpt_SFX_clearMuseums 
	playsound Temp_Goal_Chkpt_SFX vol = 65
	if NOT ($IN_AREA_THUG_1 = <area>)
		if NOT ($IN_AREA_THUG_2 = <area>)
			if NOT ($IN_AREA_THUG_3 = <area>)
				if NOT ($IN_AREA_THUG_4 = <area>)
					if NOT ($IN_AREA_THUG_5 = <area>)
						if NOT ($IN_AREA_THUG_6 = <area>)
							if ($FINAL_AREA = none)
							else
								playsound Temp_Goal_Chkpt_SFX vol = 65
							endif
						else
							playsound Temp_Goal_Chkpt_SFX vol = 65
						endif
					else
						playsound Temp_Goal_Chkpt_SFX vol = 65
					endif
				else
					playsound Temp_Goal_Chkpt_SFX vol = 65
				endif
			else
				playsound Temp_Goal_Chkpt_SFX vol = 65
			endif
		else
			playsound Temp_Goal_Chkpt_SFX vol = 65
		endif
	else
		playsound Temp_Goal_Chkpt_SFX vol = 65
	endif
endscript

script m_h1_Finalepic_Positives 
	RandomNoRepeat (
		@ playsound m_h1_finalepic_inc_pos_01 vol = 350
		@ playsound m_h1_finalepic_inc_pos_02 vol = 350
		@ playsound m_h1_epicdrop_inc_pos_01 vol = 350
		@ playsound m_h1_epicdrop_inc_pos_02 vol = 350
		@ playsound m_h1_epicdrop_inc_pos_03 vol = 350
		@ playsound m_h1_boostpull_inc_pos_02 vol = 350
		@ playsound m_h1_bigpush_inc_pos_01 vol = 350
		@ playsound m_h1_bigpush_inc_pos_02 vol = 350
		@ playsound vallely_cheerland_01 vol = 350
		@ playsound vallely_cheerland_02 vol = 350
		@ playsound vallely_cheerland_03 vol = 350
		@ playsound vallely_cheerland_04 vol = 350
		@ playsound vallely_cheerland_05 vol = 350
		@ playsound vallely_cheerland_06 vol = 350
		@ playsound vallely_cheerland_07 vol = 350
		@ playsound vallely_cheerland_08 vol = 350
		)
endscript

script m_h1_FinalEpic_Negatives 
	RandomNoRepeat (
		@ playsound m_h1_finalepic_inc_neg_01 vol = 350
		@ playsound m_h1_finalepic_inc_neg_02 vol = 350
		@ playsound m_h1_bigpush_inc_neg_01 vol = 350
		@ playsound m_h1_bigpush_inc_neg_02 vol = 350
		@ playsound vallely_booland_08 vol = 350
		@ playsound vallely_booland_09 vol = 350
		@ playsound vallely_booland_01 vol = 350
		@ playsound vallely_booland_02 vol = 350
		@ playsound vallely_booland_03 vol = 350
		@ playsound vallely_booland_04 vol = 350
		@ playsound vallely_booland_05 vol = 350
		@ playsound vallely_booland_06 vol = 350
		@ playsound vallely_booland_07 vol = 350
		)
endscript

script sk9_fdr_train_SFX 
	begin
	wait RandomRange (5.0, 15.0) seconds
	RandomNoRepeat (
		@ obj_playsound \{sk9_FDR_Train_SFX_01
			vol = 250
			pitch = 100
			emitter = z_fdr_SFX_SFX_Emitter_FDR_Train01}
		@ obj_playsound \{sk9_FDR_Train_SFX_01
			vol = 250
			pitch = 100
			emitter = z_fdr_SFX_SFX_Emitter_FDR_Train02}
		@ obj_playsound \{sk9_FDR_Train_SFX_01
			vol = 250
			pitch = 100
			emitter = z_fdr_SFX_SFX_Emitter_FDR_Train03}
		)
	repeat
endscript

script FDR_Garage_Opening_SFX 
	switch <door>
		case 1
		Z_FDR_o_mb_rolling_door_1 :obj_playsound sk9_PB_Bridge_Door_Open_01 vol = 150 dropoff = 150 dropoff_function = inv_exponential
		case 2
		Z_FDR_o_mb_rolling_door_2 :obj_playsound sk9_PB_Bridge_Door_Open_01 vol = 150 dropoff = 150 dropoff_function = inv_exponential
		case 3
		Z_FDR_o_mb_rolling_door_3 :obj_playsound sk9_PB_Bridge_Door_Open_01 vol = 150 dropoff = 150 dropoff_function = inv_exponential
		case 4
		Z_FDR_o_mb_rolling_door_4 :obj_playsound sk9_PB_Bridge_Door_Open_01 vol = 150 dropoff = 150 dropoff_function = inv_exponential
		case `default`
		playsound sk9_PB_Bridge_Door_Open_05
	endswitch
endscript

script FDR_Garage_Closing_SFX 
	switch <door>
		case 1
		Z_FDR_o_mb_rolling_door_1 :obj_playsound sk9_PB_Bridge_Door_Open_04 vol = 150 pitch = RandomRange (63.0, 72.0) dropoff = 150 dropoff_function = inv_exponential
		case 2
		Z_FDR_o_mb_rolling_door_2 :obj_playsound sk9_PB_Bridge_Door_Open_04 vol = 150 pitch = RandomRange (63.0, 72.0) dropoff = 150 dropoff_function = inv_exponential
		case 3
		Z_FDR_o_mb_rolling_door_3 :obj_playsound sk9_PB_Bridge_Door_Open_04 vol = 150 pitch = RandomRange (63.0, 72.0) dropoff = 150 dropoff_function = inv_exponential
		case 4
		Z_FDR_o_mb_rolling_door_4 :obj_playsound sk9_PB_Bridge_Door_Open_04 vol = 150 pitch = RandomRange (63.0, 72.0) dropoff = 150 dropoff_function = inv_exponential
		case `default`
		playsound sk9_PB_Bridge_Door_Open_05
	endswitch
endscript

script FDR_sliding_gate_open_sfx 
	if objectexists \{id = z_fdr_SFX_SFX_Ghost_Sliding_Gate_01}
		z_fdr_SFX_SFX_Ghost_Sliding_Gate_01 :obj_playsound \{sk9_PB_Bridge_Door_Open_01
			vol = 125
			pitch = 65
			dropoff = 30
			dropoff_function = inv_exponential}
		soundevent \{event = FDR_Chainlink_Fence_Movement
			gate = 1}
	endif
endscript

script FDR_sliding_gate_open_sfx_02 
	if objectexists \{id = z_fdr_SFX_SFX_Ghost_Sliding_Gate_02}
		z_fdr_SFX_SFX_Ghost_Sliding_Gate_02 :obj_playsound \{sk9_PB_Bridge_Door_Open_01
			vol = 125
			pitch = 65
			dropoff = 30
			dropoff_function = inv_exponential}
		soundevent \{event = FDR_Chainlink_Fence_Movement_02}
	endif
endscript

script FDR_sliding_gate_close_sfx 
	if objectexists \{id = z_fdr_SFX_SFX_Ghost_Sliding_Gate_01}
		z_fdr_SFX_SFX_Ghost_Sliding_Gate_01 :obj_playsound \{sk9_PB_Bridge_Door_Open_04
			vol = 100
			pitch = 55
			dropoff = 30
			dropoff_function = inv_exponential}
		soundevent \{event = FDR_Chainlink_Fence_Movement}
	endif
endscript

script FDR_sliding_gate_close_sfx_02 
	if objectexists \{id = z_fdr_SFX_SFX_Ghost_Sliding_Gate_02}
		z_fdr_SFX_SFX_Ghost_Sliding_Gate_02 :obj_playsound \{sk9_PB_Bridge_Door_Open_04
			vol = 100
			pitch = 55
			dropoff = 30
			dropoff_function = inv_exponential}
		soundevent \{event = FDR_Chainlink_Fence_Movement_02}
	endif
endscript

script FDR_Chainlink_Fence_Movement 
	i = 0
	begin
	if (<i> = 15)
		break
	endif
	if objectexists id = z_fdr_SFX_SFX_Ghost_Sliding_Gate_01
		RandomNoRepeat (
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_01 :obj_playsound sk8_bonk_ChainlinkFence_03 vol = 30 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_01 :obj_playsound sk8_bonk_ChainlinkFence_04 vol = 30 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_01 :obj_playsound sk8_bonk_ChainlinkFence_05 vol = 30 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_01 :obj_playsound sk8_bonk_ChainlinkFence_06 vol = 30 dropoff = 25 dropoff_function = inv_exponential
			)
	endif
	wait 0.1 seconds
	i = (<i> + 1)
	repeat
	if objectexists id = z_fdr_SFX_SFX_Ghost_Sliding_Gate_01
		RandomNoRepeat (
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_01 :obj_playsound sk8_bonk_ChainlinkFence_03 vol = 150 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_01 :obj_playsound sk8_bonk_ChainlinkFence_04 vol = 150 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_01 :obj_playsound sk8_bonk_ChainlinkFence_05 vol = 150 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_01 :obj_playsound sk8_bonk_ChainlinkFence_06 vol = 150 dropoff = 25 dropoff_function = inv_exponential
			)
	endif
endscript

script FDR_Chainlink_Fence_Movement_02 
	i = 0
	begin
	if (<i> = 15)
		break
	endif
	if objectexists id = z_fdr_SFX_SFX_Ghost_Sliding_Gate_02
		RandomNoRepeat (
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_02 :obj_playsound sk8_bonk_ChainlinkFence_03 vol = 30 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_02 :obj_playsound sk8_bonk_ChainlinkFence_04 vol = 30 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_02 :obj_playsound sk8_bonk_ChainlinkFence_05 vol = 30 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_02 :obj_playsound sk8_bonk_ChainlinkFence_06 vol = 30 dropoff = 25 dropoff_function = inv_exponential
			)
	endif
	wait 0.1 seconds
	i = (<i> + 1)
	repeat
	if objectexists id = z_fdr_SFX_SFX_Ghost_Sliding_Gate_02
		RandomNoRepeat (
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_02 :obj_playsound sk8_bonk_ChainlinkFence_03 vol = 150 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_02 :obj_playsound sk8_bonk_ChainlinkFence_04 vol = 150 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_02 :obj_playsound sk8_bonk_ChainlinkFence_05 vol = 150 dropoff = 25 dropoff_function = inv_exponential
			@ z_fdr_SFX_SFX_Ghost_Sliding_Gate_02 :obj_playsound sk8_bonk_ChainlinkFence_06 vol = 150 dropoff = 25 dropoff_function = inv_exponential
			)
	endif
endscript

script FDR_Crate_Skater_Check_SFX 
	RandomNoRepeat (
		@ playsound \{Fence_Break_01
			vol = 250}
		@ playsound \{Fence_Break_02
			vol = 250}
		@ playsound \{Fence_Break_03
			vol = 250}
		)
endscript

script SFX_FDR_Warehouse_Window_Shatter 
	switch <window>
		case Z_FDR_g_mb_window_shatter_4
		z_fdr_SFX_SFX_FDR_Warehouse_Glass_Window_01 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (120.0, 170.0) pitch = RandomRange (80.0, 110.0)
		wait 0.5 seconds
		z_fdr_SFX_SFX_FDR_Warehouse_Glass_Window_01 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0)
		case Z_FDR_g_mb_window_shatter_3
		z_fdr_SFX_SFX_FDR_Warehouse_Glass_Window_02 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (120.0, 170.0) pitch = RandomRange (80.0, 110.0)
		wait 0.5 seconds
		z_fdr_SFX_SFX_FDR_Warehouse_Glass_Window_02 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0)
		case Z_FDR_g_mb_window_shatter_1
		z_fdr_SFX_SFX_FDR_Warehouse_Glass_Window_03 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (120.0, 170.0) pitch = RandomRange (80.0, 110.0)
		wait 0.5 seconds
		z_fdr_SFX_SFX_FDR_Warehouse_Glass_Window_03 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0)
		case Z_FDR_g_mb_window_shatter_2
		z_fdr_SFX_SFX_FDR_Warehouse_Glass_Window_04 :obj_playsound sk9_Glass_Break_Big_1 vol = RandomRange (120.0, 170.0) pitch = RandomRange (80.0, 110.0)
		wait 0.5 seconds
		z_fdr_SFX_SFX_FDR_Warehouse_Glass_Window_04 :obj_playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0)
		case `default`
		playsound sk9_Glass_Break_Big_1 vol = RandomRange (120.0, 170.0) pitch = RandomRange (80.0, 110.0)
		wait 0.5 seconds
		playsound sk9_Glass_Break_Big_2 vol = RandomRange (50.0, 120.0) pitch = RandomRange (70.0, 140.0)
	endswitch
endscript

script m_h3_ntb_Lance_positive_slash 
	wait \{0.5
		seconds}
	RandomNoRepeat (
		@ playsound \{m_h3_NTB_inc_pos_01
			vol = 200}
		@ playsound \{m_h3_NTB_inc_pos_02
			vol = 200}
		@ playsound \{m_h3_NTB_inc_pos_03
			vol = 200}
		@ 
		@ 
		@ 
		)
endscript

script m_h3_ntb_Lance_positive_carve 
	wait \{0.5
		seconds}
	RandomNoRepeat (
		@ playsound \{m_h3_NTB_inc_pos_01
			vol = 200}
		@ playsound \{m_h3_NTB_inc_pos_04
			vol = 200}
		@ 
		@ 
		)
endscript

script sk9_metal_sign_punch 
	playsound \{sk9_metal_sign_punch
		vol = 400}
endscript

script m_r3_Monuments_chkp2p1_VO 
	wait \{1
		seconds}
	playsound \{m_r3_momeuments_inst_02
		vol = 350}
endscript

script midgoal_rank_sfx_Classic 
	wait \{0.120000005
		seconds}
	playsound \{sk9_midgoal_rank}
endscript

script VO_m_c2_localcomp_Neg 
	RandomNoRepeat (
		@ playsound \{m_c2_localcomp_inc_neg_01
			vol = 80}
		@ playsound \{m_c2_localcomp_inc_neg_02
			vol = 80}
		@ playsound \{m_c2_localcomp_inc_neg_03
			vol = 80}
		@ 
		@ 
		@ 
		)
endscript

script VO_m_c2_localcomp_Positives 
	if gotparam cheer
		gman_getdata goal = m_c2_localcomp
		if NOT (<e3_points> > 0)
			printf 'NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
			printf 'NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
			printf 'NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
			printf 'NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
			if (<cheer> = 1)
				RandomNoRepeat (
					@ playsound m_c2_localcomp_inc_pos_01 vol = 80
					@ playsound m_c2_localcomp_inc_pos_02 vol = 80
					@ playsound m_c2_localcomp_inc_pos_03 vol = 80
					@ playsound m_c2_localcomp_inc_pos_04 vol = 80
					@ playsound m_c2_localcomp_inc_pos_05 vol = 80
					@ 
					@ 
					@ 
					@ 
					@ 
					@ 
					)
			elseif (<cheer> = 2)
				RandomNoRepeat (
					@ playsound m_c2_localcomp_inc_pos_01 vol = 400
					@ playsound m_c2_localcomp_inc_pos_02 vol = 400
					@ playsound m_c2_localcomp_inc_pos_03 vol = 400
					@ playsound m_c2_localcomp_inc_pos_04 vol = 400
					@ playsound m_c2_localcomp_inc_pos_05 vol = 400
					@ 
					@ 
					@ 
					@ 
					)
			elseif (<cheer> = 3)
				RandomNoRepeat (
					@ playsound m_c2_localcomp_inc_pos_01 vol = 400
					@ playsound m_c2_localcomp_inc_pos_02 vol = 400
					@ playsound m_c2_localcomp_inc_pos_03 vol = 400
					@ playsound m_c2_localcomp_inc_pos_04 vol = 400
					@ playsound m_c2_localcomp_inc_pos_05 vol = 400
					)
			endif
		endif
	else
		RandomNoRepeat (
			@ playsound m_c2_localcomp_inc_pos_01 vol = 400
			@ playsound m_c2_localcomp_inc_pos_02 vol = 400
			@ playsound m_c2_localcomp_inc_pos_03 vol = 400
			@ playsound m_c2_localcomp_inc_pos_04 vol = 400
			@ playsound m_c2_localcomp_inc_pos_05 vol = 400
			@ 
			@ 
			@ 
			)
	endif
endscript

script Classic_Mode_Out_of_bounds_Timer_Beep_sfx 
	playsound SK8_Negative_Beep vol = 40 pitch = 120
	if gman_getactivatedgoalid
		if (<activated_goal_id> = m_c2_localcomp)
			if NOT issoundeventplaying VO_m_c2_localcomp_Bails
				soundevent event = VO_m_c2_localcomp_Announc_OutofBounds
			endif
		elseif (<activated_goal_id> = m_c2_compstreet)
			if NOT issoundeventplaying VO_m_c2_localcomp_Bails
				soundevent event = VO_m_c2_localcomp_Announc_OutofBounds
			endif
		elseif (<activated_goal_id> = m_c2_compvert)
			if NOT issoundeventplaying VO_m_c2_localcomp_Bails
				soundevent event = VO_m_c2_localcomp_Announc_OutofBounds
			endif
		elseif (<activated_goal_id> = m_r1_showdown)
			if NOT issoundeventplaying VO_m_c2_localcomp_Bails
				soundevent event = VO_m_c2_localcomp_Announc_OutofBounds
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Bails 
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
										if NOT issoundeventplaying VO_m_c2_localcomp_Announc_OutofBounds
											RandomNoRepeat (
												@ playsound m_c2_comppark_inc_neg_01 vol = 400
												@ playsound m_c2_comppark_inc_neg_02 vol = 400
												@ playsound m_c2_comppark_inc_neg_03 vol = 400
												@ playsound m_c2_comppark_inc_neg_04 vol = 400
												@ playsound m_c2_comppark_inc_neg_05 vol = 400
												@ playsound announcer_bail_1a vol = 400
												@ playsound announcer_bail_1b vol = 400
												@ playsound announcer_bail_1c vol = 400
												@ playsound announcer_bail_2a vol = 400
												@ playsound announcer_bail_2b vol = 400
												@ playsound announcer_bail_2c vol = 400
												@ playsound announcer_bail_3a vol = 400
												@ playsound announcer_bail_3b vol = 400
												@ playsound announcer_bail_3c vol = 400
												@ playsound announcer_booland_01 vol = 400
												@ playsound announcer_booland_02 vol = 400
												@ playsound announcer_booland_03 vol = 400
												@ playsound announcer_booland_04 vol = 400
												@ playsound announcer_booland_05 vol = 400
												@ playsound announcer_booland_06 vol = 400
												@ playsound announcer_booland_07 vol = 400
												@ playsound announcer_booland_08 vol = 400
												@ playsound announcer_booland_09 vol = 400
												@ playsound announcer_booland_10 vol = 400
												@ playsound announcer_booland_11 vol = 400
												@ playsound announcer_booland_13 vol = 400
												@ playsound announcer_booland_14 vol = 400
												)
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Annouc_SloppyLanding 
	getscoreinfo
	stars
	stars
	stars
	printstruct <...>
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
										if (<ScorePot> > 10000)
											RandomNoRepeat (
												@ playsound announcer_landed_sloppy_ok_01 vol = 400
												@ playsound announcer_landed_sloppy_ok_02 vol = 400
												@ playsound announcer_landed_sloppy_ok_03 vol = 400
												)
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Annouc_CleanLanding 
	getscoreinfo
	if (<ScorePot> > 100000)
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
								if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
										if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
											RandomNoRepeat (
												@ playsound m_c2_comppark_inc_2_07 vol = 400
												@ playsound announcer_landed_clean_3a vol = 400
												@ playsound announcer_landed_clean_3b vol = 400
												@ playsound announcer_landed_clean_3c vol = 400
												)
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	else
		if (<ScorePot> > 50000)
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
										if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
											if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
												RandomNoRepeat (
													@ playsound announcer_landed_clean_2a vol = 400
													@ playsound announcer_landed_clean_2b vol = 400
													@ playsound announcer_landed_clean_2c vol = 400
													)
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		else
			if (<ScorePot> > 25000)
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
										if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
											if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
												if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
													RandomNoRepeat (
														@ playsound announcer_landed_clean_1a vol = 400
														@ playsound announcer_landed_clean_1b vol = 400
														@ playsound announcer_landed_clean_1c vol = 400
														)
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			elseif (<ScorePot> > 10000)
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
									if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
										if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
											if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
												if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
													RandomNoRepeat (
														@ playsound announcer_landed_clean_1a vol = 400
														@ playsound announcer_landed_clean_1b vol = 400
														@ playsound announcer_landed_clean_1c vol = 400
														)
												endif
											endif
										endif
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Annouc_INCOMBO 
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
										RandomNoRepeat (
											@ playsound m_c2_comppark_inc_pos_07 vol = 400
											@ playsound m_c2_comppark_inc_pos_04 vol = 400
											@ playsound m_c2_comppark_inc_pos_03 vol = 400
											@ playsound m_c2_comppark_inc_pos_02 vol = 400
											@ playsound m_c2_comppark_inc_pos_01 vol = 400
											@ playsound m_c2_comppark_inc_pos_06 vol = 400
											@ playsound m_c2_comppark_inc_pos_05 vol = 400
											@ playsound m_c2_comppark_inc_pos_08 vol = 400
											@ playsound m_c2_comppark_inc_2_06 vol = 400
											@ playsound announcer_combo_pending_1a vol = 400
											@ playsound announcer_combo_pending_1b vol = 400
											@ playsound announcer_combo_pending_1c vol = 400
											@ playsound announcer_combo_pending_2a vol = 400
											@ playsound announcer_combo_pending_2b vol = 400
											@ playsound announcer_combo_pending_2c vol = 400
											@ playsound announcer_combo_pending_3a vol = 400
											@ playsound announcer_combo_pending_3b vol = 400
											@ playsound announcer_combo_pending_3c vol = 400
											@ playsound announcer_keepitup_01 vol = 400
											@ playsound announcer_keepitup_02 vol = 400
											@ playsound announcer_keepitup_03 vol = 400
											@ playsound announcer_keepitup_04 vol = 400
											@ playsound announcer_keepitup_06 vol = 400
											@ playsound announcer_keepitup_07 vol = 400
											@ playsound announcer_keepitup_08 vol = 400
											@ playsound announcer_keepitup_09 vol = 400
											@ playsound announcer_keepitup_10 vol = 400
											@ playsound announcer_keepitup_11 vol = 400
											@ playsound announcer_keepitup_12 vol = 400
											@ playsound announcer_keepitup_13 vol = 400
											@ playsound announcer_keepitup_14 vol = 400
											@ playsound announcer_keepitup_15 vol = 400
											@ playsound announcer_keepitup_16 vol = 400
											@ playsound announcer_keepitup_17 vol = 400
											@ playsound announcer_keepitup_18 vol = 400
											@ playsound announcer_keepitup_20 vol = 400
											)
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Annouc_INCOMBO_SICK 
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
										RandomNoRepeat (
											@ playsound announcer_combo_pending_1b vol = 400
											@ playsound announcer_combo_pending_2c vol = 400
											@ playsound announcer_combo_pending_3a vol = 400
											@ playsound announcer_combo_pending_3c vol = 400
											@ playsound announcer_keepitup_02 vol = 400
											@ playsound announcer_keepitup_08 vol = 400
											@ playsound announcer_keepitup_09 vol = 400
											@ playsound announcer_keepitup_11 vol = 400
											@ playsound announcer_keepitup_12 vol = 400
											@ playsound announcer_keepitup_13 vol = 400
											@ playsound announcer_keepitup_14 vol = 400
											@ playsound announcer_keepitup_15 vol = 400
											@ playsound announcer_keepitup_16 vol = 400
											@ playsound announcer_keepitup_17 vol = 400
											@ playsound announcer_keepitup_18 vol = 400
											@ playsound announcer_keepitup_20 vol = 400
											)
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Annouc_TIME 
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
										RandomNoRepeat (
											@ playsound announcer_timerunningout_01 vol = 400
											@ playsound announcer_timerunningout_02 vol = 400
											@ playsound announcer_timerunningout_03 vol = 400
											@ playsound announcer_timerunningout_04 vol = 400
											)
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Annouc_AMLAND 
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
									RandomNoRepeat (
										@ playsound announcer_cheerland_03 vol = 400
										@ playsound announcer_cheerland_05 vol = 400
										@ playsound announcer_cheerland_06 vol = 400
										@ playsound announcer_cheerland_07 vol = 400
										@ playsound announcer_cheerland_10 vol = 400
										@ playsound announcer_cheerland_12 vol = 400
										@ playsound announcer_cheerland_23 vol = 400
										@ playsound announcer_cheerland_26 vol = 400
										@ playsound announcer_cheerland_28 vol = 400
										@ playsound announcer_landed_1a vol = 400
										@ playsound announcer_landed_1b vol = 400
										@ playsound announcer_landed_2a vol = 400
										@ playsound announcer_landed_2b vol = 400
										@ playsound announcer_landed_2c vol = 400
										)
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Announc_PROLAND 
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
									RandomNoRepeat (
										@ playsound announcer_cheerland_01 vol = 400
										@ playsound announcer_cheerland_02 vol = 400
										@ playsound announcer_cheerland_04 vol = 400
										@ playsound announcer_cheerland_08 vol = 400
										@ playsound announcer_cheerland_09 vol = 400
										@ playsound announcer_cheerland_13 vol = 400
										@ playsound announcer_cheerland_18 vol = 400
										@ playsound announcer_cheerland_19 vol = 400
										@ playsound announcer_cheerland_27 vol = 400
										@ playsound announcer_landed_1c vol = 400
										@ playsound announcer_landed_3b vol = 400
										@ playsound announcer_landed_3c vol = 400
										)
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Announc_SICKLAND 
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
									RandomNoRepeat (
										@ playsound m_c2_comppark_inc_2_02 vol = 400
										@ playsound announcer_cheerland_11 vol = 400
										@ playsound announcer_cheerland_14 vol = 400
										@ playsound announcer_cheerland_16 vol = 400
										@ playsound announcer_cheerland_15 vol = 400
										@ playsound announcer_cheerland_17 vol = 400
										@ playsound announcer_cheerland_20 vol = 400
										@ playsound announcer_cheerland_21 vol = 400
										@ playsound announcer_cheerland_22 vol = 400
										@ playsound announcer_cheerland_24 vol = 400
										@ playsound announcer_cheerland_29 vol = 400
										@ playsound announcer_cheerland_30 vol = 400
										)
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script Close_Call 
	soundevent event = Crowd_Ped_AI_Comp_CheerLand_SMALL
	soundevent event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM
	RandomNoRepeat (
		@ playsound announcer_cheerland_01 vol = 400
		@ playsound announcer_cheerland_05 vol = 400
		@ playsound announcer_cheerland_22 vol = 400
		@ playsound announcer_cheerland_28 vol = 400
		@ playsound announcer_cheerland_03 vol = 400
		@ playsound announcer_combo_pending_2a vol = 400
		@ playsound announcer_keepitup_11 vol = 400
		@ playsound announcer_landed_1a vol = 400
		)
endscript

script VO_m_impress_c1_inc_pos 
	RandomNoRepeat (
		@ playsound m_impress_c1_inc_pos_01 vol = 350
		@ playsound saari_cheerland_01 vol = 400
		@ playsound saari_cheerland_02 vol = 400
		@ playsound saari_cheerland_03 vol = 400
		@ playsound saari_cheerland_04 vol = 400
		@ playsound saari_cheerland_05 vol = 400
		@ playsound saari_cheerland_06 vol = 400
		@ playsound saari_cheerland_07 vol = 400
		)
endscript

script Saari_neg_impress_c1 
	RandomNoRepeat (
		@ playsound saari_booland_01 vol = 400
		@ playsound saari_booland_02 vol = 400
		@ playsound saari_booland_03 vol = 400
		@ playsound saari_booland_04 vol = 400
		@ playsound saari_booland_05 vol = 400
		@ playsound saari_booland_06 vol = 400
		@ playsound saari_booland_07 vol = 400
		@ playsound saari_booland_08 vol = 400
		@ playsound saari_booland_09 vol = 400
		)
endscript

script sk9_goal_comp_crowd_surges_showdown 
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_BIG}
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_SMALL}
	soundevent \{event = VO_m_c2_localcomp_Announc_SICKLAND}
endscript

script sk9_goal_comp_crowd_surges_showdown2 
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM}
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_SMALL}
	soundevent \{event = VO_m_c2_localcomp_Announc_PROLAND}
endscript

script sk9_goal_comp_crowd_surges_showdown3 
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM}
	soundevent \{event = VO_m_c2_localcomp_Annouc_AMLAND}
endscript

script Medal_SFX 
	wait \{1
		second}
	stars
	stars
	printstruct <...>
	if gotparam \{choose}
		stars
		stars
		stars
		if (<choose> = 1)
			soundevent \{event = medal_am_sfx}
		elseif (<choose> = 2)
			soundevent \{event = medal_pro_sfx}
		elseif (<choose> = 3)
			soundevent \{event = medal_sick_sfx}
		endif
	endif
endscript

script GoalFail_NoMusicMessing_NoRepeat 
	playsound \{sk9_GoalFail
		vol = 175}
	if issoundplaying \{sk9_Cart_Loop}
		stopsound \{sk9_Cart_Loop}
	endif
endscript

script skate_poster_rip 
	wait \{0.25
		seconds}
	RandomNoRepeat (
		@ skater :obj_playsound \{sk9_poster_01
			vol = 200}
		@ skater :obj_playsound \{sk9_poster_02
			vol = 200}
		@ skater :obj_playsound \{sk9_poster_03
			vol = 200}
		)
	skater :obj_playsound \{sk9_poster_Rip
		vol = 200}
endscript

script street_goal_pos 
	RandomNoRepeat (
		@ playsound VO_generic_goal_callout_sktf1_pos_01 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_02 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_03 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_04 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_05 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_06 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_07 vol = 70
		@ playsound generic_goal_callout_pos_01 vol = 70
		@ playsound generic_goal_callout_pos_02 vol = 70
		@ playsound generic_goal_callout_pos_03 vol = 70
		@ playsound generic_goal_callout_pos_04 vol = 70
		@ playsound generic_goal_callout_pos_05 vol = 70
		@ playsound generic_goal_callout_pos_06 vol = 70
		@ playsound generic_goal_callout_pos_07 vol = 70
		@ playsound generic_goal_callout_pos_08 vol = 70
		@ playsound generic_goal_callout_pos_09 vol = 70
		@ playsound generic_goal_callout_pos_10 vol = 70
		@ playsound generic_goal_callout_pos_11 vol = 70
		@ playsound generic_goal_callout_pos_12 vol = 70
		@ playsound generic_goal_callout_pos_13 vol = 70
		@ playsound generic_goal_callout_pos_14 vol = 70
		)
	RandomNoRepeat (
		@ playsound Cheer_Small_01
		@ playsound Cheer_Small_02
		@ playsound Cheer_Small_03
		@ playsound Cheer_Small_04
		@ playsound Cheer_Small_05
		@ playsound Cheer_Small_06
		@ playsound Cheer_Small_07
		)
endscript

script street_goal_car 
	RandomNoRepeat (
		@ playsound VO_generic_goal_callout_sktf1_pos_car_01 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_car_02 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_car_03 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_car_04 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_car_05 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_car_06 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_car_07 vol = 70
		@ playsound generic_goal_callout_pos_car_01 vol = 70
		@ playsound generic_goal_callout_pos_car_02 vol = 70
		@ playsound generic_goal_callout_pos_car_03 vol = 70
		@ playsound generic_goal_callout_pos_car_04 vol = 70
		@ playsound generic_goal_callout_pos_car_05 vol = 70
		@ playsound generic_goal_callout_pos_car_06 vol = 70
		@ playsound generic_goal_callout_pos_car_07 vol = 70
		@ playsound generic_goal_callout_pos_car_08 vol = 70
		)
	RandomNoRepeat (
		@ playsound Cheer_Small_01
		@ playsound Cheer_Small_02
		@ playsound Cheer_Small_03
		@ playsound Cheer_Small_04
		@ playsound Cheer_Small_05
		@ playsound Cheer_Small_06
		@ playsound Cheer_Small_07
		)
endscript

script street_goal_rig 
	RandomNoRepeat (
		@ playsound VO_generic_goal_callout_sktf1_pos_rig_01 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_rig_02 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_rig_03 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_rig_04 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_rig_05 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_rig_06 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_rig_07 vol = 70
		@ playsound generic_goal_callout_pos_rig_01 vol = 70
		@ playsound generic_goal_callout_pos_rig_02 vol = 70
		@ playsound generic_goal_callout_pos_rig_03 vol = 70
		@ playsound generic_goal_callout_pos_rig_04 vol = 70
		@ playsound generic_goal_callout_pos_rig_05 vol = 70
		@ playsound generic_goal_callout_pos_rig_06 vol = 70
		@ playsound generic_goal_callout_pos_rig_07 vol = 70
		)
	RandomNoRepeat (
		@ playsound Cheer_Small_01
		@ playsound Cheer_Small_02
		@ playsound Cheer_Small_03
		@ playsound Cheer_Small_04
		@ playsound Cheer_Small_05
		@ playsound Cheer_Small_06
		@ playsound Cheer_Small_07
		)
endscript

script street_goal_hxc 
	RandomNoRepeat (
		@ playsound VO_generic_goal_callout_sktf1_pos_har_01 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_har_02 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_har_03 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_har_04 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_har_05 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_har_06 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_har_07 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_har_08 vol = 70
		@ playsound generic_goal_callout_pos_har_01 vol = 70
		@ playsound generic_goal_callout_pos_har_02 vol = 70
		@ playsound generic_goal_callout_pos_har_03 vol = 70
		@ playsound generic_goal_callout_pos_har_04 vol = 70
		@ playsound generic_goal_callout_pos_har_05 vol = 70
		@ playsound generic_goal_callout_pos_har_06 vol = 70
		@ playsound generic_goal_callout_pos_har_07 vol = 70
		@ playsound generic_goal_callout_pos_har_08 vol = 70
		)
	RandomNoRepeat (
		@ playsound Cheer_Small_01
		@ playsound Cheer_Small_02
		@ playsound Cheer_Small_03
		@ playsound Cheer_Small_04
		@ playsound Cheer_Small_05
		@ playsound Cheer_Small_06
		@ playsound Cheer_Small_07
		)
endscript

script street_goal_am 
	RandomNoRepeat (
		@ playsound VO_generic_goal_callout_sktf1_pos_am_01 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_am_02 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_am_03 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_am_04 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_am_05 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_am_06 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_am_07 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_am_08 vol = 70
		@ playsound generic_goal_callout_pos_am_01 vol = 70
		@ playsound generic_goal_callout_pos_am_02 vol = 70
		@ playsound generic_goal_callout_pos_am_03 vol = 70
		@ playsound generic_goal_callout_pos_am_04 vol = 70
		@ playsound generic_goal_callout_pos_am_05 vol = 70
		@ playsound generic_goal_callout_pos_am_06 vol = 70
		@ playsound generic_goal_callout_pos_am_07 vol = 70
		@ playsound generic_goal_callout_pos_am_08 vol = 70
		)
	RandomNoRepeat (
		@ playsound Cheer_Small_01
		@ playsound Cheer_Small_02
		@ playsound Cheer_Small_03
		@ playsound Cheer_Small_04
		@ playsound Cheer_Small_05
		@ playsound Cheer_Small_06
		@ playsound Cheer_Small_07
		)
endscript

script street_goal_pro 
	RandomNoRepeat (
		@ playsound VO_generic_goal_callout_sktf1_pos_pro_01 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_pro_02 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_pro_03 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_pro_04 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_pro_05 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_pro_06 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_pro_07 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_pro_08 vol = 70
		@ playsound generic_goal_callout_pos_pro_01 vol = 70
		@ playsound generic_goal_callout_pos_pro_02 vol = 70
		@ playsound generic_goal_callout_pos_pro_03 vol = 70
		@ playsound generic_goal_callout_pos_pro_04 vol = 70
		@ playsound generic_goal_callout_pos_pro_05 vol = 70
		@ playsound generic_goal_callout_pos_pro_06 vol = 70
		@ playsound generic_goal_callout_pos_pro_07 vol = 70
		@ playsound generic_goal_callout_pos_pro_08 vol = 70
		)
	RandomNoRepeat (
		@ playsound Cheer_Small_01
		@ playsound Cheer_Small_02
		@ playsound Cheer_Small_03
		@ playsound Cheer_Small_04
		@ playsound Cheer_Small_05
		@ playsound Cheer_Small_06
		@ playsound Cheer_Small_07
		)
endscript

script street_goal_team 
	RandomNoRepeat (
		@ playsound VO_generic_goal_callout_sktf1_pos_team_01 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_team_02 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_team_03 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_team_04 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_team_05 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_team_06 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_team_07 vol = 70
		@ playsound VO_generic_goal_callout_sktf1_pos_team_08 vol = 70
		@ playsound generic_goal_callout_pos_team_01 vol = 70
		@ playsound generic_goal_callout_pos_team_02 vol = 70
		@ playsound generic_goal_callout_pos_team_03 vol = 70
		@ playsound generic_goal_callout_pos_team_04 vol = 70
		@ playsound generic_goal_callout_pos_team_05 vol = 70
		@ playsound generic_goal_callout_pos_team_06 vol = 70
		@ playsound generic_goal_callout_pos_team_07 vol = 70
		@ playsound generic_goal_callout_pos_team_08 vol = 70
		)
	RandomNoRepeat (
		@ playsound Cheer_Small_01
		@ playsound Cheer_Small_02
		@ playsound Cheer_Small_03
		@ playsound Cheer_Small_04
		@ playsound Cheer_Small_05
		@ playsound Cheer_Small_06
		@ playsound Cheer_Small_07
		)
endscript

script street_goal_neg 
	RandomNoRepeat (
		@ playsound \{generic_neg_01}
		@ playsound \{generic_neg_02}
		@ playsound \{generic_neg_03}
		@ playsound \{generic_neg_04}
		@ playsound \{generic_neg_05}
		@ playsound \{generic_neg_06}
		@ playsound \{generic_neg_07}
		@ playsound \{generic_neg_08}
		)
endscript

script natas_squid_sfx 
	RandomNoRepeat (
		@ playsound \{natas_squid01
			vol = 300}
		@ playsound \{natas_squid02
			vol = 300}
		)
	wait \{0.2
		seconds}
	playsound \{Temp_Goal_Chkpt_SFX}
endscript

script Timer_Progression_Sound 
	gman_timerfunc \{goal = m_h3_secret2
		tool = bowl_timer
		func = get_time}
	printstruct <...>
	if (<time> < 40)
		sk9_Focus_Timer_2
	endif
endscript

script sk9_Focus_Timer_2 
	playsound \{sk9_Focus_Timer17
		vol = 250
		pitch = 120}
	wait \{0.2
		seconds}
	setsoundparams \{sk9_Focus_Timer17
		pitch = 160}
	wait \{0.2
		seconds}
	setsoundparams \{sk9_Focus_Timer17
		pitch = 190}
endscript

script VO_m_h3_secret2_neg 
	wait \{0.4
		seconds}
	RandomNoRepeat (
		@ playsound \{m_h3_secret2_inc_neg_01
			vol = 350}
		@ playsound \{m_h3_secret2_inc_neg_02
			vol = 350}
		@ playsound \{m_h3_secret2_inc_neg_03
			vol = 350}
		@ playsound \{m_h3_secret2_inc_neg_04
			vol = 350}
		@ 
		@ 
		@ 
		@ 
		)
endscript

script VO_m_h3_secret2_pos 
	wait \{0.4
		seconds}
	RandomNoRepeat (
		@ playsound \{m_h3_secret2_inc_pos_01
			vol = 350}
		@ playsound \{m_h3_secret2_inc_pos_02
			vol = 350}
		@ playsound \{m_h3_secret2_inc_pos_03
			vol = 350}
		)
endscript

script VO_m_h3_secret2_pos_2 
	RandomNoRepeat (
		@ soundevent \{event = VO_m_h3_secret2_pos}
		@ 
		@ 
		@ 
		)
endscript

script VO_m_h3_secret1_pos_2 
	RandomNoRepeat (
		@ soundevent \{event = VO_m_h3_secret1_pos}
		@ 
		@ 
		@ 
		)
endscript

script VO_m_h3_secret1_pos 
	wait \{0.4
		seconds}
	RandomNoRepeat (
		@ playsound \{m_h3_secret2_inc_pos_01
			vol = 350}
		@ playsound \{m_h3_secret2_inc_pos_03
			vol = 350}
		)
endscript

script VO_m_c3_epicphoto4_inst_01 
	playsound \{m_c3_epicphoto4_inst_01
		vol = 350}
endscript

script VO_m_c3_epicphoto4_inst_02 
	playsound \{m_c3_epicphoto4_inst_02
		vol = 350}
endscript

script sk9_House_Sliding_Door_Open 
	if iscreated \{z_slums_SFX_SFX_House_Door01}
		obj_playsound \{sk9_House_Slide_Open
			vol = 200
			emitter = z_slums_SFX_SFX_House_Door01
			dropoff = 30
			dropoff_function = inv_exponential}
	endif
endscript

script sk9_House_Sliding_Door_Close 
	if iscreated \{z_slums_SFX_SFX_House_Door01}
		obj_playsound \{sk9_House_Slide_Close
			vol = 100
			emitter = z_slums_SFX_SFX_House_Door01
			dropoff = 20
			dropoff_function = inv_exponential}
	endif
endscript

script m_c2_ntg_Out_Of_Pause 
	soundevent \{event = sk9_Outof_Skater_Stop}
endscript

script GoalFail_NoMusicMessing_ntg 
	playsound \{sk9_GoalFail
		vol = 175}
endscript
rage_soundbuss_active = 0

script rage_sfx 
	if (($epicpush_soundbuss_active) = 1)
		printpushpopdebuginfo pop name = "popping epic push for RAGE"
		change epicpush_soundbuss_active = 0
		popsoundbussparams
	endif
	if (($focus_mode_buss_set_active) = 0)
		if (($ntt_soundbuss_active) = 0)
			if (($rage_soundbuss_active) = 1)
				printpushpopdebuginfo pop name = "popping for next level of rage"
				change rage_soundbuss_active = 0
				popsoundbussparams
			endif
			if gotparam rage_sfx_data
				if NOT issoundplaying rage_heart_sfx
					soundevent event = rage_heart_sfx
				endif
				if (<rage_sfx_data> = 1)
					playsound sk8_Nail_Trick_Design_03 vol = 150
					if NOT issoundplaying sk9_ntt_sfx_loop_front
						playsound sk9_ntt_sfx_loop_front priority = 100 vol = 220 pitch = 40 num_loops = -1 pan1x = -1 pan1y = -0.5 pan2x = 1 pan2y = -0.5
					endif
					change rage_soundbuss_active = 1
					printpushpopdebuginfo push name = "pushing into rage level 1"
					pushsoundbussparams
					setsoundbussparams $Rage_1_BussSet
				endif
				if (<rage_sfx_data> = 2)
					playsound sk8_Nail_Trick_Design_03 vol = 150
					change rage_soundbuss_active = 1
					printpushpopdebuginfo push name = "pushing into rage level 2"
					pushsoundbussparams
					setsoundbussparams $Rage_2_BussSet
					if issoundplaying rage_heart_sfx
						setsoundparams rage_heart_sfx vol = 125 pitch = 105 pan1x = -1 pan1y = 0.9 pan2x = 1 pan2y = 0.9
					endif
					if issoundplaying sk9_ntt_sfx_loop_front
						setsoundparams sk9_ntt_sfx_loop_front vol = 240 pitch = 40
					endif
				endif
				if (<rage_sfx_data> = 3)
					playsound sk8_Nail_Trick_Design_03 vol = 150
					change rage_soundbuss_active = 1
					printpushpopdebuginfo push name = "pushing into rage level 3"
					pushsoundbussparams
					setsoundbussparams $Rage_3_BussSet
					if issoundplaying rage_heart_sfx
						setsoundparams rage_heart_sfx vol = 150 pitch = 110 pan1x = -1 pan1y = 0.8 pan2x = 1 pan2y = 0.8
					endif
					if issoundplaying sk9_ntt_sfx_loop_front
						setsoundparams sk9_ntt_sfx_loop_front vol = 260 pitch = 40
					endif
				endif
				if (<rage_sfx_data> = 4)
					playsound sk8_Nail_Trick_Design_03 vol = 150
					change rage_soundbuss_active = 1
					printpushpopdebuginfo push name = "pushing into rage level 4"
					pushsoundbussparams
					setsoundbussparams $Rage_4_BussSet
					if issoundplaying rage_heart_sfx
						setsoundparams rage_heart_sfx vol = 175 pitch = 115 pan1x = -1 pan1y = 0.7 pan2x = 1 pan2y = 0.7
					endif
					if issoundplaying sk9_ntt_sfx_loop_front
						setsoundparams sk9_ntt_sfx_loop_front vol = 280 pitch = 40
					endif
				endif
				if (<rage_sfx_data> = 5)
					playsound sk8_Nail_Trick_Design_03 vol = 150
					change rage_soundbuss_active = 1
					printpushpopdebuginfo push name = "pushing into rage level 5"
					pushsoundbussparams
					setsoundbussparams $Rage_5_BussSet
					if issoundplaying rage_heart_sfx
						setsoundparams rage_heart_sfx vol = 200 pitch = 120 pan1x = -1 pan1y = 0.6 pan2x = 1 pan2y = 0.6
					endif
					if issoundplaying sk9_ntt_sfx_loop_front
						setsoundparams sk9_ntt_sfx_loop_front vol = 300 pitch = 40
					endif
				endif
				if (<rage_sfx_data> = 6)
					playsound sk8_Nail_Trick_Design_03 vol = 150
					change rage_soundbuss_active = 1
					printpushpopdebuginfo push name = "pushing into rage level 6"
					pushsoundbussparams
					setsoundbussparams $Rage_6_BussSet
					if issoundplaying rage_heart_sfx
						setsoundparams rage_heart_sfx vol = 225 pitch = 125 pan1x = -1 pan1y = 0.5 pan2x = 1 pan2y = 0.5
					endif
					if issoundplaying sk9_ntt_sfx_loop_front
						setsoundparams sk9_ntt_sfx_loop_front vol = 320 pitch = 40
					endif
				endif
				if (<rage_sfx_data> = 7)
					playsound sk8_Nail_Trick_Design_03 vol = 150
					change rage_soundbuss_active = 1
					printpushpopdebuginfo push name = "pushing into rage level 7"
					pushsoundbussparams
					setsoundbussparams $Rage_7_BussSet
					if issoundplaying rage_heart_sfx
						setsoundparams rage_heart_sfx vol = 250 pitch = 130 pan1x = -1 pan1y = 0.4 pan2x = 1 pan2y = 0.4
					endif
					if issoundplaying sk9_ntt_sfx_loop_front
						setsoundparams sk9_ntt_sfx_loop_front vol = 340 pitch = 40
					endif
				endif
				if (<rage_sfx_data> = 8)
					playsound sk8_Nail_Trick_Design_03 vol = 150
					change rage_soundbuss_active = 1
					printpushpopdebuginfo push name = "pushing into rage level 8"
					pushsoundbussparams
					setsoundbussparams $Rage_8_BussSet
					if issoundplaying rage_heart_sfx
						setsoundparams rage_heart_sfx vol = 275 pitch = 135 pan1x = -1 pan1y = 0.3 pan2x = 1 pan2y = 0.3
					endif
					if issoundplaying sk9_ntt_sfx_loop_front
						setsoundparams sk9_ntt_sfx_loop_front vol = 360 pitch = 40
					endif
				endif
				if (<rage_sfx_data> = 9)
					playsound sk8_Nail_Trick_Design_03 vol = 150
					change rage_soundbuss_active = 1
					printpushpopdebuginfo push name = "pushing into rage level 9"
					pushsoundbussparams
					setsoundbussparams $Rage_9_BussSet
					if issoundplaying rage_heart_sfx
						setsoundparams rage_heart_sfx vol = 300 pitch = 140 pan1x = -1 pan1y = 0.2 pan2x = 1 pan2y = 0.2
					endif
					if issoundplaying sk9_ntt_sfx_loop_front
						setsoundparams sk9_ntt_sfx_loop_front vol = 380 pitch = 40
					endif
				endif
				if (<rage_sfx_data> = 10)
					playsound sk8_Nail_Trick_Design_03 vol = 150
					change rage_soundbuss_active = 1
					printpushpopdebuginfo push name = "pushing into rage level 10"
					pushsoundbussparams
					setsoundbussparams $Rage_10_BussSet
					if issoundplaying rage_heart_sfx
						setsoundparams rage_heart_sfx vol = 350 pitch = 145 pan1x = -1 pan1y = 0 pan2x = 1 pan2y = 0
					endif
					if issoundplaying sk9_ntt_sfx_loop_front
						setsoundparams sk9_ntt_sfx_loop_front vol = 400 pitch = 40
					endif
				endif
				if (<rage_sfx_data> = 11)
					playsound sk8_Nail_Trick_Design_03 vol = 160 pitch = 80
				endif
			endif
		endif
	endif
endscript

script stop_rage_sfx 
	playsound SK9_NTG_Whoosh_In vol = 350 pitch = 75
	playsound SK8_Focus_OutOf vol = 150 pitch = 75
	if issoundplaying rage_heart_sfx
		stopsound rage_heart_sfx
	endif
	if (($rage_soundbuss_active) = 1)
		printpushpopdebuginfo pop name = "popping rage sound buss"
		change rage_soundbuss_active = 0
		popsoundbussparams
	endif
	wait 0.3 seconds
	if issoundplaying sk9_ntt_sfx_loop_front
		stopsound sk9_ntt_sfx_loop_front
	endif
endscript

script m_h2_impress_positive_callouts 
	RandomNoRepeat (
		@ obj_playsound m_h2_impress_inc_pos_01 vol = 300 dropoff = 150 dropoff_function = inv_exponential
		@ obj_playsound m_h2_impress_inc_pos_02 vol = 300 dropoff = 150 dropoff_function = inv_exponential
		@ obj_playsound m_h2_impress_inc_pos_03 vol = 300 dropoff = 150 dropoff_function = inv_exponential
		@ obj_playsound m_h2_impress_inc_pos_04 vol = 300 dropoff = 150 dropoff_function = inv_exponential
		@ obj_playsound m_h2_impress_inc_pos_05 vol = 300 dropoff = 150 dropoff_function = inv_exponential
		@ obj_playsound m_h2_impress_inc_pos_06 vol = 300 dropoff = 150 dropoff_function = inv_exponential
		@ obj_playsound m_h2_impress_inc_pos_07 vol = 300 dropoff = 150 dropoff_function = inv_exponential
		@ obj_playsound m_h2_impress_inc_pos_08 vol = 300 dropoff = 150 dropoff_function = inv_exponential
		)
endscript

script m_r3_Bell_Chk3p3_VO 
	playsound \{m_r3_bell_inst_13
		vol = 350}
	wait \{2
		seconds}
	playsound \{m_r3_bell_inst_13a
		vol = 350}
	wait \{2.2
		seconds}
	playsound \{m_r3_bell_inst_13b
		vol = 350}
	wait \{1.5
		seconds}
	playsound \{m_r3_bell_inst_14
		vol = 350}
endscript

script m_r3_Bell_Chk3p4_VO 
	playsound \{m_r3_bell_inst_15
		vol = 350}
	wait \{3.5
		seconds}
	playsound \{m_r3_bell_inst_15a
		vol = 350}
endscript

script m_r3_Bell_lastp3_VO 
	playsound \{m_r3_bell_inst_10
		vol = 350}
	wait \{3
		seconds}
	playsound \{m_r3_bell_inst_10a
		vol = 350}
endscript

script m_r3_bell_VO_local_skater_negative 
	switch <ped_VO_line>
		case 1
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr1_08 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr2_01 vol = 200 dropoff = 60
			)
		case 2
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr1_09 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr2_02 vol = 200 dropoff = 60
			)
		case 3
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr1_10 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr2_03 vol = 200 dropoff = 60
			)
		case 4
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr1_11 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr2_04 vol = 200 dropoff = 60
			)
		case 5
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr1_12 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr2_05 vol = 200 dropoff = 60
			)
		case 6
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr1_13 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr2_06 vol = 200 dropoff = 60
			)
		case 7
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr1_14 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr2_07 vol = 200 dropoff = 60
			)
		case 8
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr1_15 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr2_08 vol = 200 dropoff = 60
			)
		case 9
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr1_16 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr2_09 vol = 200 dropoff = 60
			)
		case 10
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr1_17 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_neg_Sk8tr2_10 vol = 200 dropoff = 60
			)
		case `default`
		printf "no skater callout"
	endswitch
endscript

script m_r3_bell_VO_local_skater_positive 
	switch <ped_VO_line>
		case 1
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr1_01 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr2_01 vol = 200 dropoff = 60
			)
		case 2
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr1_02 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr2_02 vol = 200 dropoff = 60
			)
		case 3
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr1_03 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr2_03 vol = 200 dropoff = 60
			)
		case 4
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr1_04 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr2_04 vol = 200 dropoff = 60
			)
		case 5
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr1_05 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr2_05 vol = 200 dropoff = 60
			)
		case 6
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr1_06 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr2_06 vol = 200 dropoff = 60
			)
		case 7
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr1_07 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr2_07 vol = 200 dropoff = 60
			)
		case 8
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr1_08 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr2_08 vol = 200 dropoff = 60
			)
		case 9
		RandomNoRepeat (
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr1_09 vol = 200 dropoff = 60
			@ obj_playsound m_r3_bell_inc_pos_Sk8tr2_09 vol = 200 dropoff = 60
			)
		case 10
		obj_playsound m_r3_bell_inc_pos_Sk8tr2_10 vol = 200 dropoff = 60
		case `default`
		printf "no skater callout"
	endswitch
endscript

script VO_m_r3_Harbor_WATCHOUT 
	if iscreated \{m_r3_harbor_ped_1}
		m_r3_harbor_ped_1 :obj_playsound \{m_r3_harbor_inc_neg_08
			vol = 350
			dropoff = 300}
	else
		playsound \{m_r3_harbor_inc_neg_08
			vol = 350}
	endif
endscript

script VO_m_r3_Harbor_FAILED 
	playsound \{m_r3_harbor_inc_neg_06
		vol = 350}
endscript

script VO_m_r3_Harbor_NOTINAIR 
	playsound \{m_r3_harbor_inc_neg_02
		vol = 350}
endscript

script VO_m_r3_Harbor_NOTFRAME 
	playsound \{m_r3_harbor_inc_neg_03
		vol = 350}
endscript

script VO_m_r3_Harbor_GRINDING 
	playsound \{m_r3_harbor_inc_neg_01
		vol = 350}
endscript

script VO_m_r3_Harbor_inc_neg 
	RandomNoRepeat (
		@ playsound \{m_r3_harbor_inc_neg_07
			vol = 350}
		@ playsound \{m_r3_harbor_inc_neg_09
			vol = 350}
		)
endscript

script VO_m_r3_harbor_inst_08 
	if iscreated \{m_r3_harbor_ped_1_no_bump}
		if issoundeventplaying \{VO_m_r3_harbor_inst_05}
			stopsoundevent \{VO_m_r3_harbor_inst_05}
		endif
		m_r3_harbor_ped_1_no_bump :obj_playsound \{m_r3_harbor_inst_08
			vol = 350
			dropoff = 300}
	else
		if issoundeventplaying \{VO_m_r3_harbor_inst_05}
			stopsoundevent \{VO_m_r3_harbor_inst_05}
		endif
		playsound \{m_r3_harbor_inst_08
			vol = 350}
	endif
endscript

script vo_m_h2_bossbattle_inc_cam_Beating 
	if NOT issoundeventplaying \{vo_m_h2_bossbattle_inc_cam_GOTHIT}
		if iscreated \{m_h2_bossbattle_ped_boss_1}
			m_h2_bossbattle_ped_boss_1 :obj_playsound \{m_h2_bossbattle_inc_cam_08
				vol = 350
				dropoff = 100}
		endif
	endif
endscript

script vo_m_h2_bossbattle_inc_cam_CantHide 
	if NOT issoundeventplaying \{vo_m_h2_bossbattle_inc_cam_GOTHIT}
		if iscreated \{m_h2_bossbattle_ped_boss_1}
			m_h2_bossbattle_ped_boss_1 :obj_playsound \{m_h2_bossbattle_inc_cam_09
				vol = 350
				dropoff = 100}
		endif
	endif
endscript

script vo_m_h2_bossbattle_inc_cam_OffBoard 
	if NOT issoundeventplaying \{vo_m_h2_bossbattle_inc_cam_GOTHIT}
		if iscreated \{m_h2_bossbattle_ped_boss_1}
			m_h2_bossbattle_ped_boss_1 :obj_playsound \{m_h2_bossbattle_inc_cam_10
				vol = 350
				dropoff = 100}
		endif
	endif
endscript

script vo_m_h2_bossbattle_inc_cam_KickAss 
	if NOT issoundeventplaying \{vo_m_h2_bossbattle_inc_cam_GOTHIT}
		if iscreated \{m_h2_bossbattle_ped_boss_1}
			m_h2_bossbattle_ped_boss_1 :obj_playsound \{m_h2_bossbattle_inc_cam_11
				vol = 350
				dropoff = 100}
		endif
	endif
endscript

script vo_m_h2_bossbattle_inc_cam_Sucker 
	if iscreated \{m_h2_bossbattle_ped_boss_1}
		m_h2_bossbattle_ped_boss_1 :obj_playsound \{m_h2_bossbattle_inc_cam_01
			vol = 350
			dropoff = 100}
	endif
endscript

script vo_m_h2_bossbattle_inc_cam_RUN 
	if iscreated \{m_h2_bossbattle_ped_boss_1}
		m_h2_bossbattle_ped_boss_1 :obj_playsound \{m_h2_bossbattle_inc_cam_04
			vol = 350
			dropoff = 100}
	endif
endscript

script vo_m_h2_bossbattle_inc_cam_ITHOUGHT 
	if iscreated \{m_h2_bossbattle_ped_boss_1}
		m_h2_bossbattle_ped_boss_1 :obj_playsound \{m_h2_bossbattle_inc_cam_03
			vol = 350
			dropoff = 100}
	endif
endscript

script vo_m_h2_bossbattle_inc_cam_CatchMe 
	if iscreated \{m_h2_bossbattle_ped_boss_1}
		m_h2_bossbattle_ped_boss_1 :obj_playsound \{m_h2_bossbattle_inc_cam_02
			vol = 350
			dropoff = 100}
	endif
endscript

script vo_m_h2_bossbattle_inc_cam_GOTHIT 
	if iscreated m_h2_bossbattle_ped_boss_1
		RandomNoRepeat (
			@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_07 vol = 350 dropoff = 100
			@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_07_alt_01 vol = 350 dropoff = 100
			@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_07_alt_02 vol = 350 dropoff = 100
			@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_07_alt_03 vol = 350 dropoff = 100
			@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_07_alt_04 vol = 350 dropoff = 100
			@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_07_alt_05 vol = 350 dropoff = 100
			@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_15 vol = 350 dropoff = 100
			)
	endif
endscript

script vo_m_h2_bossbattle_inc_cam_Block 
	wait 0.5 seconds
	if NOT issoundeventplaying VO_m_h2_BossBattle_Drollin_MightNeed
		if iscreated m_h2_bossbattle_ped_boss_1
			RandomNoRepeat (
				@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_12 vol = 350 dropoff = 100
				@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_13 vol = 350 dropoff = 100
				@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_14 vol = 350 dropoff = 100
				@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_14_alt_01 vol = 350 dropoff = 100
				@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_14_alt_02 vol = 350 dropoff = 100
				@ m_h2_bossbattle_ped_boss_1 :obj_playsound m_h2_bossbattle_inc_cam_14_alt_03 vol = 350 dropoff = 100
				)
		endif
	endif
endscript

script VO_m_h2_BossBattle_Drollin_MightNeed 
	if iscreated m_h2_bossbattle_ped_dustin
		if gotparam whichVO
			if (<whichVO> = 1)
				m_h2_bossbattle_ped_dustin :obj_playsound m_h2_bossbattle_inc_gp_02 vol = 350 dropoff = 1000
			elseif (<whichVO> = 2)
				m_h2_bossbattle_ped_dustin :obj_playsound m_h2_bossbattle_inc_gp_03 vol = 350 dropoff = 1000
			elseif (<whichVO> = 3)
				m_h2_bossbattle_ped_dustin :obj_playsound m_h2_bossbattle_inc_gp_02 vol = 350 dropoff = 1000
			elseif (<whichVO> = 4)
				m_h2_bossbattle_ped_dustin :obj_playsound m_h2_bossbattle_inc_gp_05 vol = 350 dropoff = 1000
			endif
		endif
	endif
endscript

script VO_m_h2_bossbattle_Dollin_LittleHelp 
	if iscreated \{m_h2_bossbattle_ped_dustin}
		m_h2_bossbattle_ped_dustin :obj_playsound \{m_h2_bossbattle_inc_gp_09
			vol = 350
			dropoff = 1000}
	endif
endscript

script VO_m_h2_bossbattle_Dollin_ICANHANDLE 
	if iscreated \{m_h2_bossbattle_ped_dustin}
		m_h2_bossbattle_ped_dustin :obj_playsound \{m_h2_bossbattle_inc_gp_13
			vol = 350
			dropoff = 1000}
	else
		playsound \{m_h2_bossbattle_inc_gp_13
			vol = 350}
	endif
endscript

script VO_m_h2_bossbattle_Dollin_HELP 
	if iscreated \{m_h2_bossbattle_ped_dustin}
		m_h2_bossbattle_ped_dustin :obj_playsound \{m_h2_bossbattle_inc_gp_08
			vol = 350
			dropoff = 1000}
	endif
endscript

script VO_m_h2_bossbattle_Dollin_HEAD 
	if iscreated \{m_h2_bossbattle_ped_dustin}
		m_h2_bossbattle_ped_dustin :obj_playsound \{m_h2_bossbattle_inc_gp_06
			vol = 350
			dropoff = 1000}
	endif
endscript

script VO_m_h2_bossbattle_Dollin_HANDOVERHERE 
	if iscreated \{m_h2_bossbattle_ped_dustin}
		m_h2_bossbattle_ped_dustin :obj_playsound \{m_h2_bossbattle_inc_gp_07
			vol = 350
			dropoff = 1000}
	endif
endscript

script VO_m_h2_bossbattle_Dollin_BEOKAY 
	if iscreated \{m_h2_bossbattle_ped_dustin}
		m_h2_bossbattle_ped_dustin :obj_playsound \{m_h2_bossbattle_inc_gp_11
			vol = 350
			dropoff = 1000}
	else
		playsound \{m_h2_bossbattle_inc_gp_11
			vol = 350}
	endif
endscript

script VO_m_h2_bossbattle_Dollin_AfterCam 
	if iscreated \{m_h2_bossbattle_ped_dustin}
		m_h2_bossbattle_ped_dustin :obj_playsound \{m_h2_bossbattle_inc_gp_12
			vol = 350
			dropoff = 1000}
	else
		playsound \{m_h2_bossbattle_inc_gp_12
			vol = 350}
	endif
endscript

script SFX_bumharass01_push 
	RandomNoRepeat (
		@ obj_playsound \{SK9_shoulder_check_clth1
			dropoff = 20
			dropoff_function = linear}
		@ obj_playsound \{SK9_shoulder_check_clth4
			dropoff = 20
			dropoff_function = linear}
		)
endscript

script SFX_bumharass01_kick1 
	RandomNoRepeat (
		@ obj_playsound SK9_shoulder_check_bass1 dropoff = 20 dropoff_function = linear
		@ obj_playsound SK9_shoulder_check_bass2 dropoff = 20 dropoff_function = linear
		@ obj_playsound SK9_shoulder_check_bass3 dropoff = 20 dropoff_function = linear
		)
	RandomNoRepeat (
		@ obj_playsound SK9_shoulder_check_clth1 dropoff = 20 dropoff_function = linear
		@ obj_playsound SK9_shoulder_check_clth4 dropoff = 20 dropoff_function = linear
		)
	RandomNoRepeat (
		@ obj_playsound SK9_shoulder_check_clth2 dropoff = 20 dropoff_function = linear
		@ obj_playsound SK9_shoulder_check_clth3 dropoff = 20 dropoff_function = linear
		)
endscript

script SFX_bumharass01_kick2 
	RandomNoRepeat (
		@ obj_playsound \{SK9_shoulder_check_bass1
			dropoff = 20
			dropoff_function = linear}
		@ obj_playsound \{SK9_shoulder_check_bass2
			dropoff = 20
			dropoff_function = linear}
		@ obj_playsound \{SK9_shoulder_check_bass3
			dropoff = 20
			dropoff_function = linear}
		)
	RandomNoRepeat (
		@ obj_playsound \{SK9_shoulder_check_clth1
			dropoff = 20
			dropoff_function = linear}
		@ obj_playsound \{SK9_shoulder_check_clth4
			dropoff = 20
			dropoff_function = linear}
		)
endscript

script VO_m_c2_localcomp_Annouc_INCOMBO_AM 
	soundevent event = medal_am_sfx
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
										RandomNoRepeat (
											@ playsound announcer_combo_pending_1a vol = 400
											@ playsound announcer_combo_pending_1b vol = 400
											@ playsound announcer_combo_pending_1c vol = 400
											@ playsound announcer_combo_pending_2a vol = 400
											@ playsound announcer_combo_pending_2b vol = 400
											@ playsound announcer_combo_pending_2c vol = 400
											@ playsound announcer_combo_pending_3a vol = 400
											@ playsound announcer_combo_pending_3b vol = 400
											@ playsound announcer_combo_pending_3c vol = 400
											@ playsound announcer_keepitup_01 vol = 400
											@ playsound announcer_keepitup_02 vol = 400
											@ playsound announcer_keepitup_03 vol = 400
											@ playsound announcer_keepitup_04 vol = 400
											@ playsound announcer_keepitup_06 vol = 400
											@ playsound announcer_keepitup_07 vol = 400
											@ playsound announcer_keepitup_08 vol = 400
											@ playsound announcer_keepitup_09 vol = 400
											@ playsound announcer_keepitup_10 vol = 400
											@ playsound announcer_keepitup_11 vol = 400
											@ playsound announcer_keepitup_12 vol = 400
											@ playsound announcer_keepitup_13 vol = 400
											@ playsound announcer_keepitup_14 vol = 400
											@ playsound announcer_keepitup_15 vol = 400
											@ playsound announcer_keepitup_16 vol = 400
											@ playsound announcer_keepitup_17 vol = 400
											@ playsound announcer_keepitup_18 vol = 400
											@ playsound announcer_keepitup_20 vol = 400
											)
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Annouc_INCOMBO_PRO 
	soundevent event = medal_pro_sfx
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
										RandomNoRepeat (
											@ playsound announcer_combo_pending_1a vol = 400
											@ playsound announcer_combo_pending_1b vol = 400
											@ playsound announcer_combo_pending_1c vol = 400
											@ playsound announcer_combo_pending_2a vol = 400
											@ playsound announcer_combo_pending_2b vol = 400
											@ playsound announcer_combo_pending_2c vol = 400
											@ playsound announcer_combo_pending_3a vol = 400
											@ playsound announcer_combo_pending_3b vol = 400
											@ playsound announcer_combo_pending_3c vol = 400
											@ playsound announcer_keepitup_01 vol = 400
											@ playsound announcer_keepitup_02 vol = 400
											@ playsound announcer_keepitup_03 vol = 400
											@ playsound announcer_keepitup_04 vol = 400
											@ playsound announcer_keepitup_06 vol = 400
											@ playsound announcer_keepitup_07 vol = 400
											@ playsound announcer_keepitup_08 vol = 400
											@ playsound announcer_keepitup_09 vol = 400
											@ playsound announcer_keepitup_10 vol = 400
											@ playsound announcer_keepitup_11 vol = 400
											@ playsound announcer_keepitup_12 vol = 400
											@ playsound announcer_keepitup_13 vol = 400
											@ playsound announcer_keepitup_14 vol = 400
											@ playsound announcer_keepitup_15 vol = 400
											@ playsound announcer_keepitup_16 vol = 400
											@ playsound announcer_keepitup_17 vol = 400
											@ playsound announcer_keepitup_18 vol = 400
											@ playsound announcer_keepitup_20 vol = 400
											)
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2 
	soundevent event = medal_sick_sfx
	if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_PRO
		if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_AM
			if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO
				if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_SloppyLanding
					if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_CleanLanding
						if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2
							if NOT issoundeventplaying VO_m_c2_localcomp_Announc_PROLAND
								if NOT issoundeventplaying VO_m_c2_localcomp_Annouc_AMLAND
									if NOT issoundeventplaying VO_m_c2_localcomp_Announc_SICKLAND
										RandomNoRepeat (
											@ playsound announcer_combo_pending_1a vol = 400
											@ playsound announcer_combo_pending_1b vol = 400
											@ playsound announcer_combo_pending_1c vol = 400
											@ playsound announcer_combo_pending_2a vol = 400
											@ playsound announcer_combo_pending_2b vol = 400
											@ playsound announcer_combo_pending_2c vol = 400
											@ playsound announcer_combo_pending_3a vol = 400
											@ playsound announcer_combo_pending_3b vol = 400
											@ playsound announcer_combo_pending_3c vol = 400
											@ playsound announcer_keepitup_01 vol = 400
											@ playsound announcer_keepitup_02 vol = 400
											@ playsound announcer_keepitup_03 vol = 400
											@ playsound announcer_keepitup_04 vol = 400
											@ playsound announcer_keepitup_06 vol = 400
											@ playsound announcer_keepitup_07 vol = 400
											@ playsound announcer_keepitup_08 vol = 400
											@ playsound announcer_keepitup_09 vol = 400
											@ playsound announcer_keepitup_10 vol = 400
											@ playsound announcer_keepitup_11 vol = 400
											@ playsound announcer_keepitup_12 vol = 400
											@ playsound announcer_keepitup_13 vol = 400
											@ playsound announcer_keepitup_14 vol = 400
											@ playsound announcer_keepitup_15 vol = 400
											@ playsound announcer_keepitup_16 vol = 400
											@ playsound announcer_keepitup_17 vol = 400
											@ playsound announcer_keepitup_18 vol = 400
											@ playsound announcer_keepitup_20 vol = 400
											)
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_comppark_inst_1_05 
	playsound \{m_c2_comppark_inst_1_05
		vol = 350}
	wait \{2
		seconds}
	soundevent \{event = VO_m_c2_localcomp_Announc_Start_Park}
endscript

script sk9_goal_comppark_crowd_surges_Lands 
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_SMALL}
	if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO_PRO}
		if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO_AM}
			if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO}
				if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_SloppyLanding}
					if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_CleanLanding}
						if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2}
							if NOT issoundeventplaying \{VO_m_c2_localcomp_Announc_PROLAND}
								if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_AMLAND}
									if NOT issoundeventplaying \{VO_m_c2_localcomp_Announc_SICKLAND}
										soundevent \{event = VO_m_c2_localcomp_Annouc_AMLAND}
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script sk9_goal_comppark_crowd_surges_Lands_2 
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_MEDIUM}
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_SMALL}
	if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO_PRO}
		if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO_AM}
			if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO}
				if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_SloppyLanding}
					if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_CleanLanding}
						if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2}
							if NOT issoundeventplaying \{VO_m_c2_localcomp_Announc_PROLAND}
								if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_AMLAND}
									if NOT issoundeventplaying \{VO_m_c2_localcomp_Announc_SICKLAND}
										soundevent \{event = VO_m_c2_localcomp_Announc_PROLAND}
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script sk9_goal_comppark_crowd_surges_Lands_3 
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_BIG}
	soundevent \{event = Crowd_Ped_AI_Comp_CheerLand_SMALL}
	if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO_PRO}
		if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO_AM}
			if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO}
				if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_SloppyLanding}
					if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_CleanLanding}
						if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_INCOMBO_SICK_2}
							if NOT issoundeventplaying \{VO_m_c2_localcomp_Announc_PROLAND}
								if NOT issoundeventplaying \{VO_m_c2_localcomp_Annouc_AMLAND}
									if NOT issoundeventplaying \{VO_m_c2_localcomp_Announc_SICKLAND}
										soundevent \{event = VO_m_c2_localcomp_Announc_SICKLAND}
									endif
								endif
							endif
						endif
					endif
				endif
			endif
		endif
	endif
endscript

script VO_m_c2_NTG_inc_GoodFingerflip 
	wait \{0.1
		seconds}
	playsound \{m_c2_NTG_inc_pos_03
		vol = 350}
endscript

script VO_m_c2_comppark_inst_1_03 
	playsound m_c2_comppark_inst_1_03 vol = 350
	wait 1.7 seconds
	RandomNoRepeat (
		@ playsound sk8_handclap_01 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_02 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_03 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_04 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_05 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_06 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_07 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_08 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		)
	wait 0.2 seconds
	playsound Cheer_Small_04 vol = 200
	RandomNoRepeat (
		@ playsound sk8_handclap_01 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_02 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_03 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_04 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_05 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_06 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_07 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_08 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		)
	wait 0.1 seconds
	RandomNoRepeat (
		@ playsound sk8_handclap_01 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_02 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_03 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_04 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_05 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_06 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_07 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_08 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		)
	wait 0.3 seconds
	RandomNoRepeat (
		@ playsound sk8_handclap_01 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_02 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_03 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_04 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_05 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_06 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_07 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_08 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		)
	wait 0.4 secons
	RandomNoRepeat (
		@ playsound sk8_handclap_01 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_02 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_03 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_04 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_05 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_06 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_07 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_08 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		)
	wait 0.5 seconds
	RandomNoRepeat (
		@ playsound sk8_handclap_01 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_02 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_03 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_04 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_05 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_06 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_07 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_08 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		)
	wait 0.2 seconds
	RandomNoRepeat (
		@ playsound sk8_handclap_01 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_02 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_03 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_04 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_05 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_06 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_07 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		@ playsound sk8_handclap_08 vol = 70 randompitch = {type = randomrangetype vals = [75 , 90]}
		)
endscript

script VO_m_h1_bigpush_inst_07 
	playsound \{m_h1_bigpush_inst_07
		vol = 350}
endscript

script m_h1_bigspines_Positives 
	wait \{0.4
		seconds}
	RandomNoRepeat (
		@ playsound \{m_h1_bigspines_inc_pos_01
			vol = 350}
		@ playsound \{m_h1_bigspines_inc_pos_02
			vol = 350}
		@ playsound \{m_h1_bigpush_inc_pos_02
			vol = 350}
		@ playsound \{m_h1_bigpush_inc_pos_01
			vol = 350}
		@ playsound \{m_h1_boostpull_inc_pos_01
			vol = 350}
		)
endscript

script VO_m_h1_bigpush_inst_01 
	playsound \{m_h1_bigpush_inst_01
		vol = 350}
endscript

script VO_m_h1_bigpush_inst_02 
	playsound \{m_h1_bigpush_inst_02
		vol = 350}
endscript

script VO_m_h1_bigpush_inst_03 
	playsound \{m_h1_bigpush_inst_03
		vol = 350}
endscript

script VO_m_h1_bigpush_inst_03b 
	playsound \{m_h1_bigpush_inst_03b
		vol = 350}
endscript

script m_r1_demo_ped_Crowds_SFX_01 
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 150
		pitch = 100
		emitter = m_r1_demo_M_R1_DEMO_SFX_Crowd_01
		dropoff = 50
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_r1_demo_ped_Crowds_SFX_02 
	obj_playsound \{Crowd_Cheer_Loop_02
		vol = 150
		pitch = 100
		emitter = m_r1_demo_M_R1_DEMO_SFX_Crowd_02
		dropoff = 50
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_r1_demo_ped_Crowds_SFX_03 
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 150
		pitch = 100
		emitter = m_r1_demo_M_R1_DEMO_SFX_Crowd_03
		dropoff = 50
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_r1_showdown_SFX_Crowd_01 
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 150
		pitch = 100
		emitter = m_r1_showdown_SFX_Crowd_01
		dropoff = 50
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_h3_bowlcomp_crowd_sfx 
	obj_playsound \{Crowd_Cheer_Loop_02
		vol = 150
		pitch = 100
		emitter = m_h3_bowlcomp_SFX_Emitter_Crowd_SFX
		dropoff = 50
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_cu_crowd_SFX_01 
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 150
		pitch = 100
		emitter = m_cu_SFX_Emitter_Crowd_SFX_01
		dropoff = 50
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_cu_crowd_SFX_02 
	obj_playsound \{Crowd_Cheer_Loop_02
		vol = 150
		pitch = 100
		emitter = m_cu_SFX_Emitter_Crowd_SFX_02
		dropoff = 50
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c2_compstreet_crowd_sfx_01 
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 150
		pitch = 100
		emitter = m_c2_compstreet_SFX_Emitter_Crowd_SFX_01
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c2_compstreet_crowd_sfx_02 
	obj_playsound \{Crowd_Cheer_Loop_02
		vol = 150
		pitch = 100
		emitter = m_c2_compstreet_SFX_Emitter_Crowd_SFX_02
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c2_compstreet_crowd_sfx_03 
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 150
		pitch = 100
		emitter = m_c2_compstreet_SFX_Emitter_Crowd_SFX_03
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c2_comppark_Crowd_Sfx_01 
	obj_playsound \{Crowd_Cheer_Loop_02
		vol = 150
		pitch = 100
		emitter = m_c2_comppark_SFX_Emitter_crowd_sfx_01
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c2_comppark_Crowd_Sfx_02 
	obj_playsound \{Crowd_Cheer_Loop_02
		vol = 150
		pitch = 100
		emitter = m_c2_comppark_SFX_Emitter_crowd_sfx_02
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c2_comppark_Crowd_Sfx_03 
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 150
		pitch = 100
		emitter = m_c2_comppark_SFX_Emitter_crowd_sfx_03
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c1_demo_Crowd_Sfx_01 
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 250
		pitch = 100
		emitter = m_c1_demo_SFX_Emitter_Crowd_SFX_01
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
	obj_playsound \{Crowd_Cheer_Loop_02
		vol = 250
		pitch = 100
		emitter = m_c1_demo_SFX_Emitter_Crowd_SFX_01
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c1_demo_Crowd_Sfx_02 
	obj_playsound \{Crowd_Cheer_Loop_02
		vol = 250
		pitch = 100
		emitter = m_c1_demo_SFX_Emitter_Crowd_SFX_02
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 250
		pitch = 100
		emitter = m_c1_demo_SFX_Emitter_Crowd_SFX_02
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c1_demo_Crowd_Sfx_03 
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 250
		pitch = 100
		emitter = m_c1_demo_SFX_Emitter_Crowd_SFX_03
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
	obj_playsound \{Crowd_Cheer_Loop_02
		vol = 250
		pitch = 100
		emitter = m_c1_demo_SFX_Emitter_Crowd_SFX_03
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c2_compvert_Crowd_Sfx_01 
	obj_playsound \{Crowd_Cheer_Loop_01
		vol = 150
		pitch = 100
		emitter = m_c2_compvert_SFX_Emitter_Crowd_SFX_01
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script m_c2_compvert_Crowd_Sfx_02 
	obj_playsound \{Crowd_Cheer_Loop_02
		vol = 150
		pitch = 100
		emitter = m_c2_compvert_SFX_Emitter_Crowd_SFX_02
		dropoff = 30
		dropoff_function = inv_exponential
		num_loops = -1}
endscript

script VO_m_h2_boneless_inc_pos 
	gman_timerfunc goal = m_h2_boneless tool = timer func = get_time
	gman_flagfunc goal = m_h2_boneless tool = flags func = get_num_set
	wait 0.5 seconds
	if iscreated Pro_Dollin
		Pro_Dollin :obj_playsound m_h2_boneless_inc_pos_01 vol = 350 dropoff = 50
	else
		playsound m_h2_boneless_inc_pos_01 vol = 350
	endif
	if gman_flagfunc {
			goal = m_h2_boneless
			checkpoint = chk1
			tool = flags
			func = is_set
			params = {flag = flag_limo}
		}
		if gman_flagfunc {
				goal = m_h2_boneless
				checkpoint = chk1
				tool = flags
				func = is_set
				params = {flag = flag_score}
			}
			soundevent event = medal_sick_sfx
		else
			soundevent event = medal_pro_sfx
		endif
	else
		soundevent event = medal_am_sfx
	endif
endscript

script Timer_Progression_Sound_WallRides 
	gman_timerfunc \{goal = m_h3_wallrides
		tool = wallride_timer
		func = get_time}
	printstruct <...>
	if (<time> < 61)
		sk9_Focus_Timer_2
	endif
endscript

script VO_m_h1_skitchboost_pos 
	if iscreated m_h1_gped_01
		RandomNoRepeat (
			@ m_h1_gped_01 :obj_playsound m_h1_skitchboost_inc_pos_01 vol = 150 dropoff = 1000
			@ m_h1_gped_01 :obj_playsound m_h1_skitchboost_inc_pos_02 vol = 150 dropoff = 1000
			@ m_h1_gped_01 :obj_playsound vallely_cheerland_07 vol = 150 dropoff = 1000
			@ m_h1_gped_01 :obj_playsound vallely_cheerland_05 vol = 150 dropoff = 1000
			@ m_h1_gped_01 :obj_playsound vallely_cheerland_04 vol = 150 dropoff = 1000
			@ m_h1_gped_01 :obj_playsound vallely_cheerland_02 vol = 150 dropoff = 1000
			)
	endif
endscript

script VO_m_h1_skitchboost_neg 
	if iscreated \{m_h1_gped_01}
		m_h1_gped_01 :obj_playsound \{m_h1_skitchboost_inc_neg_01
			vol = 150
			dropoff = 1000}
	endif
endscript

script WoodBreak_Slums_Large 
	RandomNoRepeat (
		@ playsound \{sk8_WoodBreak_03
			vol = 150}
		playsound \{SK8_WoodBreak_Explode_01
			vol = 150}
		playsound \{SK8_WoodBreak_Explode_03
			vol = 250}
		@ playsound \{SK8_WoodBreak_Explode_02
			vol = 400}
		@ playsound \{SK8_WoodBreak_Explode_01
			vol = 400}
		@ playsound \{SK8_WoodBreak_Explode_03
			vol = 400}
		)
endscript

script Break_Wood_Med_slums_SFX 
	RandomNoRepeat (
		@ Z_slums_SFX_SFX_TWOBYFOUR_01 :obj_playsound \{Fence_Break_01
			vol = 140
			dropoff = 30}
		@ Z_slums_SFX_SFX_TWOBYFOUR_01 :obj_playsound \{Fence_Break_02
			vol = 140
			dropoff = 30}
		@ Z_slums_SFX_SFX_TWOBYFOUR_01 :obj_playsound \{Fence_Break_03
			vol = 140
			dropoff = 30}
		)
endscript

script reward_screen_sfx 
	playsound \{SK8_Skater_Eye_Transition
		vol = 130}
	wait \{0.2
		seconds}
	playsound \{sk9_New_Show_Goal
		vol = 130}
	wait \{0.2
		seconds}
	playsound \{sk9_special_trick
		vol = 130}
endscript

script Evaluating_m_cu_During_Combo 
	gman_getdata goal = m_cu
	gman_flagfunc goal = m_cu tool = flags checkpoint = checkpoint2 func = get_num_set
	if ((<cp2_current_points> + <num_flags_set>) = 10)
		soundevent event = midgoal_rank_sfx
		soundevent event = VO_m_c_uber_inc_pos_chpt5_01
	elseif ((<cp2_current_points> + <num_flags_set>) = 20)
		soundevent event = midgoal_rank_sfx
		soundevent event = VO_m_c_uber_inc_pos_chpt5_01
	elseif ((<cp2_current_points> + <num_flags_set>) = 50)
		soundevent event = midgoal_rank_sfx
		soundevent event = VO_m_c_uber_inc_pos_chpt5_01
	else
		soundevent event = Sk9_Temp_Goal_Chkpt_SFX
		soundevent event = VO_m_c_uber_inc_pos_chpt5_01
	endif
endscript

script sk9_pyro 
	wait \{0.25
		seconds}
	if iscreated \{m_cu_SFX_SFX_Pyro_02}
		m_cu_SFX_SFX_Pyro_02 :obj_playsound \{sk9_pyro
			vol = 400
			dropoff = 50}
	endif
endscript

script sk9_pyro_c3 
	wait \{0.15
		seconds}
	if iscreated \{m_cu_SFX_SFX_Pyro_01}
		m_cu_SFX_SFX_Pyro_01 :obj_playsound sk9_pyro vol = RandomRange (300.0, 400.0) pitch = RandomRange (70.0, 150.0) dropoff = 50
		wait \{0.05}
		m_cu_SFX_SFX_Pyro_02 :obj_playsound sk9_pyro vol = RandomRange (300.0, 400.0) pitch = RandomRange (80.0, 150.0) dropoff = 50
		wait \{0.1}
		m_cu_SFX_SFX_Pyro_03 :obj_playsound sk9_pyro vol = RandomRange (300.0, 400.0) pitch = RandomRange (80.0, 150.0) dropoff = 50
	endif
endscript

script sk9_Pyro_Pause 
	stars
	stars
	pushsoundbussparams
	pausesoundsbybuss \{MissionSFX}
	soundevent \{event = WindLoop_SFX_Skater_cu}
endscript

script sk9_Pyro_Unpause 
	soundevent \{event = WindLoop_SFX_Skater_Speed_FadeOut}
	stopsoundevent \{WindLoop_SFX_Skater_cu}
	unpausesoundsbybuss \{MissionSFX}
	popsoundbussparams
endscript

script sk9_Pyro_02 
	wait \{0.18
		seconds}
	if iscreated \{m_cu_SFX_SFX_Pyro_01}
		m_cu_SFX_SFX_Pyro_04 :obj_playsound sk9_Pyro_02 vol = RandomRange (300.0, 400.0) pitch = RandomRange (120.0, 150.0) dropoff = 50
		wait \{0.05
			seconds}
		m_cu_SFX_SFX_Pyro_05 :obj_playsound sk9_Pyro_02 vol = RandomRange (300.0, 400.0) pitch = RandomRange (80.0, 150.0) dropoff = 50
		wait \{0.08
			seconds}
		m_cu_SFX_SFX_Pyro_06 :obj_playsound sk9_Pyro_02 vol = RandomRange (300.0, 400.0) pitch = RandomRange (70.0, 150.0) dropoff = 50
	endif
endscript

script VO_m_c_uber_inc_chpt1_01 
	if iscreated \{m_cu_trg_ped_proSkater01}
		m_cu_trg_ped_proSkater01 :obj_playsound \{m_c_uber_inc_chpt1_01
			vol = 150
			dropoff = 70}
	endif
endscript

script VO_m_c_uber_inc_chpt1_02 
	if iscreated \{m_cu_trg_ped_proSkater01}
		m_cu_trg_ped_proSkater01 :obj_playsound \{m_c_uber_inc_chpt1_02
			vol = 150
			dropoff = 70}
	endif
endscript

script VO_m_c_uber_inc_pos_chpt5_01 
	RandomNoRepeat (
		@ playsound m_c_uber_inc_pos_chpt5_01 vol = 200
		@ playsound m_c_uber_inc_pos_chpt5_02 vol = 200
		@ playsound m_c_uber_inc_pos_chpt5_03 vol = 200
		@ playsound m_c_uber_inc_pos_chpt5_04 vol = 200
		@ playsound hawk_cheerland_01 vol = 200
		@ playsound hawk_cheerland_02 vol = 200
		@ playsound hawk_cheerland_03 vol = 200
		@ playsound hawk_cheerland_04 vol = 200
		@ playsound hawk_cheerland_05 vol = 200
		@ playsound hawk_cheerland_06 vol = 200
		@ playsound hawk_cheerland_07 vol = 200
		@ playsound hawk_cheerland_08 vol = 200
		@ playsound hawk_cheerland_09 vol = 200
		@ playsound hawk_cheerland_10 vol = 200
		)
endscript

script sk9_Ring_Fire_Loop 
	gman_getcurrentcheckpoint \{goal = m_cu}
	if (<current_checkpoint> = checkpoint5)
		if gotparam \{Emitter2use}
			obj_playsound sk9_Ring_Fire_Loop vol = 400 pitch = RandomRange (90.0, 110.0) num_loops = -1 emitter = <Emitter2use> dropoff = 200 dropoff_function = standard
		endif
	endif
endscript

script sk9_Pyro_Stream 
	wait 0.25 seconds
	if iscreated m_cu_SFX_SFX_Pyro_02
		playsound sk9_Pyro_Stream vol = 400 dropoff = 50
	endif
	if (($ntt_soundbuss_active) = 0)
		printpushpopdebuginfo push name = "nail_the_trick_into_sfx"
		change ntt_soundbuss_active = 1
		pushsoundbussparams
		if ($global_user_sfx_number = 0)
			setsoundbussparams $default_bussset time = 0.5
		else
			setsoundbussparams $Nail_The_Trick_Mode_BussSet time = 0.5
		endif
	endif
	wait 1.3 seconds
	if ($ntt_soundbuss_active = 1)
		printpushpopdebuginfo pop name = "nail_the_trick_out_of_sfx"
		change ntt_soundbuss_active = 0
		popsoundbussparams
		soundevent event = Go_Outof_Slo_Mo_sfx
		if issoundeventplaying NTM_scrape_SFX
			stopsoundevent NTM_scrape_SFX
		endif
	endif
endscript

script sk9_BCity_Door 
	if iscreated \{z_bcity_SFX_SFX_Upper_Door}
		z_bcity_SFX_SFX_Upper_Door :obj_playsound \{sk9_Slums_Door
			vol = 400
			dropoff = 40
			dropoff_function = linear}
	endif
endscript

script sk9_SkateBoard_Flame 
	wait \{0.2
		seconds}
	playsound \{Skateboard_Flame
		vol = 50}
	wait \{0.1
		seconds}
	setsoundparams \{Skateboard_Flame
		vol = 100}
	wait \{0.1
		seconds}
	setsoundparams \{Skateboard_Flame
		vol = 150}
	soundevent \{event = VO_m_c_uber_inc_pos_chpt5_01}
endscript

script sk9_SkateBoard_Flame_02 
	wait \{0.2
		seconds}
	playsound \{Skateboard_Flame_02
		vol = 50}
	wait \{0.1
		seconds}
	setsoundparams \{Skateboard_Flame_02
		vol = 100}
	wait \{0.1
		seconds}
	setsoundparams \{Skateboard_Flame_02
		vol = 150}
	soundevent \{event = VO_m_c_uber_inc_pos_chpt5_01}
endscript

script sk9_Engine_Explosion 
	if issoundeventplaying \{sk9_SkateBoard_Flame}
		setsoundparams \{Skateboard_Flame
			vol = 100}
		if issoundeventplaying \{sk9_Explosion}
			stopsoundevent \{sk9_Explosion}
		endif
		playsound \{Engine_Explosion
			vol = 400
			pan1x = -0.5
			pan1y = 0.87
			pan2x = 0.5
			pan2y = 0.87}
		wait \{0.5
			seconds}
		setsoundparams \{Skateboard_Flame
			vol = 0}
	else
		playsound \{Engine_Explosion
			vol = 400
			pan1x = -0.5
			pan1y = 0.87
			pan2x = 0.5
			pan2y = 0.87}
	endif
endscript

script sk9_Explosion 
	if issoundeventplaying \{sk9_SkateBoard_Flame_02}
		setsoundparams \{Skateboard_Flame_02
			vol = 100}
		if issoundeventplaying \{sk9_Engine_Explosion}
			stopsoundevent \{sk9_Engine_Explosion}
		endif
		playsound \{sk9_Explosion
			vol = 400
			pan1x = -0.5
			pan1y = 0.87
			pan2x = 0.5
			pan2y = 0.87}
		wait \{0.5
			seconds}
		setsoundparams \{Skateboard_Flame_02
			vol = 0}
	else
		playsound \{sk9_Explosion
			vol = 400
			pan1x = -0.5
			pan1y = 0.87
			pan2x = 0.5
			pan2y = 0.87}
	endif
endscript

script sk9_m_ru_CARRIG 
	playsound sk9_m_ru_CARRIG vol = RandomRange (250.0, 310.0) pitch = RandomRange (80.0, 120.0)
endscript

script sk9_m_ru_PROPANERIG 
	playsound sk9_m_ru_PROPANERIG vol = RandomRange (350.0, 400.0)
endscript

script sk9_m_ru_PIPESRIG 
	playsound sk9_m_ru_PIPESRIG vol = RandomRange (140.0, 160.0) pitch = RandomRange (95.0, 100.0)
endscript

script sk9_Film_Clapper 
	playsound \{sk9_Film_Clapper
		vol = 400
		pitch = 90}
endscript

script Stop_m_ru_SFX_Check 
	if issoundeventplaying \{sk9_Explosion}
		pushsoundbussparams
		setsoundbussparams \{MissionSFX = {
				vol = -100
			}
			time = 0.5}
		pausesoundsbybuss \{GoalVO_DRY}
		wait \{0.1
			seconds}
		UnPause_m_ru_SFX
	elseif issoundeventplaying \{sk9_Engine_Explosion}
		pushsoundbussparams
		setsoundbussparams \{MissionSFX = {
				vol = -100
			}
			time = 0.5}
		pausesoundsbybuss \{GoalVO_DRY}
		wait \{0.1
			seconds}
		UnPause_m_ru_SFX
	endif
endscript

script UnPause_m_ru_SFX 
	setsoundbussparams \{MissionSFX = {
			vol = -100
		}
		time = 0.3}
	unpausesoundsbybuss \{GoalVO_DRY}
	popsoundbussparams
endscript

script VO_CellPhoneTalk 
	getsingletag profile
	switch (<profile>.sex)
		case female
		RandomNoRepeat (
			@ agent_playvo VO_cellphonetalk_c vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			@ agent_playvo VO_cellphonetalk_a vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			)
		case male
		RandomNoRepeat (
			@ agent_playvo VO_cellphonetalk_b vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			@ agent_playvo VO_cellphonetalk_d vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			)
	endswitch
endscript

script VO_caraccident 
	getsingletag profile
	switch (<profile>.sex)
		case female
		RandomNoRepeat (
			@ agent_playvo VO_caraccident_b vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			@ agent_playvo VO_caraccident_d vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			)
		case male
		RandomNoRepeat (
			@ agent_playvo VO_caraccident_a vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			@ agent_playvo VO_caraccident_c vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			)
	endswitch
endscript

script VO_CellPhoneTalk02 
	getsingletag profile
	switch (<profile>.sex)
		case female
		RandomNoRepeat (
			@ agent_playvo VO_celltalk02_c vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			@ agent_playvo VO_celltalk02_d vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			)
		case male
		RandomNoRepeat (
			@ agent_playvo VO_celltalk02_a vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			@ agent_playvo VO_celltalk02_b vol = 25 dropoff = 15 dropoff_function = standard stream_priority = 50 logic_priority = 50 animate_mouth = false can_use_stream = true no_pitch_mod = false use_pos_info = true
			)
	endswitch
endscript

script sk9_WPBridge_Glass_Break 
	if gotparam Glass_Name
		stars
		stars
		printstruct <...>
		if (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_14)
			z_wp_bridge_SFX_SFX_Glass_Break_03 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_01)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_05 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_05 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_08)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_06 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_06 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_09)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_05 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_05 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_03)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_06 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_06 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_13)
			z_wp_bridge_SFX_SFX_Glass_Break_04 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_11)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_01 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_01 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_05)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_02 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_02 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_10)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_05 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_05 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_12)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_01 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_01 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_02)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_02 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_02 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_06)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_01 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_01 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_04)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_02 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_02 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_trgp_glass_tunnel_07)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Glass_Break_06 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Glass_Break_06 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_G_RE_shatterwindow_01)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Entrance_GlassBreak_01 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Entrance_GlassBreak_01 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_G_RE_shatterwindow_02)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Entrance_GlassBreak_02 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Entrance_GlassBreak_02 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_WP_Bridge_G_RE_shatterwindow_03)
			RandomNoRepeat (
				@ z_wp_bridge_SFX_SFX_Entrance_GlassBreak_03 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_wp_bridge_SFX_SFX_Entrance_GlassBreak_03 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_Monuments_g_art_museum_back_window_01)
			RandomNoRepeat (
				@ z_monuments_SFX_SFX_artGlass_01 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_monuments_SFX_SFX_artGlass_01 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		elseif (<Glass_Name> = Z_Monuments_g_art_museum_back_window)
			RandomNoRepeat (
				@ z_monuments_SFX_SFX_artGlass_02 :obj_playsound sk8_large_glass_break_01 vol = 400 dropoff = 50
				@ z_monuments_SFX_SFX_artGlass_02 :obj_playsound sk8_large_glass_break_02 vol = 400 dropoff = 50
				)
		endif
	endif
endscript

script sk9_House_Sliding_Door_Open_inside 
	if iscreated \{z_crib_SFX_SFX_House_Door02}
		obj_playsound \{sk9_House_Slide_Open
			vol = 200
			emitter = z_crib_SFX_SFX_House_Door02
			dropoff = 30
			dropoff_function = inv_exponential}
	endif
endscript

script sk9_House_Sliding_Door_Close_inside 
	if iscreated \{z_crib_SFX_SFX_House_Door02}
		obj_playsound \{sk9_House_Slide_Close
			vol = 80
			emitter = z_crib_SFX_SFX_House_Door02
			dropoff = 10
			dropoff_function = inv_exponential}
	endif
endscript

script VO_m_r1_buildqp_neg_Random 
	RandomNoRepeat (
		@ soundevent \{event = VO_m_r1_buildqp_neg}
		@ 
		@ 
		)
endscript

script VO_m_r1_buildqp_pos_Random 
	RandomNoRepeat (
		@ soundevent \{event = VO_m_r1_buildqp_pos}
		@ 
		@ 
		)
endscript

script VO_m_r1_buildqp_inst_01 
	playsound \{m_r1_buildqp_inst_01
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_02 
	playsound \{m_r1_buildqp_inst_02
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_03 
	playsound \{m_r1_buildqp_inst_03
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_04 
	playsound \{m_r1_buildqp_inst_04
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_05 
	playsound \{m_r1_buildqp_inst_05
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_06 
	playsound \{m_r1_buildqp_inst_06
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_07 
	playsound \{m_r1_buildqp_inst_07
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_08 
	playsound \{m_r1_buildqp_inst_08
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_09 
	playsound \{m_r1_buildqp_inst_09
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_10 
	playsound \{m_r1_buildqp_inst_10
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_11 
	playsound \{m_r1_buildqp_inst_11
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_12 
	playsound \{m_r1_buildqp_inst_12
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_13 
	playsound \{m_r1_buildqp_inst_13
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_14 
	playsound \{m_r1_buildqp_inst_14
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_15 
	playsound \{m_r1_buildqp_inst_15
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_16 
	playsound \{m_r1_buildqp_inst_16
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_17 
	playsound \{m_r1_buildqp_inst_17
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_18 
	playsound \{m_r1_buildqp_inst_18
		vol = 350}
endscript

script VO_m_r1_buildqp_inst_19 
	playsound \{m_r1_buildqp_inst_19
		vol = 350}
endscript

script VO_m_r1_buildqp_neg 
	RandomNoRepeat (
		@ m_r1_buildqp_ped_01 :obj_playsound m_r1_buildqp_inc_neg_03 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound m_r1_buildqp_inc_neg_02 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_booland_02 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_booland_03 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_booland_05 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_booland_06 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_booland_07 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_booland_08 vol = 350 dropoff = 2000
		)
endscript

script VO_m_r1_buildqp_pos 
	RandomNoRepeat (
		@ m_r1_buildqp_ped_01 :obj_playsound m_r1_buildqp_inc_pos_01 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound m_r1_buildqp_inc_pos_03 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound m_r1_buildqp_inc_pos_05 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound m_r1_buildqp_inc_pos_06 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_cheerland_01 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_cheerland_04 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_cheerland_05 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_cheerland_06 vol = 350 dropoff = 2000
		@ m_r1_buildqp_ped_01 :obj_playsound King_cheerland_09 vol = 350 dropoff = 2000
		)
endscript

script Concrete_Hammer 
	RandomNoRepeat (
		@ obj_playsound \{sk9_Concrete_Hammer_01
			vol = 100
			dropoff = 20
			dropoff_function = linear}
		@ obj_playsound \{sk9_Concrete_Hammer_02
			vol = 100
			dropoff = 20
			dropoff_function = linear}
		@ obj_playsound \{sk9_Concrete_Hammer_03
			vol = 100
			dropoff = 20
			dropoff_function = linear}
		)
endscript

script Carve_Sound 
	soundevent event = stall_truck_squeak
	if (($CARVE_FLAG_ON) = 0)
		pushsoundbussparams
		getspeed
		if (<speed> < 10)
			setsoundbussparams {Rolling = {pitch = 8 vol = 10}} time = 0
		elseif (<speed> < 16)
			setsoundbussparams {Rolling = {pitch = 7 vol = 5}} time = 0
		elseif (<speed> > 15)
			setsoundbussparams {Rolling = {pitch = 6}} time = 0
		endif
		change CARVE_FLAG_ON = 1
		printstruct <...>
	endif
	begin
	wait 1 gameframes
	if NOT iscarving
		if (($CARVE_FLAG_ON) = 1)
			popsoundbussparams
			change CARVE_FLAG_ON = 0
		endif
		break
	endif
	repeat
endscript

script sk9_Crib_Door 
	obj_playsound \{sk9_Crib_Door
		vol = 150
		emitter = z_crib_SFX_SFX_Crib_CLOSET
		dropoff = 20
		dropoff_function = linear}
endscript

script m_r3_love_chk1p1_VO 
	playsound \{m_r3_love_inst_01
		vol = 350}
	wait \{3.5
		seconds}
	playsound \{m_r3_love_inst_01a
		vol = 350}
endscript

script m_r3_love_lastp1_VO 
	playsound \{m_r3_love_inst_07
		vol = 350}
	wait \{2.4
		seconds}
	playsound \{m_r3_love_inst_07a
		vol = 350}
endscript

script m_r3_love_lastp3_VO 
	playsound \{m_r3_love_inst_09
		vol = 350}
	wait \{2.2
		seconds}
	playsound \{m_r3_love_inst_09a
		vol = 350}
endscript

script Eric_CheerLand_Stream_02 
	if gman_getactivatedgoalid
		if (<activated_goal_id> = m_c2_localcomp)
			wait 1.5 seconds
			RandomNoRepeat (
				@ 
				@ 
				@ 
				@ playsound eric_cheerland_02 vol = 100
				@ playsound eric_cheerland_01 vol = 100
				@ playsound eric_cheerland_03 vol = 100
				@ playsound eric_cheerland_04 vol = 100
				@ playsound eric_cheerland_05 vol = 100
				)
		elseif (<activated_goal_id> = m_c2_comppark)
			wait 1.5 seconds
			RandomNoRepeat (
				@ 
				@ 
				@ 
				@ playsound eric_cheerland_02 vol = 100
				@ playsound eric_cheerland_01 vol = 100
				@ playsound eric_cheerland_03 vol = 100
				@ playsound eric_cheerland_04 vol = 100
				@ playsound eric_cheerland_05 vol = 100
				)
		elseif (<activated_goal_id> = m_c2_comppark)
			wait 1.5 seconds
			soundevent event = Eric_CheerLand_Stream_03
		endif
	endif
endscript

script Eric_BooLand_Stream_02 
	if gman_getactivatedgoalid
		if (<activated_goal_id> = m_c2_localcomp)
			wait 1.5 seconds
			RandomNoRepeat (
				@ 
				@ 
				@ 
				@ playsound eric_booland_01 vol = 100
				@ playsound eric_booland_02 vol = 100
				@ playsound eric_booland_03 vol = 100
				@ playsound eric_booland_04 vol = 100
				@ playsound eric_booland_05 vol = 100
				@ playsound eric_booland_06 vol = 100
				@ playsound eric_booland_07 vol = 100
				@ playsound eric_booland_08 vol = 100
				)
		elseif (<activated_goal_id> = m_c2_comppark)
			wait 1.5 seconds
			RandomNoRepeat (
				@ 
				@ 
				@ 
				@ playsound eric_booland_01 vol = 100
				@ playsound eric_booland_02 vol = 100
				@ playsound eric_booland_03 vol = 100
				@ playsound eric_booland_04 vol = 100
				@ playsound eric_booland_05 vol = 100
				@ playsound eric_booland_06 vol = 100
				@ playsound eric_booland_07 vol = 100
				@ playsound eric_booland_08 vol = 100
				)
		elseif (<activated_goal_id> = m_c2_compvert)
			wait 1.5 seconds
			soundevent event = Eric_BooLand_Stream_03
		endif
	endif
endscript

script Eric_CheerLand_Stream_04 
	if gman_getactivatedgoalid
		if (<activated_goal_id> = m_c2_localcomp)
			wait \{1.5
				seconds}
			RandomNoRepeat (
				@ playsound \{eric_cheerland_02
					vol = 100}
				@ playsound \{eric_cheerland_01
					vol = 100}
				@ playsound \{eric_cheerland_03
					vol = 100}
				@ playsound \{eric_cheerland_04
					vol = 100}
				@ playsound \{eric_cheerland_05
					vol = 100}
				)
		endif
	endif
endscript

script Eric_BooLand_Stream_04 
	if gman_getactivatedgoalid
		if (<activated_goal_id> = m_c2_localcomp)
			wait 1.5 seconds
			RandomNoRepeat (
				@ playsound eric_booland_01 vol = 100
				@ playsound eric_booland_02 vol = 100
				@ playsound eric_booland_03 vol = 100
				@ playsound eric_booland_04 vol = 100
				@ playsound eric_booland_05 vol = 100
				@ playsound eric_booland_06 vol = 100
				@ playsound eric_booland_07 vol = 100
				@ playsound eric_booland_08 vol = 100
				)
		endif
	endif
endscript

script VO_m_team_film_NG 
	wait \{1
		seconds}
	RandomNoRepeat (
		@ 
		@ soundevent \{event = VO_m_team_film_inc_02}
		)
endscript

script VO_m_team_film_GOOD 
	wait \{1
		seconds}
	soundevent \{event = VO_m_team_film_inc_01}
endscript

script m_r2_breakin_Guard_Talk_01 
	if gotparam \{object}
		<object> :obj_playsound m_r2_breakin_inc_guard_04 vol = 400 dropoff = 200
	endif
endscript

script m_r2_breakin_Guard_Talk_02 
	if gotparam \{object}
		<object> :obj_playsound m_r2_breakin_inc_guard_03 vol = 400 dropoff = 200
	endif
endscript

script m_r2_breakin_Guard_Talk_03 
	if gotparam \{object}
		<object> :obj_playsound m_r2_breakin_inc_guard_02 vol = 400 dropoff = 200
	endif
endscript

script m_r2_breakin_Guard_Talk_04 
	if gotparam \{object}
		<object> :obj_playsound m_r2_breakin_inc_guard_01 vol = 400 dropoff = 200
	endif
endscript

script Chevron_Break 
	RandomNoRepeat (
		@ playsound \{Fence_Break_01
			vol = 100
			pitch = 150}
		@ playsound \{Fence_Break_02
			vol = 100
			pitch = 150}
		@ playsound \{Fence_Break_03
			vol = 100
			pitch = 150}
		)
endscript

script m_impress_r3_outro_01 
	wait \{0.5
		seconds}
	playsound \{m_impress_r3_outro_01
		vol = 350}
endscript

script sk9_new_zone_beep 
	wait \{3.75
		seconds}
	begin
	playsound \{sk9_Focus_Timer17
		vol = 250
		pan1x = -1
		pan1y = -0.14
		pan2x = 1
		pan2y = -0.14}
	wait \{0.36
		seconds}
	playsound \{sk9_m_h1_BigPushFX
		vol = 75}
	wait \{0.78
		seconds}
	repeat
endscript

script VO_m_h1_epicdrop_inst_06 
	playsound \{m_h1_epicdrop_inst_06
		vol = 350}
	wait \{2.8
		seconds}
	playsound \{m_h1_epicdrop_inst_07
		vol = 350}
endscript

script m_c1_ntt_inst_02 
	playsound \{m_c1_ntt_inst_02
		vol = 350}
endscript

script m_c1_ntt_inst_03 
	playsound \{m_c1_ntt_inst_03
		vol = 350}
endscript

script m_c1_ntt_inst_06 
	playsound \{m_c1_ntt_inst_06
		vol = 350}
endscript

script m_c1_ntt_inst_07 
	playsound \{m_c1_ntt_inst_07
		vol = 350}
endscript

script m_c1_ntt_inst_08 
	playsound \{m_c1_ntt_inst_08
		vol = 350}
endscript

script m_c1_ntt_inst_09 
	playsound \{m_c1_ntt_inst_09
		vol = 350}
endscript

script m_c1_ntt_inst_10 
	playsound \{m_c1_ntt_inst_10
		vol = 350}
endscript

script sk9_train_bell_toll_01 
	if gotparam crossing
		if (<crossing> = 1)
			if iscreated z_slums_SFX_SFX_Train_Signal_03
				z_slums_SFX_SFX_Train_Signal_03 :obj_playsound sk9_train_Bell_Toll num_loops = -1 vol = 200 dropoff = 13 dropoff_function = linear
			endif
		elseif (<crossing> = 2)
			if iscreated z_slums_SFX_SFX_Train_Signal_03
				z_slums_SFX_SFX_Train_Signal_02 :obj_playsound sk9_train_Bell_Toll num_loops = -1 vol = 200 dropoff = 13 dropoff_function = linear
			endif
		elseif (<crossing> = 3)
			if iscreated z_slums_SFX_SFX_Train_Signal_03
				z_slums_SFX_SFX_Train_Signal_01 :obj_playsound sk9_train_Bell_Toll num_loops = -1 vol = 200 dropoff = 13 dropoff_function = linear
			endif
		endif
	endif
endscript

script sk9_train_bell_toll_stop 
	if issoundeventplaying \{sk9_train_bell_toll_01}
		stopsoundevent \{sk9_train_bell_toll_01}
	endif
endscript

script m_h1_bigspines_inst_04 
	playsound \{m_h1_bigspines_inst_05
		vol = 350}
	wait \{4.0
		seconds}
	playsound \{m_h1_bigspines_inst_06
		vol = 350}
endscript

script m_c2_ntg_inst_01 
	playsound \{m_c2_ntg_inst_01
		vol = 375}
endscript

script m_c2_ntg_inst_02 
	playsound \{m_c2_ntg_inst_02
		vol = 375}
endscript

script m_c2_ntg_inst_05 
	playsound \{m_c2_ntg_inst_05
		vol = 375}
endscript

script m_c2_ntg_inst_04 
	playsound \{m_c2_ntg_inst_04
		vol = 375}
endscript

script m_c2_ntg_inst_06 
	playsound \{m_c2_ntg_inst_06
		vol = 375}
endscript

script m_c2_NTG_inst_02b 
	playsound \{m_c2_NTG_inst_02b
		vol = 375}
endscript

script m_c3_photothemed_chk1p1 
	playsound \{m_c3_photothemed_inst_p1_01
		vol = 350}
endscript

script m_c3_photothemed_chk1p2 
	playsound \{m_c3_photothemed_inst_p1_02
		vol = 350}
endscript

script m_c3_photothemed_chk1p3 
	playsound \{m_c3_photothemed_inst_p1_03
		vol = 350}
endscript

script m_c3_photothemed_chk1p4 
	playsound \{m_c3_photothemed_inst_p1_04
		vol = 350}
endscript

script m_c3_photothemed_chk1p5 
	playsound \{m_c3_photothemed_inst_p1_05
		vol = 350}
endscript

script m_c3_photothemed_chk2p1 
	playsound \{m_c3_photothemed_inst_p2_01
		vol = 350}
endscript

script m_c3_photothemed_chk2p3 
	playsound \{m_c3_photothemed_inst_p2_03
		vol = 350}
endscript

script z_bell_elevator_door 
	z_bell_SFX_SFX_Bell_Ghost01 :obj_playsound \{sk9_Door_Open
		vol = 350
		dropoff = 25
		dropoff_function = inv_exponential}
endscript

script VO_m_r1_demo_chk3_pt2 
	playsound \{m_r1_demo_inst_06
		vol = 350}
	wait \{2.5
		seconds}
	soundevent \{event = VO_m_r1_demo_chk4_pt2}
endscript

script VO_m_r1_demo_chk4_pt3 
	if issoundeventplaying \{VO_m_r1_demo_chk3_pt2}
		stopsoundevent \{VO_m_r1_demo_chk3_pt2}
	elseif issoundeventplaying \{VO_m_r1_demo_chk4_pt2}
		stopsoundevent \{VO_m_r1_demo_chk4_pt2}
	endif
	playsound \{m_r1_demo_inst_09
		vol = 350}
endscript

script VO_m_r1_demo_chk4_pt5 
	playsound \{m_r1_demo_inst_11
		vol = 350}
	wait \{1.75
		seconds}
	soundevent \{event = VO_m_r1_demo_chk4_pt6}
endscript

script m_r3_Monuments_chkp3p1_VO 
	playsound \{m_r3_momeuments_inst_05
		vol = 350}
	wait \{3.7
		seconds}
	soundevent \{event = m_r3_Monuments_chkp3p2_VO}
endscript

script puddle_splash_sfx 
	RandomNoRepeat (
		@ skater :obj_playsound sk8_terr_water_enter_08 vol = 50 pitch = 150
		@ skater :obj_playsound sk8_terr_water_enter_10 vol = 50 pitch = 150
		@ skater :obj_playsound sk8_terr_water_enter_12 vol = 50 pitch = 150
		@ skater :obj_playsound sk8_terr_water_enter_15 vol = 50 pitch = 150
		@ skater :obj_playsound sk8_terr_water_exit_01 vol = 50 pitch = 150
		@ skater :obj_playsound sk8_terr_water_exit_03 vol = 50 pitch = 150
		)
endscript

script SK9_show_waypoint_sfx 
	playsound \{sk9_New_Show_Goal
		vol = 180}
	playsound \{SK8_Generic_Select_01
		vol = 90}
endscript

script sk9_Train_Loop_show1_sfx 
	soundevent event = sk9_train_show1_hornsfx
	soundevent event = sk9_m_r2_Show1_Train_Screech
	RandomNoRepeat (
		@ playsound sk9_Slums_Train_Horn vol = 300 pan1y = -0.8
		@ 
		@ 
		)
	playsound sk9_Slums_Train_LeaveStation vol = 175 pitch = 125 pan1y = 0
	wait 1 seconds
	Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Loop vol = 250 pitch = 125 num_loops = -1
	wait 1 seconds
	setsoundparams sk9_Slums_Train_Loop vol = 275 pitch = 135
	wait 1 seconds
	setsoundparams sk9_Slums_Train_Loop vol = 280 pitch = 145
	wait 1 seconds
	setsoundparams sk9_Slums_Train_Loop vol = 300 pitch = 160
	wait 1.5 seconds
	soundevent event = m_r2_Show1_Bam_Dies
endscript

script sk9_train_show1_hit_sfx 
	RandomNoRepeat (
		@ playsound sk9_Slums_Train_Horn vol = 300 pan1y = -0.5
		@ 
		)
	wait 0.3 seconds
	RandomNoRepeat (
		@ skater :obj_playsound male_lgbail_10 vol = 400
		@ skater :obj_playsound male_lgbail_09 vol = 400
		@ skater :obj_playsound male_lgbail_08 vol = 400
		@ skater :obj_playsound male_lgbail_07 vol = 400
		@ skater :obj_playsound male_lgbail_06 vol = 400
		)
	skater :obj_playsound sk9_Slums_TrainHit vol = 150
endscript

script sk9_train_show1_reset 
	if issoundeventplaying \{sk9_Train_Loop_show1_sfx}
		stopsoundevent \{sk9_Train_Loop_show1_sfx}
	endif
	if issoundeventplaying \{sk9_m_r2_Show1_Train_Screech}
		stopsoundevent \{sk9_m_r2_Show1_Train_Screech}
	endif
	if issoundeventplaying \{sk9_train_show1_hornsfx}
		stopsoundevent \{sk9_train_show1_hornsfx}
	endif
endscript

script sk9_train_show1_sfx_end 
	Z_WP_Bridge_Train_01 :obj_playsound \{sk9_Slums_Train_ArriveStation
		vol = 325}
	if issoundeventplaying \{sk9_Train_Loop_show1_sfx}
		stopsoundevent \{sk9_Train_Loop_show1_sfx}
	endif
	if issoundeventplaying \{sk9_m_r2_Show1_Train_Screech}
		stopsoundevent \{sk9_m_r2_Show1_Train_Screech}
	endif
	if issoundeventplaying \{sk9_train_show1_hornsfx}
		stopsoundevent \{sk9_train_show1_hornsfx}
	endif
endscript

script sk9_train_show1_hornsfx 
	begin
	if iscreated \{Z_WP_Bridge_Train_01}
		Z_WP_Bridge_Train_01 :obj_playsound sk9_Slums_Train_Horn vol = RandomRange (200.0, 300.0)
	else
		return
	endif
	wait RandomRange (1.0, 4.0) seconds
	repeat
endscript

script Bell_SFX_StopTrain_Switcher 
	if inside
		if (($WP_BRIDGE_TRAIN_SFX_ON) = 1)
			change \{WP_BRIDGE_TRAIN_SFX_ON = 0}
		endif
	else
		if (($WP_BRIDGE_TRAIN_SFX_ON) = 0)
			change \{WP_BRIDGE_TRAIN_SFX_ON = 1}
		endif
	endif
endscript

script VO_m_r1_demo_chk4_pt7 
	if issoundeventplaying \{VO_m_r1_demo_chk4_pt5}
		stopsoundevent \{VO_m_r1_demo_chk4_pt5}
	elseif issoundeventplaying \{VO_m_r1_demo_chk4_pt6}
		stopsoundevent \{VO_m_r1_demo_chk4_pt6}
	endif
	playsound \{m_r1_demo_inst_13
		vol = 350}
endscript

script VO_m_c3_Photothemed_inst_p1_02b 
	playsound \{m_c3_photothemed_inst_p1_02b
		vol = 350}
endscript

script sk9_Banner_Dirt_SFX_04 
	playsound \{sk9_Banner_Dirt_SFX
		vol = 50}
	playsound \{SK8_Bouncy_WoodTable_Collide_02
		vol = 70}
endscript

script sk9_Hammer_Wood 
	playsound \{sk9_Hammer_Wood
		vol = 200}
	wait \{0.7
		seconds}
	soundevent \{event = sk9_Banner_Dirt_SFX_04}
endscript

script sk9_Hammer_SolidMetal 
	playsound \{sk9_Hammer_SolidMetal
		vol = 200}
	wait \{0.7
		seconds}
	soundevent \{event = sk9_Banner_Dirt_SFX_04}
endscript

script sk9_Hammer_Concrete 
	playsound \{sk9_Hammer_Concrete
		vol = 200}
	wait \{0.7
		seconds}
	soundevent \{event = sk9_Banner_Dirt_SFX_04}
endscript

script sk9_Hammer_CarHood 
	playsound \{sk9_Hammer_CarHood
		vol = 200}
	wait \{0.7
		seconds}
	if gotparam \{IsItASign}
		if (<IsItASign> = sign)
			soundevent \{event = sk9_Banner_Dirt_SFX}
		endif
	elseif gman_getactivatedgoalid
		if NOT (<activated_goal_id> = m_r3_harbor)
			soundevent \{event = sk9_Banner_Dirt_SFX_04}
		endif
	endif
endscript

script Turn_Off_All_NTG_VO 
	if issoundplaying \{m_c2_ntg_inst_06}
		stopsound \{m_c2_ntg_inst_06}
	elseif issoundplaying \{m_c2_ntg_inst_05}
		stopsound \{m_c2_ntg_inst_05}
	elseif issoundplaying \{m_c2_ntg_inst_04}
		stopsound \{m_c2_ntg_inst_04}
	elseif issoundplaying \{m_c2_NTG_inst_02b}
		stopsound \{m_c2_NTG_inst_02b}
	elseif issoundplaying \{m_c2_ntg_inst_02}
		stopsound \{m_c2_ntg_inst_02}
	elseif issoundplaying \{m_c2_ntg_inst_01}
		stopsound \{m_c2_ntg_inst_01}
	endif
endscript

script Turn_Off_All_NTM_VO 
	if issoundplaying m_c3_photothemed_inst_p1_01
		stopsound m_c3_photothemed_inst_p1_01
	elseif issoundplaying m_c3_photothemed_inst_p1_02
		stopsound m_c3_photothemed_inst_p1_02
	elseif issoundplaying m_c3_photothemed_inst_p1_03
		stopsound m_c3_photothemed_inst_p1_03
	elseif issoundplaying m_c3_photothemed_inst_p1_04
		stopsound m_c3_photothemed_inst_p1_04
	elseif issoundplaying m_c3_photothemed_inst_p1_05
		stopsound m_c3_photothemed_inst_p1_05
	elseif issoundplaying m_c3_photothemed_inst_p1_06
		stopsound m_c3_photothemed_inst_p1_06
	elseif issoundplaying m_c3_photothemed_inst_p2_01
		stopsound m_c3_photothemed_inst_p2_01
	elseif issoundplaying m_c3_photothemed_inst_p2_02
		stopsound m_c3_photothemed_inst_p2_02
	elseif issoundplaying m_c3_photothemed_inst_p2_03
		stopsound m_c3_photothemed_inst_p2_03
	elseif issoundplaying m_c3_photothemed_inst_p3_01
		stopsound m_c3_photothemed_inst_p3_01
	endif
endscript

script Turn_Off_All_AggroKick_VO 
	if issoundplaying \{m_h1_bigpush_inst_01}
		stopsound \{m_h1_bigpush_inst_01}
	elseif issoundplaying \{m_h1_bigpush_inst_02}
		stopsound \{m_h1_bigpush_inst_02}
	elseif issoundplaying \{m_h1_bigpush_inst_03}
		stopsound \{m_h1_bigpush_inst_03}
	elseif issoundplaying \{m_h1_bigpush_inst_03b}
		stopsound \{m_h1_bigpush_inst_03b}
	endif
endscript

script Turn_Off_All_NTT_VO 
	if issoundplaying m_c1_ntt_inst_01
		stopsound m_c1_ntt_inst_01
	elseif issoundplaying m_c1_ntt_inst_02
		stopsound m_c1_ntt_inst_02
	elseif issoundplaying m_c1_ntt_inst_03
		stopsound m_c1_ntt_inst_03
	elseif issoundplaying m_c1_ntt_inst_04
		stopsound m_c1_ntt_inst_04
	elseif issoundplaying m_c1_ntt_inst_05
		stopsound m_c1_ntt_inst_05
	elseif issoundplaying m_c1_ntt_inst_06
		stopsound m_c1_ntt_inst_06
	elseif issoundplaying m_c1_ntt_inst_07
		stopsound m_c1_ntt_inst_07
	elseif issoundplaying m_c1_ntt_inst_08
		stopsound m_c1_ntt_inst_08
	elseif issoundplaying m_c1_ntt_inst_09
		stopsound m_c1_ntt_inst_09
	elseif issoundplaying m_c1_ntt_inst_10
		stopsound m_c1_ntt_inst_10
	endif
endscript

script sk8_bailboard 
	RandomNoRepeat (
		@ skater :obj_playsound \{BailBoard01}
		@ skater :obj_playsound \{BailBoard02}
		@ skater :obj_playsound \{BailBoard03}
		@ skater :obj_playsound \{BailBoard04}
		@ skater :obj_playsound \{BailBoard05}
		)
endscript

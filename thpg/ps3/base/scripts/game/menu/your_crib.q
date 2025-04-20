crib_after_cap_return_to_menu = no
crib_pieces_pak = 'pak/crib_objects/crib_objects.pak'
crib_current_settings = {
}
crib_current_video = none
crib_current_music = none
crib_default_bigticket_bitflag = 1
crib_default_theme_bitflag = 1
crib_default_video_bitflag = 0
crib_first_locked_video_index = 30
crib_zone_list = [
	{
		zone = z_crib_default
		name = "Warehouse"
		abbrev = "WH"
		cost = 0
	}
	{
		zone = z_crib_club
		name = "Club"
		abbrev = "CLB"
		cost = 5000
	}
	{
		zone = z_crib_dojo
		name = "Dojo"
		abbrev = "DJ"
		cost = 5000
	}
	{
		zone = z_crib_Gothic
		name = "Gothic"
		abbrev = "GTC"
		cost = 5000
	}
	{
		zone = z_crib_Graffiti
		name = "Graffiti"
		abbrev = "GRF"
		cost = 5000
	}
	{
		zone = z_crib_Prison
		name = "Prison"
		abbrev = "PRN"
		cost = 5000
	}
	{
		zone = z_crib_Rectro
		name = "Rec Room"
		abbrev = "REC"
		cost = 5000
	}
	{
		zone = z_crib_Skatepark
		name = "Skatepark"
		abbrev = "SKP"
		cost = 5000
	}
	{
		zone = z_crib_Temple
		name = "Temple"
		abbrev = "TPL"
		cost = 5000
	}
	{
		zone = z_crib_Theater
		name = "Theater"
		abbrev = "CHR"
		cost = 5000
	}
	{
		zone = z_crib_Tiki
		name = "Tiki"
		abbrev = "CHR"
		cost = 5000
	}
	{
		zone = z_crib_Chrome
		name = "Chrome"
		abbrev = "CHR"
		cost = 5000
	}
]
crib_bigticket_list = [
	NODEFLAG_CRIB_BASICHALFPIPE
	NODEFLAG_CRIB_BIGHALFPIPE
	NODEFLAG_CRIB_MINIRAMP
	NODEFLAG_CRIB_POOL
]
crib_bigticket_params = {
	NODEFLAG_CRIB_MINIRAMP = {
		text = "Mini Ramp"
		abbrev = "MRMP"
		cost = 10
		cam_pos = (396.23148, 11.745975, -545.046)
		cam_quat = (0.053536, -0.83993596, 0.084299006)
	}
	NODEFLAG_CRIB_BASICHALFPIPE = {
		text = "Basic Half Pipe"
		abbrev = "BHP"
		cost = 0
		cam_pos = (396.23148, 11.745975, -545.046)
		cam_quat = (0.053536, -0.83993596, 0.084299006)
	}
	NODEFLAG_CRIB_BIGHALFPIPE = {
		text = "Large Half Pipe"
		abbrev = "LHP"
		cost = 10
		cam_pos = (396.23148, 11.745975, -545.046)
		cam_quat = (0.053536, -0.83993596, 0.084299006)
	}
	NODEFLAG_CRIB_POOL = {
		text = "Swimming Pool"
		abbrev = "SP"
		cost = 10
		cam_pos = (396.23148, 11.745975, -545.046)
		cam_quat = (0.053536, -0.83993596, 0.084299006)
	}
}
crib_video_list = [
	none
	Transworld
	Bails1
	Bails2
	Montage
	VID1
	billabong
	VID2
	VID3
	VID4
	VID5
	VID6
	VID7
	VID8
	VID9
	VID10
	VID11
	VID12
	VID13
	VID14
	VID15
	VID16
	VID17
	VID18
	VID19
	VID20
	VID21
	VID22
	VID23
	VID24
	VID25
	ns_logo
	Andrew
	Arto
	bam
	bob
	Daewon
	Dustin
	Jeff
	Jereme
	Lance
	mike
	nyjah
	rodney
	Ryan
	Stevie
	Tony
	Vanessa
]
crib_video_params = {
	none = {
		text = "None"
		cost = 0
		bink_params = {
		}
	}
	Transworld = {
		text = "Transworld"
		cost = 0
		bink_params = {
			movie = 'transworld'
		}
	}
	Bails1 = {
		text = "Bails 1 Video"
		cost = 10000
		bink_params = {
			movie = 'Bails1'
		}
		unlock_flag = $MOVIE_UNLOCK_Bails1
	}
	Bails2 = {
		text = "Bails 2 Video"
		cost = 10000
		bink_params = {
			movie = 'Bails2'
		}
		unlock_flag = $MOVIE_UNLOCK_Bails2
	}
	Montage = {
		text = "Pro Montage"
		cost = 15000
		bink_params = {
			movie = 'Montage'
		}
		unlock_flag = $MOVIE_UNLOCK_Montage
	}
	VID1 = {
		text = "Adio"
		cost = 0
		bink_params = {
			movie = 'adio'
		}
		unlock_flag = $CAS_UNLOCK_SHOE
	}
	billabong = {
		text = "Billabong"
		cost = 0
		bink_params = {
			movie = 'billabong'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID2 = {
		text = "Birdhouse"
		cost = 0
		bink_params = {
			movie = 'birdhouse'
		}
		unlock_flag = $CAS_UNLOCK_DECK
	}
	VID3 = {
		text = "DVS"
		cost = 0
		bink_params = {
			movie = 'dvs'
		}
		unlock_flag = $CAS_UNLOCK_SHOE
	}
	VID4 = {
		text = "Element"
		cost = 0
		bink_params = {
			movie = 'element'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID5 = {
		text = "éS"
		cost = 0
		bink_params = {
			movie = 'eS'
		}
		unlock_flag = $CAS_UNLOCK_SHOE
	}
	VID6 = {
		text = "Etnies"
		cost = 0
		bink_params = {
			movie = 'etnies'
		}
		unlock_flag = $CAS_UNLOCK_SHOE
	}
	VID7 = {
		text = "Flip"
		cost = 0
		bink_params = {
			movie = 'flipper'
		}
		unlock_flag = $CAS_UNLOCK_DECK
	}
	VID8 = {
		text = "Quiksilver"
		cost = 0
		bink_params = {
			movie = 'quiksilver'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID9 = {
		text = "Vans"
		cost = 0
		bink_params = {
			movie = 'vans'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID10 = {
		text = "Volcom"
		cost = 0
		bink_params = {
			movie = 'volcom'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID11 = {
		text = "Almost"
		cost = 0
		bink_params = {
			movie = 'almost'
		}
	}
	VID12 = {
		text = "Altamont"
		cost = 0
		bink_params = {
			movie = 'Altamont'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID13 = {
		text = "Baker"
		cost = 0
		bink_params = {
			movie = 'baker'
		}
		unlock_flag = $CAS_UNLOCK_DECK
	}
	VID14 = {
		text = "Billibong"
		cost = 0
		bink_params = {
			movie = 'billibong'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID15 = {
		text = "DGK"
		cost = 0
		bink_params = {
			movie = 'dgk'
		}
		unlock_flag = $CAS_UNLOCK_DECK
	}
	VID16 = {
		text = "Electric"
		cost = 0
		bink_params = {
			movie = 'electric'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID17 = {
		text = "Emerica"
		cost = 0
		bink_params = {
			movie = 'emerica'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID18 = {
		text = "Globe"
		cost = 0
		bink_params = {
			movie = 'globe'
		}
		unlock_flag = $CAS_UNLOCK_SHOE
	}
	VID19 = {
		text = "Hurley"
		cost = 0
		bink_params = {
			movie = 'hurley'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID20 = {
		text = "Matix"
		cost = 0
		bink_params = {
			movie = 'matix'
		}
	}
	VID21 = {
		text = "Oakley"
		cost = 0
		bink_params = {
			movie = 'oakley'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID22 = {
		text = "Plan B"
		cost = 0
		bink_params = {
			movie = 'planB'
		}
		unlock_flag = $CAS_UNLOCK_DECK
	}
	VID23 = {
		text = "Von Zipper"
		cost = 0
		bink_params = {
			movie = 'vonzipper'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID24 = {
		text = "Zoo York"
		cost = 0
		bink_params = {
			movie = 'zooyork'
		}
		unlock_flag = $CAS_UNLOCK_AM
	}
	VID25 = {
		text = "Rolling Stones"
		cost = 500
		bink_params = {
			movie = 'rollingstones'
		}
	}
	ns_logo = {
		text = "Neversoft"
		cost = 500
		bink_params = {
			movie = 'ns_logo'
		}
	}
	Andrew = {
		text = "Andrew Reynolds"
		cost = 300
		bink_params = {
			movie = 'AndrewReynolds'
		}
	}
	Arto = {
		text = "Arto Saari"
		cost = 300
		bink_params = {
			movie = 'ArtoSaari'
		}
	}
	bam = {
		text = "Bam Margera"
		cost = 300
		bink_params = {
			movie = 'BamMargera'
		}
	}
	bob = {
		text = "Bob Burnquist"
		cost = 300
		bink_params = {
			movie = 'BobBurnquist'
		}
	}
	Daewon = {
		text = "Daewon Song"
		cost = 300
		bink_params = {
			movie = 'DaewonSong'
		}
	}
	Dustin = {
		text = "Dustin Dollin"
		cost = 300
		bink_params = {
			movie = 'DustinDollin'
		}
	}
	Jeff = {
		text = "Jeff King"
		cost = 300
		bink_params = {
			movie = 'jeffking'
		}
	}
	Jereme = {
		text = "Jereme Rogers"
		cost = 300
		bink_params = {
			movie = 'JeremeRogers'
		}
	}
	Lance = {
		text = "Lance Mountain"
		cost = 300
		bink_params = {
			movie = 'LanceMountain'
		}
	}
	mike = {
		text = "Mike Vallely"
		cost = 300
		bink_params = {
			movie = 'MikeVallely'
		}
	}
	nyjah = {
		text = "Nyjah Huston"
		cost = 300
		bink_params = {
			movie = 'NyjahHuston'
		}
	}
	rodney = {
		text = "Rodney Mullen"
		cost = 300
		bink_params = {
			movie = 'RodneyMullen'
		}
	}
	Ryan = {
		text = "Ryan Sheckler"
		cost = 300
		bink_params = {
			movie = 'RyanSheckler'
		}
	}
	Stevie = {
		text = "Stevie Williams"
		cost = 300
		bink_params = {
			movie = 'StevieWilliams'
		}
	}
	Tony = {
		text = "Tony Hawk"
		cost = 300
		bink_params = {
			movie = 'TonyHawk'
		}
	}
	Vanessa = {
		text = "Vanessa Torres"
		cost = 300
		bink_params = {
			movie = 'VanessaTorres'
		}
	}
}
crib_model_bink_list = [
	{
		texdict = `Models\Props\crib_large_tv\crib_large_tv.tex`
		texture = `Tex\Bink02.dds`
		bling_object = crib_large_tv
	}
	{
		texdict = `Models\Props\crib_13_TV\crib_13_TV.tex`
		texture = `..\..\nxcommon\Data\Tex\Bink02.dds`
		bling_object = crib_13_TV
	}
	{
		texdict = `Models\Props\crib_19_TV\crib_19_TV.tex`
		texture = `..\..\nxcommon\Data\Tex\Bink02.dds`
		bling_object = crib_19_TV
	}
	{
		texdict = `Models\Props\crib_plasma_TV\crib_plasma_TV.tex`
		texture = `..\..\nxcommon\Data\Tex\Bink02.dds`
		bling_object = crib_plasma_TV
	}
	{
		texdict = `Models\Props\crib_projection_TV\crib_projection_TV.tex`
		texture = `..\..\nxcommon\Data\Tex\Bink02.dds`
		bling_object = crib_projection_TV
	}
	{
		texdict = `Models\Props\crib_racecar_bed\crib_racecar_bed.tex`
		texture = `..\..\nxcommon\Data\Tex\Bink02.dds`
		bling_object = crib_racecar_bed
	}
	{
		texdict = `Models\Props\projection_screen\projection_screen.tex`
		texture = `Tex\Bink02.dds`
		bling_object = PROJECTION_SCREEN
	}
	{
		texdict = `Models\Props\projection_screen_small\projection_screen_small.tex`
		texture = `Tex\Bink02.dds`
		bling_object = PROJECTION_screen_small
	}
	{
		texdict = `Models\Props\projection_screen_large\projection_screen_large.tex`
		texture = `Tex\Bink02.dds`
		bling_object = PROJECTION_screen_large
	}
]
crib_theme_bink = {
	texdict = `zones/z_crib_theater/z_crib_theater.tex`
	texture = `Tex\Bink02.dds`
	context = z_crib_Theater
}
clock_radio_dsp = {
	effect = {
		effect = highpass
		name = PlaylistHighPass
		cutoff = 3000
		resonance = 1.0
	}
	effect2 = {
		effect = lowpass
		name = PlaylistLowPass
		cutoff = 6000
		resonance = 1.0
	}
	effect3 = {
		effect = compressor
		name = PlaylistCompressor
		threshold = -40
		attack = 10.0
		release = 20.0
		gainmakeup = 18.0
	}
	effect4 = {
		effect = sfxreverb
		name = MusicReverb1
		drylevel = 0.0
		room = 0.0
		roomhf = 0.0
		roomrollofffactor = 10.0
		decaytime = 2.0
		decayhfratio = 0.5
		reflectionslevel = -100.0
		reflectionsdelay = 0.0
		reverblevel = -600.0
		reverbdelay = 0.04
		diffusion = 100.0
		density = 100.0
		hfreference = 5000.0
	}
}
eighttrack_player_dsp = {
	effect = {
		effect = lowpass
		name = PlaylistLowPass
		cutoff = 7500
		resonance = 1.0
	}
	effect2 = {
		effect = parameq
		name = PlaylistParamEQ
		center = 1500
		bandwidth = 1.0
		gain = 6.0
	}
	effect3 = {
		effect = echo
		name = PlaylistEcho
		delay = 220
		decayratio = 0.25
		maxchannels = 6
		drymix = 0.6
		wetmix = 0.05
	}
	effect4 = {
		effect = sfxreverb
		name = MusicReverb1
		drylevel = -200
		room = 0.0
		roomhf = 0.0
		roomrollofffactor = 10.0
		decaytime = 0.5
		decayhfratio = 0.5
		reflectionslevel = -2000.0
		reflectionsdelay = 0.0
		reverblevel = -600.0
		reverbdelay = 0.04
		diffusion = 100.0
		density = 100.0
		hfreference = 5000.0
	}
}
small_boombox_dsp = {
	effect = {
		effect = parameq
		name = PlaylistParamEQ
		center = 1500
		bandwidth = 0.1
		gain = 0.05
	}
	effect2 = {
		effect = highpass
		name = PlaylistHighPass
		cutoff = 400
		resonance = 1.0
	}
	effect3 = {
		effect = compressor
		name = PlaylistCompressor
		threshold = -40
		attack = 10.0
		release = 20.0
		gainmakeup = 15.0
	}
	effect4 = {
		effect = sfxreverb
		name = MusicReverb1
		drylevel = 0.0
		room = 0.0
		roomhf = 0.0
		roomrollofffactor = 10.0
		decaytime = 1.0
		decayhfratio = 0.5
		reflectionslevel = -200.0
		reflectionsdelay = 0.0
		reverblevel = -200.0
		reverbdelay = 0.04
		diffusion = 100.0
		density = 100.0
		hfreference = 5000.0
	}
}
ghetto_blaster_dsp = {
	effect = {
		effect = parameq
		name = PlaylistParamEQ
		center = 150
		bandwidth = 1.0
		gain = 3.0
	}
	effect2 = {
		effect = parameq
		name = PlaylistParamEQ
		center = 7500
		bandwidth = 3.0
		gain = 0.75
	}
	effect3 = {
		effect = compressor
		name = PlaylistCompressor
		threshold = -24
		attack = 10.0
		release = 20.0
		gainmakeup = 15.0
	}
	effect4 = {
		effect = sfxreverb
		name = MusicReverb1
		drylevel = -1000.0
		room = 0.0
		roomhf = 0.0
		roomrollofffactor = 10.0
		decaytime = 1.0
		decayhfratio = 0.5
		reflectionslevel = -1000.0
		reflectionsdelay = 0.0
		reverblevel = -1000.0
		reverbdelay = 0.04
		diffusion = 100.0
		density = 100.0
		hfreference = 5000.0
	}
}
name_brand_system_dsp = {
	effect = {
		effect = highpass
		name = PlaylistHighPass
		cutoff = 150
		resonance = 1.0
	}
	effect2 = {
		effect = parameq
		name = PlaylistParamEQ
		center = 10000
		bandwidth = 3.0
		gain = 1.5
	}
	effect3 = {
		effect = compressor
		name = PlaylistCompressor
		threshold = -15
		attack = 20.0
		release = 20.0
		gainmakeup = 5.0
	}
	effect4 = {
		effect = sfxreverb
		name = MusicReverb1
		drylevel = 0.0
		room = 0.0
		roomhf = 0.0
		roomrollofffactor = 10.0
		decaytime = 1.0
		decayhfratio = 0.5
		reflectionslevel = -1200.0
		reflectionsdelay = 0.0
		reverblevel = -600.0
		reverbdelay = 0.04
		diffusion = 100.0
		density = 100.0
		hfreference = 5000.0
	}
}
jukebox_dsp = {
	effect = {
		effect = parameq
		name = PlaylistParamEQ
		center = 1000
		bandwidth = 5.0
		gain = 6.0
	}
	effect2 = {
		effect = lowpass
		name = PlaylistLowPass
		cutoff = 10000
		resonance = 1.0
	}
	effect3 = {
		effect = sfxreverb
		name = PlaylistReverb
		drylevel = -1400.0
		room = 0.0
		roomhf = -400.0
		roomrollofffactor = 10.0
		decaytime = 2.0
		decayhfratio = 0.9
		reflectionslevel = -1200.0
		reflectionsdelay = 0.0
		reverblevel = -2000.0
		reverbdelay = 0.5
		diffusion = 100.0
		density = 100.0
		hfreference = 4000.0
	}
}
hi_fi_system_dsp = {
	effect = {
		effect = parameq
		name = PlaylistParamEQ
		center = 200
		bandwidth = 2.0
		gain = 2.2
	}
	effect2 = {
		effect = parameq
		name = PlaylistParamEQ
		center = 10000
		bandwidth = 3.0
		gain = 2.0
	}
	effect3 = {
		effect = compressor
		name = PlaylistCompressor
		threshold = -24
		attack = 20.0
		release = 20.0
		gainmakeup = 6.0
	}
	effect4 = {
		effect = sfxreverb
		name = MusicReverb1
		drylevel = 0.0
		room = 0.0
		roomhf = 0.0
		roomrollofffactor = 10.0
		decaytime = 2.0
		decayhfratio = 0.5
		reflectionslevel = -1200.0
		reflectionsdelay = 0.0
		reverblevel = -600.0
		reverbdelay = 0.5
		diffusion = 100.0
		density = 100.0
		hfreference = 5000.0
	}
}
turn_tables_dsp = {
	effect = {
		effect = flange
		name = PlaylistFlange
		drymix = 0.8
		wetmix = 0.2
		depth = 0.8
		rate = 0.05
	}
	effect2 = {
		effect = parameq
		name = PlaylistParamEQ
		center = 150
		bandwidth = 1.0
		gain = 3.0
	}
	effect3 = {
		effect = compressor
		name = PlaylistCompressor
		threshold = -20
		attack = 20.0
		release = 20.0
		gainmakeup = 3.0
	}
	effect4 = {
		effect = sfxreverb
		name = MusicReverb1
		drylevel = 0.0
		room = 0.0
		roomhf = 0.0
		roomrollofffactor = 10.0
		decaytime = 20.0
		decayhfratio = 0.5
		reflectionslevel = -100.0
		reflectionsdelay = 0.0
		reverblevel = -600.0
		reverbdelay = 0.04
		diffusion = 100.0
		density = 100.0
		hfreference = 5000.0
	}
}
crib_dsp_effects = {
	clock_radio_yourcrib_RM = {
		$clock_radio_dsp
	}
	crib_8track = {
		$eighttrack_player_dsp
	}
	crib_funbox_corner = {
		$name_brand_system_dsp
	}
	crib_ghetto_blaster = {
		$ghetto_blaster_dsp
	}
	crib_jukebox = {
		$jukebox_dsp
	}
	crib_hi_fi_system = {
		$hi_fi_system_dsp
	}
	crib_name_brand_System = {
		$name_brand_system_dsp
	}
	crib_stereo_system = {
		$name_brand_system_dsp
	}
	crib_turn_tables = {
		$turn_tables_dsp
	}
	small_boombox_yourcrib_RM = {
		$small_boombox_dsp
	}
}

script crib_get_theme_data 
	if NOT gotparam \{theme}
		return \{false}
	endif
	getarraysize ($crib_zone_list)
	<i> = 0
	begin
	zone_entry = (($crib_zone_list) [<i>])
	this_zone = (<zone_entry>.zone)
	if checksumequals a = <this_zone> b = <theme>
		return true data = <zone_entry>
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script crib_get_bigticket_used 
	getarraysize ($crib_bigticket_list)
	<i> = 0
	begin
	bigticket_item = (($crib_bigticket_list) [<i>])
	if getnodeflag <bigticket_item>
		return true bigticket = <bigticket_item> index = <i>
	endif
	i = (<i> + 1)
	repeat <array_size>
	return \{false}
endscript

script crib_get_music_used 
	if structurecontains structure = ($crib_current_settings) music
		return true music = (($crib_current_settings).music)
	endif
	return \{false}
endscript

script crib_get_video_used 
	if structurecontains structure = ($crib_current_settings) video
		return true video = (($crib_current_settings).video)
	endif
	return \{false}
endscript

script crib_get_default_settings 
	return \{settings = {
			zone = z_crib_default
			video = Transworld
			music = playlist
		}}
endscript

script crib_set_default_settings 
	crib_get_default_settings
	change crib_current_settings = <settings>
endscript

script crib_apply_settings 
	printf \{'crib_apply_settings'}
	crib_set_theme theme = ($crib_current_settings.zone) block_scripts = <block_scripts>
	change crib_current_video = ($crib_current_settings.video)
	change crib_current_music = ($crib_current_settings.music)
endscript

script crib_get_current_setup_struct 
	WriteRigAKitPiecesToArray \{array_name = pieces}
	curr_settings = $crib_current_settings
	return setup = {pieces = <pieces> crib_settings = <curr_settings>}
endscript

script crib_get_saved_setup_struct 
	printf \{'crib_get_saved_setup_struct'}
	if CAP_LoadRiggerSetup \{rigger_crib}
		return setup = <setup>
	else
		crib_get_default_settings
		return setup = {pieces = [] crib_settings = <settings>}
	endif
endscript

script crib_change_to_default_crib 
	printf \{'crib_change_to_default_crib'}
	crib_set_default_settings
	cap_restore_pieces_from_array array = ($crib_default_pieces)
	crib_save_settings
	crib_apply_settings block_scripts = <block_scripts>
endscript

script crib_change_to_saved_crib 
	printf \{'crib_change_to_saved_crib'}
	if CAP_LoadRiggerSetup \{rigger_crib}
		printf \{'inline crib_use_setup_struct'}
		cap_restore_pieces_from_array array = (<setup>.pieces)
		change crib_current_settings = (<setup>.crib_settings)
		crib_apply_settings block_scripts = <block_scripts>
	else
		crib_change_to_default_crib block_scripts = <block_scripts>
	endif
endscript

script crib_save_settings 
	crib_get_current_setup_struct
	CAP_SaveRiggerSetup {
		rigger_crib
		setup = <setup>
	}
endscript

script crib_change_theme_ve 
	crib_set_theme theme = <theme> block_scripts = 1
endscript

script crib_change_to_career_theme_ve 
	crib_apply_settings block_scripts = <block_scripts>
endscript

script crib_change_zone 
	new_settings = ($crib_current_settings)
	change crib_current_settings = {<new_settings> zone = <zone>}
	crib_apply_settings block_scripts = <block_scripts>
	crib_save_settings
endscript

script crib_enter_rigger_mode 
	generic_ui_destroy
	killskatercamanim \{all}
	unpause_game_and_destroy_pause_menu
	if gotparam \{bling_object}
		change \{crib_after_cap_return_to_menu = placed_rigger}
		spawnscriptlater \{crib_invoke_rigger
			params = {
				mode = crib
			}}
	else
		change \{crib_after_cap_return_to_menu = placed_rigger}
		change \{cap_current_category = rails}
		spawnscriptlater \{crib_invoke_rigger
			params = {
				mode = rigger
			}}
	endif
endscript

script crib_invoke_rigger 
	MakeSkaterGoto Enter_CAP_mode params = {mode = <mode> cap_object = <cap_object>}
endscript

script crib_calc_refund_cost 
	obj_cost = (($ConstructionTypes.<piece_type> [<piece_index>].cost))
	if gotparam \{obj_cost}
		refund = (<obj_cost> * $refund_percentage)
		casttointeger \{refund}
		if (<refund> < 1)
			refund = 1
		endif
		return refund = <refund>
	else
		return \{refund = 0}
	endif
endscript

script crib_ask_to_sell_item 
	if ($cap_place_one_off = 1)
		one_off = ($cap_crib_object_selected)
	endif
	launchevent type = unfocus target = CAP_container
	wait 5 gameframes
	rigakit_cursor :disableplayerinput
	skater :disableplayerinput
	<id> :rak_getpiecetype
	<id> :rak_getpieceindex
	obj_name = (($ConstructionTypes.<piece_type> [<piece_index>].name_string))
	crib_calc_refund_cost piece_index = <piece_index> piece_type = <piece_type>
	formattext textname = txt "Do you wish to sell the '%s' for $%f?" s = <obj_name> f = <refund>
	create_dialog_box {title = "Sell Item"
		text = <txt>
		buttons = [{text = "yes" pad_choose_script = crib_ask_to_sell_item_yes pad_choose_params = {id = <id> refund = <refund> one_off = <one_off>}}
			{text = "no" pad_choose_script = crib_ask_to_sell_item_no pad_choose_params = {one_off = <one_off>}}
		]
	}
endscript

script crib_ask_to_sell_item_yes 
	printf \{'crib_ask_to_sell_item_yes'}
	careerfunc func = AddCash params = {cash = <refund> refund = true}
	cap_delete_this_object id = <id>
	spawnscriptnow \{crib_update_av}
	crib_ask_to_sell_item_done one_off = <one_off>
endscript

script crib_ask_to_sell_item_no 
	printf \{'crib_ask_to_sell_item_no'}
	crib_ask_to_sell_item_done one_off = <one_off>
endscript

script crib_ask_to_sell_item_done 
	printf \{'crib_ask_to_sell_item_done'}
	if gotparam \{one_off}
		extra_params = {cap_object = <one_off>}
		change \{cap_place_one_off = 1}
		change cap_crib_object_selected = <one_off>
		change \{crib_after_cap_return_to_menu = placed_bling}
	endif
	debounce \{select
		time = 0.2}
	skater :disableplayerinput
	rigakit_cursor :enableplayerinput
	launchevent \{type = focus
		target = CAP_container}
endscript

script crib_handle_cap_finish 
	if NOT ($crib_after_cap_return_to_menu = no)
		if gotparam just_placed_object
			<just_placed_object> :rak_getpiecetype
			<just_placed_object> :rak_getpieceindex
			if structurecontains structure ($ConstructionTypes.<piece_type> [<piece_index>]) cost
				obj_cost = (($ConstructionTypes.<piece_type> [<piece_index>].cost))
				raw_index = (($ConstructionTypes.<piece_type> [<piece_index>].raw_index))
				ui_crib_deduct_cash cost = <obj_cost>
				if structurecontains structure = (($cap_bling_object_raw_list) [<raw_index>]) prox_activate
					crib_object_toggle_on_off force_on object = <just_placed_object>
					crib_update_av
				endif
			endif
		endif
		bling = ($crib_after_cap_return_to_menu = placed_bling)
		change crib_after_cap_return_to_menu = no
		stoprendering
		do_actual_unpause
		wait 5 gameframes ignoreslomo
		do_actual_pause
		startrendering
		if (<bling>)
			ui_change_state state = UIstate_Crib_Purchase
		else
			ui_change_state state = UIstate_Crib_Main
		endif
		Do_MenuFx fxparam = ($goal_ui_scheme.screen_fx)
		restore_start_key_binding
	endif
endscript

script crib_clear_crib 
	cap_delete_all_pieces \{do_callbacks
		commit
		refund_cash}
endscript

script crib_use_big_ticket_item item = none
	found = 0
	getarraysize ($crib_bigticket_list)
	<i> = 0
	begin
	bigticket_item = (($crib_bigticket_list) [<i>])
	if (<bigticket_item> = <item>)
		changenodeflag <bigticket_item> 1
		found = 1
	else
		changenodeflag <bigticket_item> 0
	endif
	i = (<i> + 1)
	repeat <array_size>
	if (<found> = 1)
		if gotparam preview
			bigticket_item_params = (($crib_bigticket_params).<item>)
			killskatercamanim all
			unpause_game_and_destroy_pause_menu
			skater :TeleportSkaterToNode nodename = Z_Crib_TRG_restart_00
			skater :pause
			killspawnedscript name = temporarilydisableinput
			spawnscriptlater temporarilydisableinput params = {time = 1.5 seconds}
			playigccam {
				pos = (<bigticket_item_params>.cam_pos)
				quat = (<bigticket_item_params>.cam_quat)
				fov = 72.0
				time = 1.5
				name = crib_cam
			}
			wait 1.5 seconds ignoreslomo
			do_actual_pause <...>
		endif
	endif
endscript

script crib_set_theme \{block_scripts = 1}
	crib_kill_bink_immediate
	setpakmancurrentblock map = crib_themes pak = <theme> block_scripts = <block_scripts>
	updatepakmanvisibility \{map = crib_themes}
	crib_update_av
endscript

script Crib_Themes_PakMan_Init 
	zones_pakman_init <...>
endscript

script Crib_Themes_PakMan_DeInit 
	zones_pakman_deinit <...>
endscript

script crib_change_video 
	new_settings = ($crib_current_settings)
	change crib_current_settings = {<new_settings> video = <video>}
	change crib_current_video = <video>
	crib_save_settings
	if gotparam \{play}
		crib_update_av
	endif
endscript

script crib_change_music 
	new_settings = ($crib_current_settings)
	change crib_current_settings = {<new_settings> music = <music>}
	change crib_current_music = <music>
	crib_save_settings
	crib_update_av
endscript
crib_bink_playing = 0

script crib_play_bink 
	if NOT IsInCrib
		return
	endif
	if ($is_changing_levels = 1)
		printf 'Ignoring crib_play_bink because of changing levels'
		return
	endif
	if ($video_editor_in_video_editor = 1)
		printf 'Ignoring crib_play_bink because we\'re in the video editor'
		return
	endif
	printf 'crib_play_bink'
	if NOT gotparam bink_params
		video_name = ($crib_current_video)
		bink_params = ((($crib_video_params).<video_name>).bink_params)
	endif
	if scriptisrunning crib_play_bink_delay
		return
	endif
	crib_kill_bink
	killspawnedscript name = crib_play_bink_spawned
	spawnscriptnow crib_play_bink_spawned params = {<...>}
endscript

script crib_is_any_movie_playing 
	if ismovieplaying \{textureslot = 0}
		return \{true}
	endif
	if ismovieplaying \{textureslot = 1}
		return \{true}
	endif
	return \{false}
endscript

script crib_wait_for_movies 
	if crib_is_any_movie_playing
		begin
		if NOT crib_is_any_movie_playing
			break
		endif
		wait \{1
			gameframe}
		repeat
	endif
endscript

script crib_play_bink_spawned 
	printf 'crib_play_bink_spawned - start'
	wait_for_script_to_finish name = crib_kill_bink_spawned
	wait_for_script_to_finish name = crib_kill_bink_delay
	if crib_get_object_which_is_turned_on type = television
		if structurecontains structure = <bink_params> movie
			if ($crib_bink_playing = 0)
				wait 1.0 seconds ignoreslomo
				crib_wait_for_movies
				change crib_bink_playing = 1
				mempushcontext topdownheap
				createviewport {
					id = z_crib_video_viewport
					priority = 1
					style = cutscene_movie_surface
				}
				mempopcontext
				setactivecamera id = skatercam0 viewport = z_crib_video_viewport
				getarraysize ($crib_model_bink_list)
				i = 0
				begin
				crib_model_bink = (($crib_model_bink_list) [<i>])
				formattext checksumname = tex_ovr_id 'bink_crib_tex_ovr_%d' d = <i>
				if isassetloaded name = (<crib_model_bink>.texdict)
					mempushcontext topdownheap
					createviewporttextureoverride {
						id = <tex_ovr_id>
						viewportid = z_crib_video_viewport
						<crib_model_bink>
					}
					mempopcontext
				endif
				i = (<i> + 1)
				repeat <array_size>
				pushassetcontext context = (($crib_theme_bink).context)
				if isassetloaded name = (($crib_theme_bink).texdict)
					mempushcontext topdownheap
					createviewporttextureoverride {
						id = bink_crib_theme_tex_ovr
						viewportid = z_crib_video_viewport
						($crib_theme_bink)
					}
					mempopcontext
				endif
				popassetcontext
				printf 'crib_play_bink_spawned - play'
				playmovie {
					textureslot = 1
					texturepri = 0
					viewport = z_crib_video_viewport
					<bink_params>
				}
				spawnscriptnow crib_play_bink_delay params = {delay = <delay>}
			endif
		endif
	endif
	printf 'crib_play_bink_spawned - end'
endscript

script crib_play_bink_delay 
	printf \{'crib_play_bink_delay - start'}
	wait \{4
		gameframes}
	printf \{'crib_play_bink_delay - end'}
endscript

script crib_kill_bink 
	if NOT IsInCrib
		return
	endif
	printf \{'crib_kill_bink'}
	killspawnedscript \{name = crib_play_bink_spawned}
	if scriptisrunning \{crib_kill_bink_delay}
		return
	endif
	if scriptisrunning \{crib_kill_bink_spawned}
		return
	endif
	spawnscriptnow crib_kill_bink_spawned params = {<...>}
endscript

script crib_kill_bink_spawned 
	printf \{'crib_kill_bink_spawned'}
	wait_for_script_to_finish \{name = crib_play_bink_delay}
	if crib_kill_bink_immediate
		spawnscriptnow crib_kill_bink_delay params = {delay = <delay>}
	endif
endscript

script crib_kill_bink_immediate 
	if NOT IsInCrib
		return false
	endif
	if ($crib_bink_playing = 1)
		if ismovieplaying textureslot = 1
			printf 'crib_kill_bink - Killed movie'
			killmovie textureslot = 1 nowait
			Killed = 1
		endif
		getarraysize ($crib_model_bink_list)
		i = 0
		begin
		crib_model_bink = (($crib_model_bink_list) [<i>])
		formattext checksumname = tex_ovr_id 'bink_crib_tex_ovr_%d' d = <i>
		if isassetloaded name = (<crib_model_bink>.texdict)
			destroyviewporttextureoverride id = <tex_ovr_id>
		endif
		i = (<i> + 1)
		repeat <array_size>
		pushassetcontext context = (($crib_theme_bink).context)
		if isassetloaded name = (($crib_theme_bink).texdict)
			destroyviewporttextureoverride id = bink_crib_theme_tex_ovr
		endif
		popassetcontext
		if viewportexists id = z_crib_video_viewport
			destroyviewport id = z_crib_video_viewport
			Killed = 1
		endif
		change crib_bink_playing = 0
		if NOT gotparam Killed
			scriptassert 'Something is wrong here'
		endif
		return true
	endif
	return false
endscript

script crib_kill_bink_delay 
	printf \{'crib_kill_bink_delay - start'}
	wait \{4
		gameframes}
	printf \{'crib_kill_bink_delay - end'}
endscript

script crib_wait_for_freeing_binks 
	wait_for_script_to_finish \{name = crib_kill_bink_spawned}
	wait_for_script_to_finish \{name = crib_kill_bink_delay}
endscript

script crib_obj_prox_created 
	printf \{'crib_obj_prox_created'}
	obj_getid
	setup_ped_speech {
		ped_id = <objid>
		accept_text = "\\m5 Control"
		activation_script = crib_obj_prox_control
		activation_script_params = {type = <type> object = <objid> index = <index>}
		inner_radius = 2
		outer_radius = 2
		dont_deactivate_goals
	}
endscript

script crib_obj_prox_control 
	printf 'crib_obj_prox_control'
	extra_button = []
	skater :pause
	done_button = [{
			text = "Done"
			pad_choose_script = crib_obj_prox_done
			pad_choose_params = {object = <object>}
		}]
	<object> :rak_getpiecetype
	<object> :rak_getpieceindex
	obj_name = (($ConstructionTypes.<piece_type> [<piece_index>].name_string))
	skater :obj_pausesounds
	skater :vibrate off
	if (<type> = television)
		if crib_object_is_on object = <object>
			toggle_text = "Turn off"
			if structurecontains structure = ($crib_current_settings) zone
				if ((($crib_current_settings).zone) = z_crib_Theater)
					erase_off_button = 1
				endif
			endif
			extra_button = [{
					text = "Choose Video"
					pad_choose_script = crib_video_item_choose
				}]
		else
			toggle_text = "Turn on"
		endif
		buttons = [{
				text = <toggle_text>
				pad_choose_script = crib_video_item_toggle
				pad_choose_params = {object = <object> index = <index>}
			}]
		if gotparam erase_off_button
			buttons = []
		endif
		buttons = (<buttons> + <extra_button>)
		buttons = (<buttons> + <done_button>)
		create_dialog_box {
			title = "Control Video"
			text = <obj_name>
			buttons = <buttons>
			no_helper_text
		}
	elseif (<type> = stereo)
		if crib_object_is_on object = <object>
			toggle_text = "Turn off"
			extra_button = [{
					text = "Choose Music"
					pad_choose_script = crib_music_item_choose
				}]
		else
			toggle_text = "Turn on"
		endif
		buttons = [{
				text = <toggle_text>
				pad_choose_script = crib_music_item_toggle
				pad_choose_params = {object = <object> index = <index>}
			}]
		buttons = (<buttons> + <extra_button>)
		buttons = (<buttons> + <done_button>)
		create_dialog_box {
			title = "Control Music"
			text = <obj_name>
			buttons = <buttons>
			no_helper_text
		}
	endif
endscript

script crib_music_item_toggle 
	printf \{'crib_music_item_toggle'}
	destroy_dialog_box
	crib_object_toggle_on_off object = <object>
	crib_obj_prox_control type = stereo object = <object> index = <index>
	cap_commit_changes
	crib_update_av \{toggled_manually = 1}
endscript

script crib_video_item_toggle 
	printf \{'crib_video_item_toggle'}
	destroy_dialog_box
	crib_object_toggle_on_off object = <object>
	crib_obj_prox_control type = television object = <object> index = <index>
	cap_commit_changes
	crib_update_av \{toggled_manually = 1}
endscript

script crib_check_prox 
	rak_getpiecetype
	rak_getpieceindex
	if structurecontains structure = ($ConstructionTypes.<piece_type> [<piece_index>]) raw_index
		raw_index = (($ConstructionTypes.<piece_type> [<piece_index>].raw_index))
		if structurecontains structure = (($cap_bling_object_raw_list) [<raw_index>]) prox_activate
			if (((($cap_bling_object_raw_list) [<raw_index>]).prox_activate) = <type>)
				<src> = (($cap_bling_object_raw_list) [<raw_index>])
				formattext checksumname = object_name '%s' s = (<src>.model)
				return true object_name = <object_name>
			endif
		endif
	endif
	return false
endscript

script crib_object_is_on 
	if NOT gotparam \{no_tv_handling}
		if crib_get_object_which_is_turned_on \{type = television}
			if <object> :crib_check_prox type = television
				return \{true}
			endif
		elseif crib_get_object_which_is_turned_on \{type = stereo}
			if <object> :crib_check_prox type = stereo
				return \{true}
			endif
		endif
	endif
	<object> :getsingletag extra_data
	if gotparam \{extra_data}
		if structurecontains structure = <extra_data> ison
			return \{true}
		endif
	endif
	return \{false}
endscript

script crib_object_set_state 
	<object> :getsingletag extra_data
	if gotparam \{on}
		if NOT crib_object_is_on object = <object> no_tv_handling
			extra_data = {<extra_data> ison = 1}
		endif
	elseif crib_object_is_on object = <object> no_tv_handling
		removecomponent \{name = ison
			structure_name = extra_data}
	endif
	<object> :settags extra_data = <extra_data>
endscript

script crib_object_toggle_on_off 
	if gotparam \{force_on}
		on = 1
	elseif gotparam \{force_off}
		on = 0
	elseif crib_object_is_on object = <object>
		on = 0
	else
		on = 1
	endif
	if (<on> = 1)
		crib_turn_all_objects_off
		crib_object_set_state object = <object> on
	else
		crib_turn_all_objects_off
	endif
endscript

script crib_turn_all_objects_off 
	i = 0
	begin
	name = (RigConstructedObject + <i>)
	if compositeobjectexists <name>
		<name> :rak_getpiecetype
		<name> :rak_getpieceindex
		if structurecontains structure = ($ConstructionTypes.<piece_type> [<piece_index>]) raw_index
			raw_index = (($ConstructionTypes.<piece_type> [<piece_index>].raw_index))
			if structurecontains structure = (($cap_bling_object_raw_list) [<raw_index>]) prox_activate
				crib_object_set_state object = <name> off
			endif
		endif
	endif
	i = (<i> + 1)
	repeat ($cap_max_pieces_allowed)
endscript

script crib_get_object_which_is_turned_on 
	i = 0
	begin
	name = (RigConstructedObject + <i>)
	if compositeobjectexists <name>
		if <name> :crib_check_prox type = <type>
			if crib_object_is_on object = <name> no_tv_handling
				return true object_on = <name> object_on_name = <object_name>
			endif
		endif
	endif
	i = (<i> + 1)
	repeat ($cap_max_pieces_allowed)
	if NOT gotparam prevent_recurse
		if (<type> = television)
			if structurecontains structure = ($crib_current_settings) zone
				if ((($crib_current_settings).zone) = z_crib_Theater)
					if NOT crib_get_object_which_is_turned_on type = stereo prevent_recurse
						return true
					endif
				endif
			endif
		endif
	endif
	return false
endscript

script crib_music_item_choose 
	printf \{'crib_music_item_choose'}
	destroy_dialog_box
	change \{ui_music_choose_ui_back_state = uistate_gameplay}
	ui_change_state \{state = UIstate_Crib_Music}
endscript

script crib_video_item_choose 
	printf \{'crib_video_item_choose'}
	destroy_dialog_box
	change \{ui_video_choose_ui_back_state = uistate_gameplay}
	ui_change_state \{state = UIstate_Crib_Video}
endscript

script crib_obj_prox_done 
	printf \{'crib_obj_prox_done'}
	destroy_dialog_box
	skater :unpause
	skater :obj_pausesounds \{off}
endscript

script crib_start_music 
	if NOT IsInCrib
		return false
	endif
	begin
	if ($is_changing_levels = 0)
		break
	endif
	wait 1 gameframe
	repeat
	if NOT crib_get_object_which_is_turned_on type = stereo
		printf "Nothing turned on... no music"
		crib_music_update new_music = none toggled_manually = <toggled_manually>
	else
		printf "$crib_current_music = %c" c = $crib_current_music
		crib_music_update new_music = ($crib_current_music) toggled_manually = <toggled_manually>
	endif
endscript
crib_music_play_state = playlist
crib_music_dsp_applied = none
crib_music_is_fading = 0

script crib_music_update 
	printf "crib_music_update"
	if ($is_changing_levels = 1 || $crib_music_is_fading = 1)
		return
	endif
	if NOT ($crib_music_play_state = <new_music>)
		if (<new_music> = playlist)
			if NOT ($crib_music_play_state = playlist)
				crib_finish_music
			endif
		else
			if NOT gotparam toggled_manually
				if NOT GetNowPlayingTrackInfo
					printf 'crib_music_update - Eeek, can\'t mess with playlist yet'
					return
				endif
			endif
			if NOT ($crib_music_play_state = none)
				if ($entering_crib_now = 1)
					change crib_music_is_fading = 1
					pushsoundbussparams
					setsoundbussparams playlist = {vol = -100} time = 2.0
					wait 2 seconds
					PlaylistStop
					popsoundbussparams
					change entering_crib_now = 0
					change crib_music_is_fading = 0
				else
					PlaylistStop
				endif
			endif
			if NOT (<new_music> = none)
				tracks = [none]
				setarrayelement arrayname = tracks index = 0 newvalue = <new_music>
				RemovePlaylist name = crib_looping_track
				CreatePlaylist {
					tracks = <tracks>
					repeatplay
					name = crib_looping_track
				}
				PlaylistPlay name = crib_looping_track
			endif
		endif
		change crib_music_play_state = <new_music>
	endif
	if NOT (<new_music> = none)
		crib_stop_music_dsp_fx
		if crib_get_object_which_is_turned_on type = stereo
			if NOT (<object_on_name> = ($crib_music_dsp_applied))
				if structurecontains structure = ($crib_dsp_effects) <object_on_name>
					dsp = (($crib_dsp_effects).<object_on_name>)
					printf 'Using DSP...'
					printstruct {<dsp>}
					createsoundbusseffects playlist = {<dsp>}
					change crib_music_dsp_applied = <object_on_name>
				endif
			endif
		endif
	endif
endscript

script crib_stop_music_dsp_fx 
	if NOT ($crib_music_dsp_applied = none)
		destroysoundbusseffects \{playlist = {
				all
			}}
		change \{crib_music_dsp_applied = none}
	endif
endscript

script crib_finish_music 
	if NOT IsInCrib
		return \{false}
	endif
	crib_stop_music_dsp_fx
	if ($crib_music_is_fading = 1)
		popsoundbussparams
		change \{crib_music_is_fading = 0}
	endif
	if NOT ($crib_music_play_state = playlist)
		if NOT ($crib_music_play_state = none)
			PlaylistStop
			if NOT ($crib_music_play_state = playlist)
				RemovePlaylist \{name = crib_looping_track}
			endif
		endif
		PlaylistPlay \{name = master}
	endif
	change \{crib_music_play_state = playlist}
endscript
entering_crib_now = 0

script start_up_crib 
	if IsInCrib
		change \{entering_crib_now = 1}
		begin
		if ($is_changing_levels = 0)
			break
		endif
		wait \{1
			gameframe}
		repeat
		crib_update_av
	endif
endscript

script crib_update_av 
	if ($video_editor_in_video_editor = 0)
		if NOT gman_hasactivegoals
			crib_play_bink
		elseif gotparam \{force_bink_on}
			crib_play_bink
		endif
	endif
	if ($is_changing_levels = 0)
		crib_start_music toggled_manually = <toggled_manually>
	endif
endscript

script crib_print_pieces 
	WriteRigAKitPiecesToArray \{array_name = pieces}
	printstruct <pieces>
endscript
crib_default_pieces = [
	{
		piece_type = Ramps
		piece_index = 0
		pos = (393.98764, -0.078196004, -512.478)
		quat = (0.0, -0.707088, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (391.99042, -0.078196004, -512.4775)
		quat = (0.0, -0.707088, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (389.99323, -0.078196004, -512.47754)
		quat = (0.0, -0.707088, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (387.996, -0.078196004, -512.47754)
		quat = (0.0, -0.707088, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (388.0264, -0.078196004, -513.82367)
		quat = (0.0, 0.70701605, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (390.02362, -0.078196004, -513.82367)
		quat = (0.0, 0.70701605, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (392.0208, -0.078196004, -513.8236)
		quat = (0.0, 0.70701605, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (394.01807, -0.078196004, -513.82355)
		quat = (0.0, 0.70701605, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (393.58075, -0.078196004, -533.1567)
		quat = (0.0, -0.70712405, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (391.58347, -0.078196004, -533.1564)
		quat = (0.0, -0.70712405, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (389.58624, -0.078196004, -533.15625)
		quat = (0.0, -0.70712405, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (387.58896, -0.078196004, -533.1561)
		quat = (0.0, -0.70712405, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (387.61942, -0.078196004, -534.50214)
		quat = (0.0, 0.707053, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (389.61667, -0.078196004, -534.50226)
		quat = (0.0, 0.707053, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (391.6139, -0.078196004, -534.5024)
		quat = (0.0, 0.707053, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (393.61115, -0.078196004, -534.5025)
		quat = (0.0, 0.707053, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (390.8175, -0.053196, -528.691)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (391.03473, -0.053196, -517.58136)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = special
		piece_index = 0
		pos = (377.59302, -0.078196004, -529.7727)
		quat = (0.0, -2.7E-05, 0.0)
		cam_quat = (-0.112658, 0.33249703, 0.040041998)
		cam_zoom = 85.0
		cam_target_offset = 8.799995
		cam_target_scale = 3.1999989
	}
	{
		piece_type = Game_Pieces
		piece_index = 44
		pos = (382.3091, -0.053196, -506.84753)
		quat = (0.0, -5.5E-05, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 44
		pos = (382.40665, -0.053196, -544.4339)
		quat = (0.0, -5.5E-05, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (382.33505, -0.078196004, -529.5328)
		quat = (0.0, 0.70700604, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (382.4145, -0.078196004, -517.6253)
		quat = (0.0, -0.70706505, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 55
		pos = (382.4358, -0.053196, -523.6024)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 43
		pos = (382.36755, -0.053196, -523.5808)
		quat = (0.0, -0.70704204, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (383.0373, -0.053196, -560.6941)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (370.71918, -0.053196, -509.33755)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (362.91998, -0.053196, -509.33218)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (340.45703, -0.053196, -556.965)
		quat = (0.0, 0.707047, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (420.91684, -0.053196, -554.6351)
		quat = (0.0, 0.707047, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (396.17432, -0.053196, -569.50037)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (388.37698, -0.053196, -569.5061)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (371.2708, -0.053196, -569.3873)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 61
		pos = (363.4717, -0.053196, -569.393)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 42
		pos = (362.73273, -0.053196, -536.775)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 42
		pos = (372.94022, -0.053196, -536.92676)
		quat = (0.0, 1.0, 0.0)
	}
	{
		piece_type = Ramps
		piece_index = 0
		pos = (368.0558, -0.078196004, -527.9852)
		quat = (0.0, 0.705723, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 62
		pos = (396.40833, -0.053196, -557.44635)
		quat = (0.0, -0.007093, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 62
		pos = (388.60812, -0.053196, -557.55615)
		quat = (0.0, -0.007093, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 62
		pos = (369.86688, -0.053196, -557.83105)
		quat = (0.0, -0.007093, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 62
		pos = (377.6411, -0.053196, -557.7257)
		quat = (0.0, -0.0070940005, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 55
		pos = (354.8544, -0.053196, -525.11945)
		quat = (0.0, 0.709439, 0.0)
	}
	{
		piece_type = Game_Pieces
		piece_index = 55
		pos = (407.85126, -0.053196, -525.06525)
		quat = (0.0, 0.709459, 0.0)
	}
]

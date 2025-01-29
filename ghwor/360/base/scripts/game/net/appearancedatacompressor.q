g_appearance_data_compressor_canned_struct_bones1 = {
	nosetipwidth = 1.0
	nosetipangle = 0.5
	nosenostrilheight = 1.0
	noseangle = 0.5
	nosesize = 0.4
	nosewidth = 0.4
	nosebridge = 0.2
	lowerlipthickness = 1.0
	mouthscale = 0.2
	mouthposition = 0.767
	noseposition = 1.0
	browdepth = 0.095000006
	eyebrowangle = 1.0
	browposition = 0.0
	eyebrowdistance = -1.0
	jawprominence = 0.3
	jawshape = 0.5
	facefullness = 0.3
	eyeshape = 1.0
	eyecornershape = 0.66700006
	eyeangle = 0.761
	eyedistance = -0.214
	eyescale = 0.414
	nosetiplength = 0.2
	noselength = 0.467
	mouthdepth = 0.0
	mouthangle = 0.9
	chinprominence = 0.2
	chinheight = 0.2
	chinangle = 0.4
	lipshapeupper = 0.3
	upperlipthickness = 0.54800004
	lipshapelower = 0.0
}
g_appearance_data_compressor_canned_struct_bones2 = {
	chinprominence = 1.0
	lowerlipthickness = 1.0
	eyeposition = 1.0
	facefullness = 1.0
	jawprominence = 1.0
	jawshape = 1.0
	chinwidth = 1.0
	chinheight = 1.0
	chinangle = 1.0
	chincleft = 1.0
	cheekboneprominence = 1.0
	cheekbonedepth = 1.0
	earprominence = 1.0
	earsize = 1.0
	earshape = 1.0
	eartip = 1.0
	earlobesize = 1.0
	nosetipheight = 1.0
	nosetipwidth = 1.0
	nosebridge = 1.0
	nosenostrilangle = 1.0
	nosenostrilheight = 1.0
	nosenostrilsize = 1.0
	nosetipangle = 1.0
	nosetiplength = 1.0
	noseposition = 0.0
	noseangle = 1.0
	noselength = 1.0
	nosewidth = 1.0
	nosesize = 1.0
	mouthscale = 1.0
	mouthangle = 1.0
	mouthdepth = 1.0
	mouthposition = 0.0
	lipshapeupper = 1.0
	lipshapelower = 1.0
	upperlipthickness = 1.0
	eyescale = 1.0
	eyeshape = 1.0
	eyecornershape = 1.0
	eyeangle = 1.0
	eyedistance = 1.0
	eyebrowsize = 1.0
	eyebrowangle = 1.0
	eyebrowdistance = 1.0
	browposition = 1.0
	browdepth = 1.0
}
g_appearance_data_compressor_canned_struct_bones3 = {
	nosetiplength = 0.0
	noseposition = 1.0
	eyeshape = 1.0
	eyebrowdistance = -1.0
	browposition = 0.0
	facefullness = 1.0
	jawprominence = 0.0
	jawshape = 0.0
	chinprominence = 0.0
	chinwidth = 0.0
	chinheight = 0.0
	chinangle = 0.0
	cheekboneprominence = 0.0
	waddle = 0.0
	earsize = 1.0
	earshape = 0.0
	earlobesize = 1.0
	earlobelength = 0.0
	nosesize = 1.0
	nosewidth = 0.0
	noselength = 0.0
	noseangle = 0.0
	nosetipheight = 0.0
	nosetipwidth = 0.0
	nosetipangle = 0.0
	nosenostrilsize = 1.0
	nosenostrilheight = 0.0
	nosenostrilangle = 0.0
	nosebridge = 0.0
	lowerlipthickness = 1.0
	upperlipthickness = 1.0
	lipshapelower = 0.0
	lipshapeupper = 0.0
	mouthposition = 1.0
	mouthdepth = 0.0
	mouthangle = 0.0
	mouthscale = 1.0
	eyescale = 1.0
	eyecornershape = 0.0
	eyeangle = 0.0
	eyeposition = -1.0
	eyedistance = -1.0
	eyebrowsize = 1.0
	eyebrowangle = 0.0
	browdepth = 0.0
}
g_appearance_data_compressor_static_canned_structs_array = [
	{
		Name = bones
		struct = g_appearance_data_compressor_canned_struct_bones1
	}
	{
		Name = bones
		struct = g_appearance_data_compressor_canned_struct_bones2
	}
	{
		Name = bones
		struct = g_appearance_data_compressor_canned_struct_bones3
	}
	{
		Name = bones2
		struct = {
			nosetipwidth = 1.0
			nosetipangle = 0.5
			nosenostrilheight = 1.0
			noseangle = 0.5
			nosesize = 0.4
			nosewidth = 0.4
			nosebridge = 0.2
			lowerlipthickness = 1.0
			mouthscale = 0.2
			mouthposition = 0.767
			noseposition = 1.0
			browdepth = 0.095000006
			eyebrowangle = 1.0
			browposition = 0.0
			eyebrowdistance = -1.0
			jawprominence = 0.3
			jawshape = 0.5
			facefullness = 0.3
			eyeshape = 1.0
			eyecornershape = 0.66700006
			eyeangle = 0.761
			eyedistance = -0.214
			eyescale = 0.414
			nosetiplength = 0.2
			noselength = 0.467
			mouthdepth = 0.0
			mouthangle = 0.9
			chinprominence = 0.2
			chinheight = 0.2
			chinangle = 0.4
			lipshapeupper = 0.3
			upperlipthickness = 0.54800004
			lipshapelower = 0.0
		}
	}
]

script addump 
	printf \{qs(0x3a6a4717)}
	getnumplayersingame \{local
		out = X}
	printf qs(0x087c76bf) d = <X>
	if (<X> > 0)
		getfirstplayer \{local}
		begin
		if playerinfoequals <Player> is_local_client = 1
			getplayerinfo <Player> controller
			if (<controller> = $primary_controller)
				if iscontrollerpluggedin controller = <controller>
					printf \{qs(0x435274c7)}
					fill_local_appearance_data player_number = <Player>
					printf qs(0x79dc10c1) s = <Player>
					printstruct <...>
					printf \{qs(0x435274c7)}
				endif
			endif
		endif
		repeat <X>
	endif
	printf \{qs(0xcca6e228)}
endscript

script adcsetuptables 
	appearancedatacompressor \{func = setuptables}
endscript

script adcteardowntables 
	appearancedatacompressor \{func = teardowntables}
endscript

script adcnormal 
	appearancedatacompressor \{func = setmode
		mode = Normal}
endscript

script adcoldway 
	appearancedatacompressor \{func = setmode
		mode = oldway}
endscript

script adcbroken 
	appearancedatacompressor \{func = setmode
		mode = broken}
endscript

script adcplayerdump 
	getnumplayersingame
	printf qs(0xf813b65f) d = <num_players>
	formatText TextName = msgtext 'adcplayerdump: There are %d players in the game.' d = <num_players> DontAssertForChecksums
	appearancedatacompressor func = logmessage msg = <msgtext>
	if (<num_players> > 0)
		getfirstplayer
		begin
		getplayerinfo <Player> is_local_client
		printf qs(0x381e4b6e) a = <Player> b = <is_local_client>
		formatText TextName = msgtext 'adcplayerdump: Player num=%a local=%b' a = <Player> b = <is_local_client> DontAssertForChecksums
		appearancedatacompressor func = logmessage msg = <msgtext>
		getnextplayer Player = <Player>
		repeat <num_players>
	endif
endscript

script adcwipelog 
	appearancedatacompressor \{func = wipelog}
endscript

script adcdebugoverlay 
	spawnscript \{adcdebugoverlay_create}
endscript

script adcdebugoverlay_create 
	adcdebugoverlay_destroy
	CreateScreenElement \{Type = ContainerElement
		parent = root_window
		Pos = (50.0, 30.0)
		just = [
			left
			top
		]
		id = adcdebugoverlay_root_id}
	CreateScreenElement \{Type = SpriteElement
		parent = adcdebugoverlay_root_id
		texture = white
		dims = (1180.0, 660.0)
		rgba = [
			0
			0
			0
			0
		]
		Pos = (590.0, 330.0)
		z_priority = 10000
		id = adcdebugoverlay_background_id}
	CreateScreenElement \{Type = TextElement
		parent = adcdebugoverlay_root_id
		font = fontgrid_text_a1
		text = qs(0x270d3b5c)
		Scale = (0.5, 0.5)
		just = [
			left
			top
		]
		Pos = (0.0, 50.0)
		z_priority = 10001
		rgba = [
			255
			255
			255
			255
		]
		id = adcdebugoverlay_title_id}
	CreateScreenElement \{Type = TextElement
		parent = adcdebugoverlay_root_id
		font = fontgrid_text_a1
		text = qs(0x00000000)
		Scale = (0.5, 0.5)
		just = [
			left
			top
		]
		Pos = (0.0, 100.0)
		dims = (1180.0, 660.0)
		z_priority = 10001
		rgba = [
			255
			255
			255
			255
		]
		id = adcdebugoverlay_text1_id
		single_line = FALSE}
	RunScriptOnScreenElement \{id = adcdebugoverlay_root_id
		adcdebugoverlay_task}
	appearancedatacompressor \{func = overlayenable}
endscript

script adcdebugoverlay_destroy 
	if ScreenElementExists \{id = adcdebugoverlay_root_id}
		DestroyScreenElement \{id = adcdebugoverlay_root_id}
	endif
	appearancedatacompressor \{func = overlaydisable}
endscript

script adcdebugoverlay_loop 
	begin
	if ScreenElementExists \{id = adcdebugoverlay_root_id}
		adcdebugoverlay_root_id :se_setprops \{alpha = 1.0
			time = 0.5}
		if appearancedatacompressor \{func = getdebugoverlayinfo}
		else
			<text> = qs(0x00000000)
		endif
		if NOT GotParam \{text}
			<text> = qs(0x00000000)
		endif
		if ScreenElementExists \{id = adcdebugoverlay_text1_id}
			adcdebugoverlay_text1_id :se_setprops text = <text>
		endif
	endif
	Wait \{0.1
		Seconds}
	repeat
endscript

script adcdebugoverlay_task 
	adcdebugoverlay_loop
	adcdebugoverlay_destroy
endscript

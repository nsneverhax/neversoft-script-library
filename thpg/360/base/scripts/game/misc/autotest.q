LevelTestScripts = [
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = load_z_mainmenu
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = load_z_bedroom
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_FDR
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_Slums
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_Bell
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_Love
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = load_z_crib
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_BCity
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = load_z_harbor
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_Lansdowne
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_Monuments
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_Museums
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_Museum_Int
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_PB_Bridge
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_BW_Bridge
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_WP_Bridge
		}
	}
	{
		TestScript = Generic_TestLevel
		TestParams = {
			level = Load_Z_Secret
		}
	}
]

script Generic_TestLevel 
	requireparams \{[
			level
		]
		all}
	change_level level = <level>
	wait \{5
		gameframes}
endscript

script CleanupAnyMenus 
	wait \{10
		seconds}
endscript

script TestLevels 
	DestroyAndRecreateMessageContainer
	begin
	getnextarrayelement $LevelTestScripts index = <index>
	if gotparam \{element}
		(<element>.TestScript) (<element>.TestParams)
	else
		break
	endif
	wait \{1
		gameframes}
	repeat
endscript

script KenStyle 
	KenStylePos = (320.0, 405.0)
	setprops scale = 2 pos = <KenStylePos> just = [center center] rgba = [0 , 128 , 0 , 128]
	domorph time = 0 pos = <KenStylePos> scale = 0
	domorph time = 0.2 pos = <KenStylePos> scale = 1.2
	wait \{2
		seconds}
	launchevent \{type = KenStyleMessageDied}
	die
endscript

script DestroyAndRecreateMessageContainer 
	if objectexists \{id = TestLevelMessagesContainer}
		destroyscreenelement \{id = TestLevelMessagesContainer}
	endif
	setscreenelementlock \{id = root_window
		off}
	createscreenelement \{id = TestLevelMessagesContainer
		parent = root_window
		type = containerelement
		pos = (320.0, 240.0)
		dims = (640.0, 480.0)}
endscript

script DisplayTestMessage 
	setscreenelementlock \{id = TestLevelMessagesContainer
		off}
	createscreenelement {
		parent = TestLevelMessagesContainer
		type = textelement
		font = text_a1
		text = <text>
	}
	runscriptonscreenelement id = <id> KenStyle
	waitforevent \{type = KenStyleMessageDied}
endscript

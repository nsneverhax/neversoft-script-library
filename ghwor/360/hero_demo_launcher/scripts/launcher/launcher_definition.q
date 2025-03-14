
script BX_SetLauncherGamesArray 
	change \{Launcher_Games_Array = [
			gh6
			DJHero2
		]}
	getarraysize \{$Launcher_Games_Array}
	i = 0
	begin
	curr_game = (($Launcher_Games_Array) [<i>])
	change structurename = <curr_game> demo_index = <i>
	i = (<i> + 1)
	repeat <array_size>
endscript
BX_In_Attract_Mode = 0
BX_Attract_Interrupted = 0
BX_Attract_Enabled = 1
BX_Default_Attract_Time = 120
Launcher_Games_Array = [
]
gh6 = {
	ContentType = demo
	GameBox = BX_GHWoR
	GameVideo = 'gh6'
	esrb = 'ESRB'
	PEGI = 'PEGI'
	artists = [
		qs(0x9cf2249b)
		qs(0x56bd542a)
		qs(0xb1aa12ed)
		qs(0x3476fa98)
	]
	songs = [
		qs(0x8dd94867)
		qs(0x4e2dd841)
		qs(0x11db7897)
		qs(0x03ac90f0)
	]
	DemoExec = qs(0x923d6f0b)
	GameDescription = qs(0x06ce2d91)
	demo_index = 0
}
DJHero2 = {
	ContentType = demo
	GameBox = BX_DJH2
	GameVideo = 'dj_hero2'
	esrb = 'ESRB_DJ'
	PEGI = 'PEGI'
	artists = [
		qs(0xf0562611)
		qs(0x9f86ecbe)
		qs(0x6c297511)
	]
	songs = [
		qs(0x4ebc095d)
		qs(0xb2af5001)
		qs(0x0c908999)
	]
	DemoExec = qs(0xa4c055f9)
	GameDescription = qs(0x510a0d9f)
	demo_index = 0
}

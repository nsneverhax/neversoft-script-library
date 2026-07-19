
script BX_SetLauncherGamesArray 
	IsGreatestHits
	if (<is_greatest_hits>)
		change \{Launcher_Games_Array = [
				BandHero
				DJHero
				gh5
				GreatestHits
			]}
	else
		change \{Launcher_Games_Array = [
				BandHero
				DJHero
				gh5
				SmashHits
			]}
	endif
	GetArraySize \{$Launcher_Games_Array}
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
SmashHits = {
	ContentType = demo
	GameBox = BX_GHSH
	GameVideo = 'ghsh'
	artists = [
		qs("\LWOLFMOTHER")
		qs(0x8a7005fd)
		qs("\LKISS")
	]
	songs = [
		qs("\LWOMAN")
		qs("\LTAKE ME OUT")
		qs("\LROCK AND ROLL ALL NITE")
	]
	DemoExec = 'FE75796659C843A3962A30C5806060862550BB2C41'
	GameDescription = qs(0x1754aa0d)
	demo_index = 0
}
GreatestHits = {
	ContentType = demo
	GameBox = BX_GHGH
	GameVideo = 'ghgh'
	artists = [
		qs("\LWOLFMOTHER")
		qs(0x8a7005fd)
		qs("\LKISS")
	]
	songs = [
		qs("\LWOMAN")
		qs("\LTAKE ME OUT")
		qs("\LROCK AND ROLL ALL NITE")
	]
	DemoExec = 'FE75796659C843A3962A30C5806060862550BB2C41'
	GameDescription = qs(0x1754aa0d)
	demo_index = 0
}
gh5 = {
	ContentType = demo
	GameBox = BX_GH5
	GameVideo = 'gh5'
	artists = [
		qs(0xd6dbcf52)
		qs("\LBON JOVI")
		qs(0xc26b290d)
		qs(0xa720ebfc)
	]
	songs = [
		qs(0xb89a6053)
		qs(0x81aec25c)
		qs(0x39a61db6)
		qs("\L")
	]
	DemoExec = 'D43225900FC39F9C991B2250F8CB04776F69503641'
	GameDescription = qs(0xfe968ed0)
	demo_index = 0
}
BandHero = {
	ContentType = movie
	GameBox = BX_GHBH
	GameVideo = 'band_hero'
	artists = [
	]
	songs = [
	]
	DemoExec = 'PLACEHOLDER (None)'
	GameDescription = qs(0x6f54860b)
	demo_index = 0
}
DJHero = {
	ContentType = demo
	GameBox = boxart_DJH
	GameVideo = 'dj_hero'
	artists = [
		qs(0x9b06e0d2)
		qs(0x82084335)
		qs(0x021de1da)
		qs(0xa720ebfc)
	]
	songs = [
		qs(0x15257fb9)
		qs(0x1594de37)
		qs(0xacf40d57)
		qs("\L")
	]
	DemoExec = 'BFAE66BC74185FF443C51F9EB459CC81321647EE41'
	GameDescription = qs(0x089c2dc3)
	demo_index = 0
}

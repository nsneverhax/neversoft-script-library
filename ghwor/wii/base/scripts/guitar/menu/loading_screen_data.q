g_loading_screens = [
	{
		text = qs(0xd7865d3e)
		pak = 'pak/loading_screen/loading_screen02.pak'
		texture = loading_backdrop_roadie1
	}
	{
		text = qs(0x2ce29d9c)
		pak = 'pak/loading_screen/loading_screen02.pak'
		texture = loading_backdrop_roadie1
	}
	{
		text = qs(0x779f5cc1)
		pak = 'pak/loading_screen/loading_screen02.pak'
		texture = loading_backdrop_roadie1
	}
	{
		text = qs(0x25381373)
		pak = 'pak/loading_screen/loading_screen02.pak'
		texture = loading_backdrop_roadie1
	}
	{
		text = qs(0x1a16514f)
		pak = 'pak/loading_screen/loading_screen02.pak'
		texture = loading_backdrop_roadie1
	}
	{
		text = qs(0x0fc840a7)
		pak = 'pak/loading_screen/loading_screen02.pak'
		texture = loading_backdrop_roadie1
	}
	{
		text = qs(0x89af3aa8)
		pak = 'pak/loading_screen/loading_screen02.pak'
		texture = loading_backdrop_roadie1
	}
	{
		text = qs(0xeebeadfd)
		pak = 'pak/loading_screen/loading_screen02.pak'
		texture = loading_backdrop_roadie1
	}
	{
		text = qs(0xac251109)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0xfadd74cd)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0xf2714ad1)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0x7097a64b)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0xa7327930)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0xe7cc86bf)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0x5823e995)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0xc03101f9)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0x24f9ab36)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0x6bdee401)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0xe36cd3c3)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0x697e493d)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0xf45c44be)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0x2366efe8)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
	{
		text = qs(0xf2e6e52e)
		pak = 'pak/loading_screen/loading_screen01.pak'
		texture = loading_backdrop_gh6
	}
]
g_current_loading_screen = None

script loading_screen_random 
	GetArraySize ($g_loading_screens)
	GetRandomValue Name = index a = 0 b = (<array_Size> -1) integer
	loading_screen = ($g_loading_screens [<index>])
	if NOT ispakloaded (<loading_screen>.pak) Heap = heap_temporary
		loading_screen_unload
		LoadPak (<loading_screen>.pak) Heap = heap_temporary
		Change g_current_loading_screen = <loading_screen>
	endif
	return loading_screen = <loading_screen>
endscript

script loading_screen_unload 
	if (($g_current_loading_screen) != None)
		UnLoadPak (($g_current_loading_screen).pak)
	endif
endscript

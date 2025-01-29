locked_playlists = [
	{
		Name = qs(0x357d9703)
		playlist = [
		]
	}
	{
		Name = qs(0x8792188e)
		playlist = [
			solonely
			dancingwithmyself
			fame
			underpressure
			americangirl
			hungrylikethewolf
		]
	}
	{
		Name = qs(0x6c45a01f)
		playlist = [
			alltheprettyfaces
			blueorchid
			la
			apunk
			incinerate
			whybother
		]
	}
	{
		Name = qs(0x3052c0ae)
		playlist = [
			solonely
			alltheprettyfaces
			dancingwithmyself
			inmyplace
			exgirlfriend
			incinerate
		]
	}
	{
		Name = qs(0xa6c6381b)
		playlist = [
			exgirlfriend
			lovetoken
			onlyhappywhenitrains
		]
	}
	{
		Name = qs(0x1d261f17)
		playlist = [
			superstition
			duhast
			doyoufeellikewedo
			twentyfirstcentury
		]
	}
	{
		Name = qs(0xf0a3ae80)
		playlist = [
			song2
			apunk
			runnindownadream
			donewitheverything
		]
	}
	{
		Name = qs(0x2bb7d8bb)
		playlist = [
			underpressure
			inthemeantime
			deadbolt
			twominutestomidnight
		]
	}
	{
		Name = qs(0xb8a8beae)
		playlist = [
			twentyfirstcentury
			spiritofradio
			donewitheverything
			brianstorm
		]
	}
	{
		Name = qs(0x6eb098a6)
		playlist = [
			feelgoodinc
			playthatfunkymusic
			fame
			superstition
		]
	}
	{
		Name = qs(0xd35bb394)
		playlist = [
			looksthatkill
			shoutitoutloud
			twominutestomidnight
			sweatingbullets
			yougivelove
		]
	}
	{
		Name = qs(0xf5e60420)
		playlist = [
			dancingwithmyself
			solonely
			lonelyisthenight
			noonetodependon
		]
	}
	{
		Name = qs(0x4cd91d3c)
		playlist = [
			bleedamerican
			americangirl
			wereanamericanband
		]
	}
	{
		Name = qs(0x1d50731a)
		playlist = [
			twominutestomidnight
			twentiethcenturyboy
			twentyfirstcentury
			apunk
			allalongthewatchtower
			alltheprettyfaces
			americangirl
			backround
			bleedamerican
			blueday
			blueorchid
			brianstorm
			bringthenoise
			bulletsbutterfly
			cigarettesweddingbands
			comedown
			dancingwithmyself
			deadbolt
			demon
			disconnected
			doyoufeellikewedo
			donewitheverything
			duhast
			exgirlfriend
			fame
			feelgoodinc
			gammaray
			gratitude
			hungrylikethewolf
			hurtssogood
			inmyplace
			inthemeantime
			incinerate
			jailbreak
			judith
			kryptonite
			la
			lithium
			lonelyisthenight
			looksthatkill
			lustforlife
			maidenmothercrone
			makeitwitchu
			medicate
			mirrorpeople
			nearlylostyou
			nevermissabeat
			noonetodependon
			onebigholiday
			onlyhappywhenitrains
			playthatfunkymusic
			pluginbaby
			ringoffire
			rockshow
			runnindownadream
			saturdaynightsalright
			scatterbrain
			lovetoken
			seven
			sexonfire
			shoutitoutloud
			sixdaysaweek
			smellsliketeenspirit
			sneakout
			solonely
			song2
			sowingseason
			spiritofradio
			steadyasshegoes
			streamlinewoman
			sultansofswing
			superstition
			sweatingbullets
			sympathyforthedevil
			theysay
			underpressure
			wannabeinla
			wereanamericanband
			whatigot
			whybother
			wolflikeme
			womanfromtokyo
			youandme
			yougivelove
			younkfunk
		]
	}
]
custom_playlists = [
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		Name = qs(0x3e8a16b2)
		playlist = [
		]
	}
]

script get_first_empty_custom_playlist_slot 
	GetArraySize \{$custom_playlists}
	<total_size> = <array_Size>
	<i> = 0
	begin
	GetArraySize ((($custom_playlists) [<i>]).playlist)
	if (<array_Size> = 0)
		return true slot = <i>
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return \{FALSE}
endscript

script is_playlist_slot_empty 
	RequireParams \{[
			playlists
			slot
		]
		all}
	ExtendCrc <playlists> '_playlists' out = my_playlists
	GetArraySize ($<my_playlists>)
	<total_size> = <array_Size>
	if NOT ((<slot> >= 0) && (<slot> < <total_size>))
		ScriptAssert \{qs(0xd5938ad4)}
	endif
	GetArraySize ((($<my_playlists>) [<slot>]).playlist)
	if (<array_Size> = 0)
		return \{true}
	else
		return \{FALSE}
	endif
endscript

script does_custom_playlist_exist 
	GetArraySize \{$custom_playlists}
	<total_size> = <array_Size>
	<i> = 0
	begin
	GetArraySize ((($custom_playlists) [<i>]).playlist)
	if (<array_Size> > 0)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return \{FALSE}
endscript

script delete_custom_playlist_slot 
	RequireParams \{[
			slot
		]
		all}
	<playlist_entry> = {
		Name = qs(0x3e8a16b2)
		playlist = []
	}
	SetArrayElement ArrayName = custom_playlists index = <slot> NewValue = <playlist_entry> globalarray
endscript

script fill_auto_save_playlist 
	<locked_entry> = {
		Name = qs(0x357d9703)
		playlist = ($current_playlist)
	}
	SetArrayElement ArrayName = locked_playlists index = 0 NewValue = <locked_entry> globalarray
endscript

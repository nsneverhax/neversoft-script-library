locked_playlists = [
	{
		Name = qs(0xf1d0a283)
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
			whybother
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
			apunk
			noonetodependon
			gratitude
			americangirl
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
		Name = qs(0x3052c0ae)
		playlist = [
			solonely
			alltheprettyfaces
			dancingwithmyself
			inmyplace
			incinerate
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

script num_custom_playlists_that_exist 
	GetArraySize \{$custom_playlists}
	<total_size> = <array_Size>
	<num_custom_playlists> = 0
	<i> = 0
	begin
	GetArraySize ((($custom_playlists) [<i>]).playlist)
	if (<array_Size> > 0)
		<num_custom_playlists> = (<num_custom_playlists> + 1)
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return num_custom_playlists = <num_custom_playlists>
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
		Name = qs(0xf1d0a283)
		playlist = ($current_playlist)
	}
	SetArrayElement ArrayName = locked_playlists index = 0 NewValue = <locked_entry> globalarray
endscript

script validate_locked_playlists 
	GetArraySize ($locked_playlists)
	<total_locked> = <array_Size>
	RemoveParameter \{array_Size}
	if (<total_locked> > 0)
		<i> = 0
		begin
		<playlist_array> = ((($locked_playlists) [<i>]).playlist)
		<dummy_array> = []
		GetArraySize <playlist_array>
		if (<array_Size> > 0)
			<j> = 0
			begin
			if NOT ArrayContains array = <dummy_array> contains = (<playlist_array> [<j>])
				AddArrayElement array = <dummy_array> element = (<playlist_array> [<j>])
				<dummy_array> = <array>
			else
				<playlist_name> = ((($locked_playlists) [<i>]).Name)
				ScriptAssert qs(0x56036377) n = <playlist_name> i = <j>
			endif
			<j> = (<j> + 1)
			repeat <array_Size>
		endif
		<i> = (<i> + 1)
		repeat <total_locked>
	endif
	printf \{qs(0xb9cdada0)}
endscript

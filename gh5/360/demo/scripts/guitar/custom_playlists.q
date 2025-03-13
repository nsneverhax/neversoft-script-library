locked_playlists = [
	{
		name = qs(0xf1d0a283)
		playlist = [
		]
	}
	{
		name = qs(0x8792188e)
		playlist = [
			solonely
			dancingwithmyself
			fame
			underpressure
			hungrylikethewolf
		]
	}
	{
		name = qs(0x6c45a01f)
		playlist = [
			alltheprettyfaces
			blueorchid
			la
			apunk
			whybother
		]
	}
	{
		name = qs(0xa6c6381b)
		playlist = [
			exgirlfriend
			lovetoken
			onlyhappywhenitrains
		]
	}
	{
		name = qs(0x1d261f17)
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
		name = qs(0xf0a3ae80)
		playlist = [
			song2
			apunk
			runnindownadream
			donewitheverything
		]
	}
	{
		name = qs(0x2bb7d8bb)
		playlist = [
			underpressure
			inthemeantime
			deadbolt
			twominutestomidnight
		]
	}
	{
		name = qs(0xb8a8beae)
		playlist = [
			twentyfirstcentury
			spiritofradio
			donewitheverything
			brianstorm
		]
	}
	{
		name = qs(0x6eb098a6)
		playlist = [
			feelgoodinc
			playthatfunkymusic
			fame
			superstition
		]
	}
	{
		name = qs(0xd35bb394)
		playlist = [
			looksthatkill
			shoutitoutloud
			twominutestomidnight
			sweatingbullets
			yougivelove
		]
	}
	{
		name = qs(0xf5e60420)
		playlist = [
			dancingwithmyself
			solonely
			lonelyisthenight
			noonetodependon
		]
	}
	{
		name = qs(0x3052c0ae)
		playlist = [
			solonely
			alltheprettyfaces
			dancingwithmyself
			inmyplace
			incinerate
		]
	}
	{
		name = qs(0x4cd91d3c)
		playlist = [
			bleedamerican
			americangirl
			wereanamericanband
		]
	}
	{
		name = qs(0x1d50731a)
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
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
	{
		name = qs(0x3e8a16b2)
		playlist = [
		]
	}
]

script get_first_empty_custom_playlist_slot 
	getarraysize \{$custom_playlists}
	<total_size> = <array_size>
	<i> = 0
	begin
	getarraysize ((($custom_playlists) [<i>]).playlist)
	if (<array_size> = 0)
		return true slot = <i>
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return \{false}
endscript

script is_playlist_slot_empty 
	requireparams \{[
			playlists
			slot
		]
		all}
	extendcrc <playlists> '_playlists' out = my_playlists
	getarraysize ($<my_playlists>)
	<total_size> = <array_size>
	if NOT ((<slot> >= 0) && (<slot> < <total_size>))
		scriptassert \{qs(0xd5938ad4)}
	endif
	getarraysize ((($<my_playlists>) [<slot>]).playlist)
	if (<array_size> = 0)
		return \{true}
	else
		return \{false}
	endif
endscript

script does_custom_playlist_exist 
	getarraysize \{$custom_playlists}
	<total_size> = <array_size>
	<i> = 0
	begin
	getarraysize ((($custom_playlists) [<i>]).playlist)
	if (<array_size> > 0)
		return \{true}
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return \{false}
endscript

script num_custom_playlists_that_exist 
	getarraysize \{$custom_playlists}
	<total_size> = <array_size>
	<num_custom_playlists> = 0
	<i> = 0
	begin
	getarraysize ((($custom_playlists) [<i>]).playlist)
	if (<array_size> > 0)
		<num_custom_playlists> = (<num_custom_playlists> + 1)
	endif
	<i> = (<i> + 1)
	repeat <total_size>
	return num_custom_playlists = <num_custom_playlists>
endscript

script delete_custom_playlist_slot 
	requireparams \{[
			slot
		]
		all}
	<playlist_entry> = {
		name = qs(0x3e8a16b2)
		playlist = []
	}
	setarrayelement arrayname = custom_playlists index = <slot> newvalue = <playlist_entry> globalarray
endscript

script fill_auto_save_playlist 
	<locked_entry> = {
		name = qs(0xf1d0a283)
		playlist = ($current_playlist)
	}
	setarrayelement arrayname = locked_playlists index = 0 newvalue = <locked_entry> globalarray
endscript

script validate_locked_playlists 
	getarraysize ($locked_playlists)
	<total_locked> = <array_size>
	removeparameter \{array_size}
	if (<total_locked> > 0)
		<i> = 0
		begin
		<playlist_array> = ((($locked_playlists) [<i>]).playlist)
		<dummy_array> = []
		getarraysize <playlist_array>
		if (<array_size> > 0)
			<j> = 0
			begin
			if NOT arraycontains array = <dummy_array> contains = (<playlist_array> [<j>])
				addarrayelement array = <dummy_array> element = (<playlist_array> [<j>])
				<dummy_array> = <array>
			else
				<playlist_name> = ((($locked_playlists) [<i>]).name)
				scriptassert qs(0x56036377) n = <playlist_name> i = <j>
			endif
			<j> = (<j> + 1)
			repeat <array_size>
		endif
		<i> = (<i> + 1)
		repeat <total_locked>
	endif
	printf \{qs(0xb9cdada0)}
endscript

new_unlockables = [
]
unlock_atoms = [
]
song_unlock_new_profile = [
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
	twentiethcenturyboy
	twentyfirstcentury
	twominutestomidnight
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

script progression_get_new_unlocks 
	return {new_unlocks = ($new_unlockables)}
endscript

script progression_reset_new_unlocks 
	change \{new_unlockables = [
		]}
endscript

script progression_check_for_5_stars \{part = 'guitar'}
	return \{false}
endscript

script progression_check_for_song_5_stars 
	return \{false}
endscript

new_unlockables = [
]
unlock_atoms = [
]
song_unlock_new_profile = [
	0xcadbbe3d
	0x0633a1f3
	0xeb495d4b
	0xf5fe8ca8
	0xc0fd7289
	0xe443019e
	0x0e02bf53
	0x36ce830d
	0xd4079a1b
	0x301df215
	0xabd82191
	0x8afcd7a7
	0xe6c0e0dc
	0x0bb63a7c
	0x2929c704
	hangmeuptodry
	0x563874d4
	0x5749b512
	0x826f0248
	0xb494ce29
	0x1837c32d
	0xa885319e
	0x7052b61b
	0x7c98e3c4
	0x58aabfeb
	0xd6b99fe2
	0x9ffeeaa0
	0x03726e6d
	0x685e6b17
	0xf8598272
	0x556ca3a6
	prettywoman
	0x814b34d7
	0x1b75728f
	shewillbeloved
	0x4fbc9810
	0xf22a5fa8
	0x9a39c15d
	0x93aa4e4c
	0x3dc7acbb
	0x12330cfe
	0xc15cce84
	0x00d0eabb
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

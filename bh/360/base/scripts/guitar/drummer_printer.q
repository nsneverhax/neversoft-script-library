
script Print_Machine_DrumPieces 
	switch (<Drum_L>)
		case 1
		switch (<Drum_R>)
			case 1
			printf channel = <channel> qs(0x7e5a50db) c = <Drum_hit>
			case 2
			printf channel = <channel> qs(0xbdd68f2d) c = <Drum_hit>
			case 3
			printf channel = <channel> qs(0x4a6a664e) c = <Drum_hit>
			case 4
			printf channel = <channel> qs(0x4fca37a3) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0x43d68843) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0xed421c2d) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xcc3a8100) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0xa9d520b4) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xd5788794)
		endswitch
		case 2
		switch (<Drum_R>)
			case 2
			printf channel = <channel> qs(0xe95cc5df) c = <Drum_hit>
			case 3
			printf channel = <channel> qs(0xdd6cf34a) c = <Drum_hit>
			case 4
			printf channel = <channel> qs(0xd8cca2a7) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0xd4d01d47) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x7a448929) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0x5b3c1404) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x3ed3b5b0) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x03ac90f0)
		endswitch
		case 3
		switch (<Drum_R>)
			case 3
			printf channel = <channel> qs(0x1ee02cbc) c = <Drum_hit>
			case 4
			printf channel = <channel> qs(0x2f704bc4) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0x236cf424) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x8df8604a) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xac80fd67) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0xc96f5cd3) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x713755f7)
		endswitch
		case 4
		switch (<Drum_R>)
			case 4
			printf channel = <channel> qs(0x1b407d51) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0x26cca5c9) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x885831a7) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xa920ac8a) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0xcccf0d3e) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xf375a847)
		endswitch
		case 5
		switch (<Drum_R>)
			case 5
			printf channel = <channel> qs(0x175cc2b1) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x84448e47) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xa53c136a) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0xc0d3b2de) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xf2b125cf)
		endswitch
		case 6
		switch (<Drum_R>)
			case 6
			printf channel = <channel> qs(0xb9c856df) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0x0ba88704) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x6e4726b0) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x92e2c9d5)
		endswitch
		case 7
		switch (<Drum_R>)
			case 7
			printf channel = <channel> qs(0x98b0cbf2) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x4f3fbb9d) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x8b73fd0e)
		endswitch
		case 8
		switch (<Drum_R>)
			case 8
			printf channel = <channel> qs(0xfd5f6a46) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xf1edce96) c = <Drum_hit>
		endswitch
		default
		printf channel = <channel> qs(0xee716548) c = <Drum_hit>
	endswitch
endscript

script Print_Machine_NoState 
	switch (<Drum_L>)
		case 1
		switch (<Drum_R>)
			case 1
			printf channel = <channel> qs(0x607fef43) c = <Drum_hit>
			printf channel = <channelB> qs(0x72d2b4dd) c = <Drum_hit>
			case 2
			printf channel = <channel> qs(0x0d0c93a2) c = <Drum_hit>
			printf channel = <channelB> qs(0x78494cf0) c = <Drum_hit>
			case 3
			printf channel = <channel> qs(0x4d3fe61f) c = <Drum_hit>
			printf channel = <channelB> qs(0x65608031) c = <Drum_hit>
			case 4
			printf channel = <channel> qs(0xe82699d9) c = <Drum_hit>
			printf channel = <channelB> qs(0xdd503336) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0xf6235bc6) c = <Drum_hit>
			printf channel = <channelB> qs(0xc355f129) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x1d72dc40) c = <Drum_hit>
			printf channel = <channelB> qs(0x280476af) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xa9431179) c = <Drum_hit>
			printf channel = <channelB> qs(0x9c35bb96) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x6f1c2318) c = <Drum_hit>
			printf channel = <channelB> qs(0x5a6a89f7) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xd5788794)
			printf channel = <channelB> qs(0x03ac90f0)
		endswitch
		case 2
		switch (<Drum_R>)
			case 2
			printf channel = <channel> qs(0x72d2b4dd) c = <Drum_hit>
			printf channel = <channelB> qs(0x7815d538) c = <Drum_hit>
			case 3
			printf channel = <channel> qs(0x78494cf0) c = <Drum_hit>
			printf channel = <channelB> qs(0x4addebf8) c = <Drum_hit>
			case 4
			printf channel = <channel> qs(0xdd503336) c = <Drum_hit>
			printf channel = <channelB> qs(0xf2ed58ff) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0xc355f129) c = <Drum_hit>
			printf channel = <channelB> qs(0xece89ae0) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x280476af) c = <Drum_hit>
			printf channel = <channelB> qs(0x07b91d66) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0x9c35bb96) c = <Drum_hit>
			printf channel = <channelB> qs(0xb388d05f) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x5a6a89f7) c = <Drum_hit>
			printf channel = <channelB> qs(0x75d7e23e) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x03ac90f0)
			printf channel = <channelB> qs(0x03ac90f0)
		endswitch
		case 3
		switch (<Drum_R>)
			case 3
			printf channel = <channel> qs(0x7815d538) c = <Drum_hit>
			printf channel = <channelB> qs(0x607fef43) c = <Drum_hit>
			case 4
			printf channel = <channel> qs(0xf2ed58ff) c = <Drum_hit>
			printf channel = <channelB> qs(0xe82699d9) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0xece89ae0) c = <Drum_hit>
			printf channel = <channelB> qs(0xf6235bc6) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x07b91d66) c = <Drum_hit>
			printf channel = <channelB> qs(0x1d72dc40) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xb388d05f) c = <Drum_hit>
			printf channel = <channelB> qs(0xa9431179) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x75d7e23e) c = <Drum_hit>
			printf channel = <channelB> qs(0x6f1c2318) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x713755f7)
			printf channel = <channelB> qs(0x713755f7)
		endswitch
		case 4
		switch (<Drum_R>)
			case 4
			printf channel = <channel> qs(0x100ff12c) c = <Drum_hit>
			printf channel = <channelB> qs(0x100ff12c) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0xe273131d) c = <Drum_hit>
			printf channel = <channelB> qs(0xe273131d) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x0922949b) c = <Drum_hit>
			printf channel = <channelB> qs(0x0922949b) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xbd1359a2) c = <Drum_hit>
			printf channel = <channelB> qs(0xbd1359a2) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x7b4c6bc3) c = <Drum_hit>
			printf channel = <channelB> qs(0x7b4c6bc3) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xf375a847)
			printf channel = <channelB> qs(0xf375a847)
		endswitch
		case 5
		switch (<Drum_R>)
			case 5
			printf channel = <channel> qs(0x203b8938) c = <Drum_hit>
			printf channel = <channelB> qs(0x203b8938) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0xc3b6b2aa) c = <Drum_hit>
			printf channel = <channelB> qs(0xc3b6b2aa) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0x77877f93) c = <Drum_hit>
			printf channel = <channelB> qs(0x77877f93) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0xb1d84df2) c = <Drum_hit>
			printf channel = <channelB> qs(0xb1d84df2) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xf2b125cf)
			printf channel = <channelB> qs(0xf2b125cf)
		endswitch
		case 6
		switch (<Drum_R>)
			case 6
			printf channel = <channel> qs(0x01e17014) c = <Drum_hit>
			printf channel = <channelB> qs(0x01e17014) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0x27310fee) c = <Drum_hit>
			printf channel = <channelB> qs(0x27310fee) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0xe16e3d8f) c = <Drum_hit>
			printf channel = <channelB> qs(0xe16e3d8f) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x92e2c9d5)
			printf channel = <channelB> qs(0x92e2c9d5)
		endswitch
		case 7
		switch (<Drum_R>)
			case 7
			printf channel = <channel> qs(0x30127bab) c = <Drum_hit>
			printf channel = <channelB> qs(0x30127bab) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x86556377) c = <Drum_hit>
			printf channel = <channelB> qs(0x86556377) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x8b73fd0e)
			printf channel = <channelB> qs(0x8b73fd0e)
		endswitch
		case 8
		switch (<Drum_R>)
			case 8
			printf channel = <channel> qs(0x286879fe) c = <Drum_hit>
			printf channel = <channelB> qs(0x286879fe) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xf1edce96) c = <Drum_hit>
			printf channel = <channelB> qs(0xf1edce96) c = <Drum_hit>
		endswitch
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelB> qs(0x8b73fd0e)
	endswitch
endscript

script Print_Machine_State 
	switch (<Drum_L>)
		case 1
		switch (<Drum_R>)
			case 1
			printf channel = <channel> qs(0x2d4f329b) c = <Drum_hit>
			printf channel = <channelB> qs(0x3fe26905) c = <Drum_hit>
			case 2
			printf channel = <channel> qs(0x403c4e7a) c = <Drum_hit>
			printf channel = <channelB> qs(0x35799128) c = <Drum_hit>
			case 3
			printf channel = <channel> qs(0x000f3bc7) c = <Drum_hit>
			printf channel = <channelB> qs(0x28505de9) c = <Drum_hit>
			case 4
			printf channel = <channel> qs(0xa5164401) c = <Drum_hit>
			printf channel = <channelB> qs(0x9060eeee) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0xbb13861e) c = <Drum_hit>
			printf channel = <channelB> qs(0x8e652cf1) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x50420198) c = <Drum_hit>
			printf channel = <channelB> qs(0x6534ab77) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xe473cca1) c = <Drum_hit>
			printf channel = <channelB> qs(0xd105664e) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x222cfec0) c = <Drum_hit>
			printf channel = <channelB> qs(0x175a542f) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xd5788794)
			printf channel = <channelB> qs(0x03ac90f0)
		endswitch
		case 2
		switch (<Drum_R>)
			case 2
			printf channel = <channel> qs(0x3fe26905) c = <Drum_hit>
			printf channel = <channelB> qs(0x352508e0) c = <Drum_hit>
			case 3
			printf channel = <channel> qs(0x35799128) c = <Drum_hit>
			printf channel = <channelB> qs(0x07ed3620) c = <Drum_hit>
			case 4
			printf channel = <channel> qs(0x9060eeee) c = <Drum_hit>
			printf channel = <channelB> qs(0xbfdd8527) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0x8e652cf1) c = <Drum_hit>
			printf channel = <channelB> qs(0xa1d84738) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x6534ab77) c = <Drum_hit>
			printf channel = <channelB> qs(0x4a89c0be) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xd105664e) c = <Drum_hit>
			printf channel = <channelB> qs(0xfeb80d87) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x175a542f) c = <Drum_hit>
			printf channel = <channelB> qs(0x38e73fe6) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x03ac90f0)
			printf channel = <channelB> qs(0x03ac90f0)
		endswitch
		case 3
		switch (<Drum_R>)
			case 3
			printf channel = <channel> qs(0x352508e0) c = <Drum_hit>
			printf channel = <channelB> qs(0x2d4f329b) c = <Drum_hit>
			case 4
			printf channel = <channel> qs(0xbfdd8527) c = <Drum_hit>
			printf channel = <channelB> qs(0xa5164401) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0xa1d84738) c = <Drum_hit>
			printf channel = <channelB> qs(0xbb13861e) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x4a89c0be) c = <Drum_hit>
			printf channel = <channelB> qs(0x50420198) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xfeb80d87) c = <Drum_hit>
			printf channel = <channelB> qs(0xe473cca1) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x38e73fe6) c = <Drum_hit>
			printf channel = <channelB> qs(0x222cfec0) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x713755f7)
			printf channel = <channelB> qs(0x713755f7)
		endswitch
		case 4
		switch (<Drum_R>)
			case 4
			printf channel = <channel> qs(0x5d3f2cf4) c = <Drum_hit>
			printf channel = <channelB> qs(0x5d3f2cf4) c = <Drum_hit>
			case 5
			printf channel = <channel> qs(0xaf43cec5) c = <Drum_hit>
			printf channel = <channelB> qs(0xaf43cec5) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x44124943) c = <Drum_hit>
			printf channel = <channelB> qs(0x44124943) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0xf023847a) c = <Drum_hit>
			printf channel = <channelB> qs(0xf023847a) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0x367cb61b) c = <Drum_hit>
			printf channel = <channelB> qs(0x367cb61b) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xf375a847)
			printf channel = <channelB> qs(0xf375a847)
		endswitch
		case 5
		switch (<Drum_R>)
			case 5
			printf channel = <channel> qs(0x6d0b54e0) c = <Drum_hit>
			printf channel = <channelB> qs(0x6d0b54e0) c = <Drum_hit>
			case 6
			printf channel = <channel> qs(0x8e866f72) c = <Drum_hit>
			printf channel = <channelB> qs(0x8e866f72) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0x3ab7a24b) c = <Drum_hit>
			printf channel = <channelB> qs(0x3ab7a24b) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0xfce8902a) c = <Drum_hit>
			printf channel = <channelB> qs(0xfce8902a) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xf2b125cf)
			printf channel = <channelB> qs(0xf2b125cf)
		endswitch
		case 6
		switch (<Drum_R>)
			case 6
			printf channel = <channel> qs(0x2b61c0a7) c = <Drum_hit>
			printf channel = <channelB> qs(0x2b61c0a7) c = <Drum_hit>
			case 7
			printf channel = <channel> qs(0x6a01d236) c = <Drum_hit>
			printf channel = <channelB> qs(0x6a01d236) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0xac5ee057) c = <Drum_hit>
			printf channel = <channelB> qs(0xac5ee057) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x92e2c9d5)
			printf channel = <channelB> qs(0x92e2c9d5)
		endswitch
		case 7
		switch (<Drum_R>)
			case 7
			printf channel = <channel> qs(0x7d22a673) c = <Drum_hit>
			printf channel = <channelB> qs(0x7d22a673) c = <Drum_hit>
			case 8
			printf channel = <channel> qs(0xcb65beaf) c = <Drum_hit>
			printf channel = <channelB> qs(0xcb65beaf) c = <Drum_hit>
			default
			printf channel = <channel> qs(0x8b73fd0e)
			printf channel = <channelB> qs(0x8b73fd0e)
		endswitch
		case 8
		switch (<Drum_R>)
			case 8
			printf channel = <channel> qs(0x6558a426) c = <Drum_hit>
			printf channel = <channelB> qs(0x6558a426) c = <Drum_hit>
			default
			printf channel = <channel> qs(0xbcdd134e) c = <Drum_hit>
			printf channel = <channelB> qs(0xbcdd134e) c = <Drum_hit>
		endswitch
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelB> qs(0x8b73fd0e)
	endswitch
endscript

script Print_Machine_NoState_L 
	switch (<Drum_L>)
		case 1
		printf channel = <channel> qs(0x49c200ee) c = <Drum_hit>
		printf channel = <channelB> qs(0x7cb4aa01) c = <Drum_hit>
		case 2
		printf channel = <channel> qs(0x7cb4aa01) c = <Drum_hit>
		printf channel = <channelB> qs(0x5309c1c8) c = <Drum_hit>
		case 3
		printf channel = <channel> qs(0x5309c1c8) c = <Drum_hit>
		printf channel = <channelB> qs(0x49c200ee) c = <Drum_hit>
		case 4
		printf channel = <channel> qs(0x5d924835) c = <Drum_hit>
		printf channel = <channelB> qs(0x5d924835) c = <Drum_hit>
		case 5
		printf channel = <channel> qs(0x97066e04) c = <Drum_hit>
		printf channel = <channelB> qs(0x97066e04) c = <Drum_hit>
		case 6
		printf channel = <channel> qs(0xc7b01e79) c = <Drum_hit>
		printf channel = <channelB> qs(0xc7b01e79) c = <Drum_hit>
		case 7
		printf channel = <channel> qs(0xa08b4081) c = <Drum_hit>
		printf channel = <channelB> qs(0xa08b4081) c = <Drum_hit>
		case 8
		printf channel = <channel> qs(0xd7e3dace) c = <Drum_hit>
		printf channel = <channelB> qs(0xd7e3dace) c = <Drum_hit>
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelB> qs(0x8b73fd0e)
	endswitch
endscript

script Print_Machine_State_L 
	switch (<Drum_L>)
		case 1
		printf channel = <channel> qs(0x04f2dd36) c = <Drum_hit>
		printf channel = <channelB> qs(0x318477d9) c = <Drum_hit>
		case 2
		printf channel = <channel> qs(0x318477d9) c = <Drum_hit>
		printf channel = <channelB> qs(0x1e391c10) c = <Drum_hit>
		case 3
		printf channel = <channel> qs(0x1e391c10) c = <Drum_hit>
		printf channel = <channelB> qs(0x04f2dd36) c = <Drum_hit>
		case 4
		printf channel = <channel> qs(0x10a295ed) c = <Drum_hit>
		printf channel = <channelB> qs(0x10a295ed) c = <Drum_hit>
		case 5
		printf channel = <channel> qs(0xda36b3dc) c = <Drum_hit>
		printf channel = <channelB> qs(0xda36b3dc) c = <Drum_hit>
		case 6
		printf channel = <channel> qs(0x8a80c3a1) c = <Drum_hit>
		printf channel = <channelB> qs(0x8a80c3a1) c = <Drum_hit>
		case 7
		printf channel = <channel> qs(0xedbb9d59) c = <Drum_hit>
		printf channel = <channelB> qs(0xedbb9d59) c = <Drum_hit>
		case 8
		printf channel = <channel> qs(0x9ad30716) c = <Drum_hit>
		printf channel = <channelB> qs(0x9ad30716) c = <Drum_hit>
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelB> qs(0x8b73fd0e)
	endswitch
endscript

script Print_Machine_NoState_R 
	switch (<Drum_R>)
		case 1
		printf channel = <channel> qs(0x33043019) c = <Drum_hit>
		printf channel = <channelB> qs(0x6e1e8965) c = <Drum_hit>
		case 2
		printf channel = <channel> qs(0x6e1e8965) c = <Drum_hit>
		printf channel = <channelB> qs(0x2e2dfcd8) c = <Drum_hit>
		case 3
		printf channel = <channel> qs(0x2e2dfcd8) c = <Drum_hit>
		printf channel = <channelB> qs(0x33043019) c = <Drum_hit>
		case 4
		printf channel = <channel> qs(0x8b34831e) c = <Drum_hit>
		printf channel = <channelB> qs(0x8b34831e) c = <Drum_hit>
		case 5
		printf channel = <channel> qs(0x95314101) c = <Drum_hit>
		printf channel = <channelB> qs(0x95314101) c = <Drum_hit>
		case 6
		printf channel = <channel> qs(0x7e60c687) c = <Drum_hit>
		printf channel = <channelB> qs(0x7e60c687) c = <Drum_hit>
		case 7
		printf channel = <channel> qs(0xca510bbe) c = <Drum_hit>
		printf channel = <channelB> qs(0xca510bbe) c = <Drum_hit>
		case 8
		printf channel = <channel> qs(0x0c0e39df) c = <Drum_hit>
		printf channel = <channelB> qs(0x0c0e39df) c = <Drum_hit>
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelB> qs(0x8b73fd0e)
	endswitch
endscript

script Print_Machine_State_R 
	switch (<Drum_R>)
		case 1
		printf channel = <channel> qs(0x7e34edc1) c = <Drum_hit>
		printf channel = <channelB> qs(0x232e54bd) c = <Drum_hit>
		case 2
		printf channel = <channel> qs(0x232e54bd) c = <Drum_hit>
		printf channel = <channelB> qs(0x631d2100) c = <Drum_hit>
		case 3
		printf channel = <channel> qs(0x631d2100) c = <Drum_hit>
		printf channel = <channelB> qs(0x7e34edc1) c = <Drum_hit>
		case 4
		printf channel = <channel> qs(0xc6045ec6) c = <Drum_hit>
		printf channel = <channelB> qs(0xc6045ec6) c = <Drum_hit>
		case 5
		printf channel = <channel> qs(0xd8019cd9) c = <Drum_hit>
		printf channel = <channelB> qs(0xd8019cd9) c = <Drum_hit>
		case 6
		printf channel = <channel> qs(0x33501b5f) c = <Drum_hit>
		printf channel = <channelB> qs(0x33501b5f) c = <Drum_hit>
		case 7
		printf channel = <channel> qs(0x8761d666) c = <Drum_hit>
		printf channel = <channelB> qs(0x8761d666) c = <Drum_hit>
		case 8
		printf channel = <channel> qs(0x413ee407) c = <Drum_hit>
		printf channel = <channelB> qs(0x413ee407) c = <Drum_hit>
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelB> qs(0x8b73fd0e)
	endswitch
endscript

script printfPriorities 
	printf \{channel = Drummer_Logic
		qs(0xb7744d9f)}
	printf channel = Drummer_Logic qs(0x67e20154) a = <Priority_1_L> c = <Priority_1_R>
	printf channel = Drummer_Logic qs(0x67e20154) a = <Priority_2_L> c = <Priority_2_R>
	printf channel = Drummer_Logic qs(0x67e20154) a = <Priority_3_L> c = <Priority_3_R>
	printf channel = Drummer_Logic qs(0x67e20154) a = <Priority_4_L> c = <Priority_4_R>
	printf channel = Drummer_Logic qs(0x67e20154) a = <Priority_5_L> c = <Priority_5_R>
	printf channel = Drummer_Logic qs(0x67e20154) a = <Priority_6_L> c = <Priority_6_R>
	printf \{channel = Drummer_Logic
		qs(0xb0d23bc0)}
endscript

script Printfnotestructure 
	printf channel = Drummer_Logic qs(0xabee5304) a = <Drum_Pattern_Start> b = <Drum_Pattern_End>
	if ((<Drum_Pattern_Exists> = true) && ((<Drum_Pattern_Start> < 2) && (<Drum_Pattern_End> > 0)))
		printf \{channel = Drummer_Logic
			qs(0x537dabe2)}
	else
		printf \{channel = Drummer_Logic
			qs(0x36eaf80b)}
	endif
	printf channel = Drummer_Logic qs(0x84bf29d4) f = <time_to_Hit_1>
	printf channel = Drummer_Logic qs(0x1b4c7d39) c = <num_pieces_hit_1>
	printf channel = Drummer_Logic qs(0xee058389) b = <pieces_value_1_1>
	printf channel = Drummer_Logic qs(0x608a846a) b = <pieces_value_1_2>
	if ((<Drum_Pattern_Exists> = true) && ((<Drum_Pattern_Start> < 3) && (<Drum_Pattern_End> > 1)))
		printf \{channel = Drummer_Logic
			qs(0x8da1c0a1)}
	else
		printf \{channel = Drummer_Logic
			qs(0x3f8e4fc3)}
	endif
	printf channel = Drummer_Logic qs(0x0a302e37) f = <time_to_Hit_2>
	printf channel = Drummer_Logic qs(0xf07bc63a) c = <Num_Pieces_Hit_2>
	printf channel = Drummer_Logic qs(0x999b5179) b = <pieces_value_2_1>
	printf channel = Drummer_Logic qs(0x1714569a) b = <pieces_value_2_2>
	if ((<Drum_Pattern_Exists> = true) && ((<Drum_Pattern_Start> < 4) && (<Drum_Pattern_End> > 2)))
		printf \{channel = Drummer_Logic
			qs(0x8da1c0a1)}
	else
		printf \{channel = Drummer_Logic
			qs(0x3f8e4fc3)}
	endif
	printf channel = Drummer_Logic qs(0xc69a2ea9) f = <Time_to_Hit_3>
	printf channel = Drummer_Logic qs(0x1fb9ad04) c = <Num_Pieces_Hit_3>
	printf channel = Drummer_Logic qs(0x023e1d16) b = <pieces_value_3_1>
	printf channel = Drummer_Logic qs(0x8cb11af5) b = <pieces_value_3_2>
	if ((<Drum_Pattern_Exists> = true) && ((<Drum_Pattern_Start> < 5) && (<Drum_Pattern_End> > 3)))
		printf \{channel = Drummer_Logic
			qs(0x8da1c0a1)}
	else
		printf \{channel = Drummer_Logic
			qs(0x3f8e4fc3)}
	endif
	printf channel = Drummer_Logic qs(0xcc5f27b0) f = <Time_to_Hit_4>
	printf channel = Drummer_Logic qs(0xfd65b67d) c = <Num_Pieces_Hit_4>
	printf channel = Drummer_Logic qs(0x76a6f499) b = <pieces_value_4_1>
	printf channel = Drummer_Logic qs(0xf829f37a) b = <pieces_value_4_2>
	if ((<Drum_Pattern_Exists> = true) && ((<Drum_Pattern_Start> < 6) && (<Drum_Pattern_End> > 4)))
		printf \{channel = Drummer_Logic
			qs(0x8da1c0a1)}
	else
		printf \{channel = Drummer_Logic
			qs(0x3f8e4fc3)}
	endif
	printf channel = Drummer_Logic qs(0x00f5272e) f = <Time_to_Hit_5>
	printf channel = Drummer_Logic qs(0x12a7dd43) c = <Num_Pieces_Hit_5>
	printf channel = Drummer_Logic qs(0xed03b8f6) b = <pieces_value_5_1>
	printf channel = Drummer_Logic qs(0x638cbf15) b = <pieces_value_5_2>
	if ((<Drum_Pattern_Exists> = true) && ((<Drum_Pattern_Start> < 7) && (<Drum_Pattern_End> > 5)))
		printf \{channel = Drummer_Logic
			qs(0x8da1c0a1)}
	else
		printf \{channel = Drummer_Logic
			qs(0x3f8e4fc3)}
	endif
	printf channel = Drummer_Logic qs(0x8e7a20cd) f = <Time_to_Hit_6>
	printf channel = Drummer_Logic qs(0xf9906640) c = <Num_Pieces_Hit_6>
	printf channel = Drummer_Logic qs(0x9a9d6a06) b = <pieces_value_6_1>
	printf channel = Drummer_Logic qs(0x14126de5) b = <pieces_value_6_2>
endscript

script PrintFAssignPrinter 
	if ((<Start_Hit_L> = true) && (<Start_Hit_R> = true))
		Drum_L = (<Drum_Current_Value_L>)
		Drum_R = (<Drum_Current_Value_R>)
		channel = Drummer_Record_Crossed
		channelB = Drummer_Record
		if (<Drum_Was_Patterned> = true)
			Print_Machine_State Drum_L = <Drum_L> Drum_R = <Drum_R> Drum_hit = <Drum_hit> channel = <channel> channelB = <channelB> Drum_hit = <Drum_hit>
		else
			Print_Machine_NoState Drum_L = <Drum_L> Drum_R = <Drum_R> Drum_hit = <Drum_hit> channel = <channel> channelB = <channelB> Drum_hit = <Drum_hit>
		endif
	elseif (<Start_Hit_L> = true)
		Drum_L = (<Drum_Current_Value_L>)
		channel = Drummer_Record_Crossed
		channelB = Drummer_Record
		if (<Drum_Was_Patterned> = true)
			Print_Machine_State_L Drum_L = <Drum_L> Drum_hit = <Drum_hit> channel = <channel> channelB = <channelB> Drum_hit = <Drum_hit>
		else
			Print_Machine_NoState_L Drum_L = <Drum_L> Drum_hit = <Drum_hit> channel = <channel> channelB = <channelB> Drum_hit = <Drum_hit>
		endif
	elseif (<Start_Hit_R> = true)
		Drum_R = (<Drum_Current_Value_R>)
		channel = Drummer_Record_Crossed
		channelB = Drummer_Record
		if (<Drum_Was_Patterned> = true)
			Print_Machine_State_R Drum_R = <Drum_R> Drum_hit = <Drum_hit> channel = <channel> channelB = <channelB> Drum_hit = <Drum_hit>
		else
			Print_Machine_NoState_R Drum_R = <Drum_R> Drum_hit = <Drum_hit> channel = <channel> channelB = <channelB> Drum_hit = <Drum_hit>
		endif
	else
	endif
	Drum_L = <pieces_value_1_1>
	Drum_R = <pieces_value_1_2>
	channel = Drummer_Actual
	Print_Machine_DrumPieces Drum_L = <Drum_L> Drum_R = <Drum_R> Drum_hit = <Drum_hit> channel = <channel> Drum_hit = (<Drum_hit> + 1)
endscript

script PrintfGraphView 
	Graph = (<test> * 80)
	CastToInteger \{Graph}
	switch <Graph>
		case 0
		printf channel = <channel> qs(0x6c159a5a) b = <test> c = <timer>
		case 1
		printf channel = <channel> qs(0xbd3c1a77) b = <test> c = <timer>
		case 2
		printf channel = <channel> qs(0xdbf76810) b = <test> c = <timer>
		case 3
		printf channel = <channel> qs(0x455c21e5) b = <test> c = <timer>
		case 4
		printf channel = <channel> qs(0x239fbfd3) b = <test> c = <timer>
		case 5
		printf channel = <channel> qs(0x3c58db6b) b = <test> c = <timer>
		case 6
		printf channel = <channel> qs(0x6c9e6c7b) b = <test> c = <timer>
		case 7
		printf channel = <channel> qs(0xa63cbd86) b = <test> c = <timer>
		case 8
		printf channel = <channel> qs(0x020c3b51) b = <test> c = <timer>
		case 9
		printf channel = <channel> qs(0x4e2e451a) b = <test> c = <timer>
		case 10
		printf channel = <channel> qs(0x24ef233f) b = <test> c = <timer>
		case 11
		printf channel = <channel> qs(0xd3bdbb7b) b = <test> c = <timer>
		case 12
		printf channel = <channel> qs(0xa95bc694) b = <test> c = <timer>
		case 13
		printf channel = <channel> qs(0x5d60beca) b = <test> c = <timer>
		case 14
		printf channel = <channel> qs(0x457f8289) b = <test> c = <timer>
		case 15
		printf channel = <channel> qs(0x59940024) b = <test> c = <timer>
		case 16
		printf channel = <channel> qs(0xb2f883b5) b = <test> c = <timer>
		case 17
		printf channel = <channel> qs(0xda4b99e9) b = <test> c = <timer>
		case 18
		printf channel = <channel> qs(0x18e9ac7e) b = <test> c = <timer>
		case 19
		printf channel = <channel> qs(0xb87a8cbc) b = <test> c = <timer>
		case 20
		printf channel = <channel> qs(0xd16f6232) b = <test> c = <timer>
		case 21
		printf channel = <channel> qs(0xffd78aa4) b = <test> c = <timer>
		case 22
		printf channel = <channel> qs(0x6075566c) b = <test> c = <timer>
		case 23
		printf channel = <channel> qs(0xef08747c) b = <test> c = <timer>
		case 24
		printf channel = <channel> qs(0xe4a0dfab) b = <test> c = <timer>
		case 25
		printf channel = <channel> qs(0x4c40932c) b = <test> c = <timer>
		case 26
		printf channel = <channel> qs(0xd731ecbd) b = <test> c = <timer>
		case 27
		printf channel = <channel> qs(0xb03d65e0) b = <test> c = <timer>
		case 28
		printf channel = <channel> qs(0xc8cb0f44) b = <test> c = <timer>
		case 29
		printf channel = <channel> qs(0xbf2f0595) b = <test> c = <timer>
		case 30
		printf channel = <channel> qs(0xe663161d) b = <test> c = <timer>
		case 31
		printf channel = <channel> qs(0xc7961ac4) b = <test> c = <timer>
		case 32
		printf channel = <channel> qs(0x3b804e6f) b = <test> c = <timer>
		case 33
		printf channel = <channel> qs(0xed4c59c6) b = <test> c = <timer>
		case 34
		printf channel = <channel> qs(0x83d984d2) b = <test> c = <timer>
		case 35
		printf channel = <channel> qs(0x8c31654a) b = <test> c = <timer>
		case 36
		printf channel = <channel> qs(0x2c491f0d) b = <test> c = <timer>
		case 37
		printf channel = <channel> qs(0xb3117acb) b = <test> c = <timer>
		case 38
		printf channel = <channel> qs(0x8a5f3bc5) b = <test> c = <timer>
		case 39
		printf channel = <channel> qs(0xcaf280a5) b = <test> c = <timer>
		case 40
		printf channel = <channel> qs(0x7d70c77d) b = <test> c = <timer>
		case 41
		printf channel = <channel> qs(0x98635e4d) b = <test> c = <timer>
		case 42
		printf channel = <channel> qs(0xf89233ff) b = <test> c = <timer>
		case 43
		printf channel = <channel> qs(0x1f8fcc54) b = <test> c = <timer>
		case 44
		printf channel = <channel> qs(0xc796a973) b = <test> c = <timer>
		case 45
		printf channel = <channel> qs(0x88374e6f) b = <test> c = <timer>
		case 46
		printf channel = <channel> qs(0x2c055062) b = <test> c = <timer>
		case 47
		printf channel = <channel> qs(0x956e24ea) b = <test> c = <timer>
		case 48
		printf channel = <channel> qs(0x58856c60) b = <test> c = <timer>
		case 49
		printf channel = <channel> qs(0x15784844) b = <test> c = <timer>
		case 50
		printf channel = <channel> qs(0x8ff67ae7) b = <test> c = <timer>
		case 51
		printf channel = <channel> qs(0x606d1449) b = <test> c = <timer>
		case 52
		printf channel = <channel> qs(0x1a6a03ab) b = <test> c = <timer>
		case 53
		printf channel = <channel> qs(0x8ac463be) b = <test> c = <timer>
		case 54
		printf channel = <channel> qs(0xf64b3065) b = <test> c = <timer>
		case 55
		printf channel = <channel> qs(0xf9b4ce97) b = <test> c = <timer>
		case 56
		printf channel = <channel> qs(0xf118f74e) b = <test> c = <timer>
		case 57
		printf channel = <channel> qs(0x94f11170) b = <test> c = <timer>
		case 58
		printf channel = <channel> qs(0x18345e0c) b = <test> c = <timer>
		case 59
		printf channel = <channel> qs(0x477445d3) b = <test> c = <timer>
		case 60
		printf channel = <channel> qs(0xaa29ffb4) b = <test> c = <timer>
		case 61
		printf channel = <channel> qs(0xeff63c37) b = <test> c = <timer>
		case 62
		printf channel = <channel> qs(0x78f0a933) b = <test> c = <timer>
		case 63
		printf channel = <channel> qs(0x8f4c4050) b = <test> c = <timer>
		case 64
		printf channel = <channel> qs(0x8aec11bd) b = <test> c = <timer>
		case 65
		printf channel = <channel> qs(0x86f0ae5d) b = <test> c = <timer>
		case 66
		printf channel = <channel> qs(0x28643a33) b = <test> c = <timer>
		case 67
		printf channel = <channel> qs(0x091ca71e) b = <test> c = <timer>
		case 68
		printf channel = <channel> qs(0x6cf306aa) b = <test> c = <timer>
		case 69
		printf channel = <channel> qs(0x11095693) b = <test> c = <timer>
		case 70
		printf channel = <channel> qs(0xbd78a389) b = <test> c = <timer>
		case 71
		printf channel = <channel> qs(0x66241b7c) b = <test> c = <timer>
		case 72
		printf channel = <channel> qs(0xaf2a3672) b = <test> c = <timer>
		case 73
		printf channel = <channel> qs(0xcf314fb1) b = <test> c = <timer>
		case 74
		printf channel = <channel> qs(0xe91a899e) b = <test> c = <timer>
		case 75
		printf channel = <channel> qs(0x7d99f7cd) b = <test> c = <timer>
		case 76
		printf channel = <channel> qs(0x806379c3) b = <test> c = <timer>
		case 77
		printf channel = <channel> qs(0x2537df81) b = <test> c = <timer>
		case 78
		printf channel = <channel> qs(0xe8e7f6f9) b = <test> c = <timer>
		case 79
		printf channel = <channel> qs(0xaac81afd) b = <test> c = <timer>
		case 80
		printf channel = <channel> qs(0x63ac87d4) b = <test> c = <timer>
		default
		printf channel = <channel> qs(0x16c756f5) a = <test> b = <timer>
	endswitch
endscript

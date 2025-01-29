
script print_machine_drumpieces 
	switch (<drum_l>)
		case 1
		switch (<drum_r>)
			case 1
			printf channel = <channel> qs(0x7e5a50db) c = <drum_hit>
			case 2
			printf channel = <channel> qs(0xbdd68f2d) c = <drum_hit>
			case 3
			printf channel = <channel> qs(0x4a6a664e) c = <drum_hit>
			case 4
			printf channel = <channel> qs(0x4fca37a3) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0x43d68843) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0xed421c2d) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xcc3a8100) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0xa9d520b4) c = <drum_hit>
			default
			printf channel = <channel> qs(0xd5788794)
		endswitch
		case 2
		switch (<drum_r>)
			case 2
			printf channel = <channel> qs(0xe95cc5df) c = <drum_hit>
			case 3
			printf channel = <channel> qs(0xdd6cf34a) c = <drum_hit>
			case 4
			printf channel = <channel> qs(0xd8cca2a7) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0xd4d01d47) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x7a448929) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0x5b3c1404) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x3ed3b5b0) c = <drum_hit>
			default
			printf channel = <channel> qs(0x03ac90f0)
		endswitch
		case 3
		switch (<drum_r>)
			case 3
			printf channel = <channel> qs(0x1ee02cbc) c = <drum_hit>
			case 4
			printf channel = <channel> qs(0x2f704bc4) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0x236cf424) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x8df8604a) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xac80fd67) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0xc96f5cd3) c = <drum_hit>
			default
			printf channel = <channel> qs(0x713755f7)
		endswitch
		case 4
		switch (<drum_r>)
			case 4
			printf channel = <channel> qs(0x1b407d51) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0x26cca5c9) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x885831a7) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xa920ac8a) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0xcccf0d3e) c = <drum_hit>
			default
			printf channel = <channel> qs(0xf375a847)
		endswitch
		case 5
		switch (<drum_r>)
			case 5
			printf channel = <channel> qs(0x175cc2b1) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x84448e47) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xa53c136a) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0xc0d3b2de) c = <drum_hit>
			default
			printf channel = <channel> qs(0xf2b125cf)
		endswitch
		case 6
		switch (<drum_r>)
			case 6
			printf channel = <channel> qs(0xb9c856df) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0x0ba88704) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x6e4726b0) c = <drum_hit>
			default
			printf channel = <channel> qs(0x92e2c9d5)
		endswitch
		case 7
		switch (<drum_r>)
			case 7
			printf channel = <channel> qs(0x98b0cbf2) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x4f3fbb9d) c = <drum_hit>
			default
			printf channel = <channel> qs(0x8b73fd0e)
		endswitch
		case 8
		switch (<drum_r>)
			case 8
			printf channel = <channel> qs(0xfd5f6a46) c = <drum_hit>
			default
			printf channel = <channel> qs(0xf1edce96) c = <drum_hit>
		endswitch
		default
		printf channel = <channel> qs(0xee716548) c = <drum_hit>
	endswitch
endscript

script print_machine_nostate 
	switch (<drum_l>)
		case 1
		switch (<drum_r>)
			case 1
			printf channel = <channel> qs(0x607fef43) c = <drum_hit>
			printf channel = <channelb> qs(0x72d2b4dd) c = <drum_hit>
			case 2
			printf channel = <channel> qs(0x0d0c93a2) c = <drum_hit>
			printf channel = <channelb> qs(0x78494cf0) c = <drum_hit>
			case 3
			printf channel = <channel> qs(0x4d3fe61f) c = <drum_hit>
			printf channel = <channelb> qs(0x65608031) c = <drum_hit>
			case 4
			printf channel = <channel> qs(0xe82699d9) c = <drum_hit>
			printf channel = <channelb> qs(0xdd503336) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0xf6235bc6) c = <drum_hit>
			printf channel = <channelb> qs(0xc355f129) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x1d72dc40) c = <drum_hit>
			printf channel = <channelb> qs(0x280476af) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xa9431179) c = <drum_hit>
			printf channel = <channelb> qs(0x9c35bb96) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x6f1c2318) c = <drum_hit>
			printf channel = <channelb> qs(0x5a6a89f7) c = <drum_hit>
			default
			printf channel = <channel> qs(0xd5788794)
			printf channel = <channelb> qs(0x03ac90f0)
		endswitch
		case 2
		switch (<drum_r>)
			case 2
			printf channel = <channel> qs(0x72d2b4dd) c = <drum_hit>
			printf channel = <channelb> qs(0x7815d538) c = <drum_hit>
			case 3
			printf channel = <channel> qs(0x78494cf0) c = <drum_hit>
			printf channel = <channelb> qs(0x4addebf8) c = <drum_hit>
			case 4
			printf channel = <channel> qs(0xdd503336) c = <drum_hit>
			printf channel = <channelb> qs(0xf2ed58ff) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0xc355f129) c = <drum_hit>
			printf channel = <channelb> qs(0xece89ae0) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x280476af) c = <drum_hit>
			printf channel = <channelb> qs(0x07b91d66) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0x9c35bb96) c = <drum_hit>
			printf channel = <channelb> qs(0xb388d05f) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x5a6a89f7) c = <drum_hit>
			printf channel = <channelb> qs(0x75d7e23e) c = <drum_hit>
			default
			printf channel = <channel> qs(0x03ac90f0)
			printf channel = <channelb> qs(0x03ac90f0)
		endswitch
		case 3
		switch (<drum_r>)
			case 3
			printf channel = <channel> qs(0x7815d538) c = <drum_hit>
			printf channel = <channelb> qs(0x607fef43) c = <drum_hit>
			case 4
			printf channel = <channel> qs(0xf2ed58ff) c = <drum_hit>
			printf channel = <channelb> qs(0xe82699d9) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0xece89ae0) c = <drum_hit>
			printf channel = <channelb> qs(0xf6235bc6) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x07b91d66) c = <drum_hit>
			printf channel = <channelb> qs(0x1d72dc40) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xb388d05f) c = <drum_hit>
			printf channel = <channelb> qs(0xa9431179) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x75d7e23e) c = <drum_hit>
			printf channel = <channelb> qs(0x6f1c2318) c = <drum_hit>
			default
			printf channel = <channel> qs(0x713755f7)
			printf channel = <channelb> qs(0x713755f7)
		endswitch
		case 4
		switch (<drum_r>)
			case 4
			printf channel = <channel> qs(0x100ff12c) c = <drum_hit>
			printf channel = <channelb> qs(0x100ff12c) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0xe273131d) c = <drum_hit>
			printf channel = <channelb> qs(0xe273131d) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x0922949b) c = <drum_hit>
			printf channel = <channelb> qs(0x0922949b) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xbd1359a2) c = <drum_hit>
			printf channel = <channelb> qs(0xbd1359a2) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x7b4c6bc3) c = <drum_hit>
			printf channel = <channelb> qs(0x7b4c6bc3) c = <drum_hit>
			default
			printf channel = <channel> qs(0xf375a847)
			printf channel = <channelb> qs(0xf375a847)
		endswitch
		case 5
		switch (<drum_r>)
			case 5
			printf channel = <channel> qs(0x203b8938) c = <drum_hit>
			printf channel = <channelb> qs(0x203b8938) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0xc3b6b2aa) c = <drum_hit>
			printf channel = <channelb> qs(0xc3b6b2aa) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0x77877f93) c = <drum_hit>
			printf channel = <channelb> qs(0x77877f93) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0xb1d84df2) c = <drum_hit>
			printf channel = <channelb> qs(0xb1d84df2) c = <drum_hit>
			default
			printf channel = <channel> qs(0xf2b125cf)
			printf channel = <channelb> qs(0xf2b125cf)
		endswitch
		case 6
		switch (<drum_r>)
			case 6
			printf channel = <channel> qs(0x01e17014) c = <drum_hit>
			printf channel = <channelb> qs(0x01e17014) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0x27310fee) c = <drum_hit>
			printf channel = <channelb> qs(0x27310fee) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0xe16e3d8f) c = <drum_hit>
			printf channel = <channelb> qs(0xe16e3d8f) c = <drum_hit>
			default
			printf channel = <channel> qs(0x92e2c9d5)
			printf channel = <channelb> qs(0x92e2c9d5)
		endswitch
		case 7
		switch (<drum_r>)
			case 7
			printf channel = <channel> qs(0x30127bab) c = <drum_hit>
			printf channel = <channelb> qs(0x30127bab) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x86556377) c = <drum_hit>
			printf channel = <channelb> qs(0x86556377) c = <drum_hit>
			default
			printf channel = <channel> qs(0x8b73fd0e)
			printf channel = <channelb> qs(0x8b73fd0e)
		endswitch
		case 8
		switch (<drum_r>)
			case 8
			printf channel = <channel> qs(0x286879fe) c = <drum_hit>
			printf channel = <channelb> qs(0x286879fe) c = <drum_hit>
			default
			printf channel = <channel> qs(0xf1edce96) c = <drum_hit>
			printf channel = <channelb> qs(0xf1edce96) c = <drum_hit>
		endswitch
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelb> qs(0x8b73fd0e)
	endswitch
endscript

script print_machine_state 
	switch (<drum_l>)
		case 1
		switch (<drum_r>)
			case 1
			printf channel = <channel> qs(0x2d4f329b) c = <drum_hit>
			printf channel = <channelb> qs(0x3fe26905) c = <drum_hit>
			case 2
			printf channel = <channel> qs(0x403c4e7a) c = <drum_hit>
			printf channel = <channelb> qs(0x35799128) c = <drum_hit>
			case 3
			printf channel = <channel> qs(0x000f3bc7) c = <drum_hit>
			printf channel = <channelb> qs(0x28505de9) c = <drum_hit>
			case 4
			printf channel = <channel> qs(0xa5164401) c = <drum_hit>
			printf channel = <channelb> qs(0x9060eeee) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0xbb13861e) c = <drum_hit>
			printf channel = <channelb> qs(0x8e652cf1) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x50420198) c = <drum_hit>
			printf channel = <channelb> qs(0x6534ab77) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xe473cca1) c = <drum_hit>
			printf channel = <channelb> qs(0xd105664e) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x222cfec0) c = <drum_hit>
			printf channel = <channelb> qs(0x175a542f) c = <drum_hit>
			default
			printf channel = <channel> qs(0xd5788794)
			printf channel = <channelb> qs(0x03ac90f0)
		endswitch
		case 2
		switch (<drum_r>)
			case 2
			printf channel = <channel> qs(0x3fe26905) c = <drum_hit>
			printf channel = <channelb> qs(0x352508e0) c = <drum_hit>
			case 3
			printf channel = <channel> qs(0x35799128) c = <drum_hit>
			printf channel = <channelb> qs(0x07ed3620) c = <drum_hit>
			case 4
			printf channel = <channel> qs(0x9060eeee) c = <drum_hit>
			printf channel = <channelb> qs(0xbfdd8527) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0x8e652cf1) c = <drum_hit>
			printf channel = <channelb> qs(0xa1d84738) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x6534ab77) c = <drum_hit>
			printf channel = <channelb> qs(0x4a89c0be) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xd105664e) c = <drum_hit>
			printf channel = <channelb> qs(0xfeb80d87) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x175a542f) c = <drum_hit>
			printf channel = <channelb> qs(0x38e73fe6) c = <drum_hit>
			default
			printf channel = <channel> qs(0x03ac90f0)
			printf channel = <channelb> qs(0x03ac90f0)
		endswitch
		case 3
		switch (<drum_r>)
			case 3
			printf channel = <channel> qs(0x352508e0) c = <drum_hit>
			printf channel = <channelb> qs(0x2d4f329b) c = <drum_hit>
			case 4
			printf channel = <channel> qs(0xbfdd8527) c = <drum_hit>
			printf channel = <channelb> qs(0xa5164401) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0xa1d84738) c = <drum_hit>
			printf channel = <channelb> qs(0xbb13861e) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x4a89c0be) c = <drum_hit>
			printf channel = <channelb> qs(0x50420198) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xfeb80d87) c = <drum_hit>
			printf channel = <channelb> qs(0xe473cca1) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x38e73fe6) c = <drum_hit>
			printf channel = <channelb> qs(0x222cfec0) c = <drum_hit>
			default
			printf channel = <channel> qs(0x713755f7)
			printf channel = <channelb> qs(0x713755f7)
		endswitch
		case 4
		switch (<drum_r>)
			case 4
			printf channel = <channel> qs(0x5d3f2cf4) c = <drum_hit>
			printf channel = <channelb> qs(0x5d3f2cf4) c = <drum_hit>
			case 5
			printf channel = <channel> qs(0xaf43cec5) c = <drum_hit>
			printf channel = <channelb> qs(0xaf43cec5) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x44124943) c = <drum_hit>
			printf channel = <channelb> qs(0x44124943) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0xf023847a) c = <drum_hit>
			printf channel = <channelb> qs(0xf023847a) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0x367cb61b) c = <drum_hit>
			printf channel = <channelb> qs(0x367cb61b) c = <drum_hit>
			default
			printf channel = <channel> qs(0xf375a847)
			printf channel = <channelb> qs(0xf375a847)
		endswitch
		case 5
		switch (<drum_r>)
			case 5
			printf channel = <channel> qs(0x6d0b54e0) c = <drum_hit>
			printf channel = <channelb> qs(0x6d0b54e0) c = <drum_hit>
			case 6
			printf channel = <channel> qs(0x8e866f72) c = <drum_hit>
			printf channel = <channelb> qs(0x8e866f72) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0x3ab7a24b) c = <drum_hit>
			printf channel = <channelb> qs(0x3ab7a24b) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0xfce8902a) c = <drum_hit>
			printf channel = <channelb> qs(0xfce8902a) c = <drum_hit>
			default
			printf channel = <channel> qs(0xf2b125cf)
			printf channel = <channelb> qs(0xf2b125cf)
		endswitch
		case 6
		switch (<drum_r>)
			case 6
			printf channel = <channel> qs(0x2b61c0a7) c = <drum_hit>
			printf channel = <channelb> qs(0x2b61c0a7) c = <drum_hit>
			case 7
			printf channel = <channel> qs(0x6a01d236) c = <drum_hit>
			printf channel = <channelb> qs(0x6a01d236) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0xac5ee057) c = <drum_hit>
			printf channel = <channelb> qs(0xac5ee057) c = <drum_hit>
			default
			printf channel = <channel> qs(0x92e2c9d5)
			printf channel = <channelb> qs(0x92e2c9d5)
		endswitch
		case 7
		switch (<drum_r>)
			case 7
			printf channel = <channel> qs(0x7d22a673) c = <drum_hit>
			printf channel = <channelb> qs(0x7d22a673) c = <drum_hit>
			case 8
			printf channel = <channel> qs(0xcb65beaf) c = <drum_hit>
			printf channel = <channelb> qs(0xcb65beaf) c = <drum_hit>
			default
			printf channel = <channel> qs(0x8b73fd0e)
			printf channel = <channelb> qs(0x8b73fd0e)
		endswitch
		case 8
		switch (<drum_r>)
			case 8
			printf channel = <channel> qs(0x6558a426) c = <drum_hit>
			printf channel = <channelb> qs(0x6558a426) c = <drum_hit>
			default
			printf channel = <channel> qs(0xbcdd134e) c = <drum_hit>
			printf channel = <channelb> qs(0xbcdd134e) c = <drum_hit>
		endswitch
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelb> qs(0x8b73fd0e)
	endswitch
endscript

script print_machine_nostate_l 
	switch (<drum_l>)
		case 1
		printf channel = <channel> qs(0x49c200ee) c = <drum_hit>
		printf channel = <channelb> qs(0x7cb4aa01) c = <drum_hit>
		case 2
		printf channel = <channel> qs(0x7cb4aa01) c = <drum_hit>
		printf channel = <channelb> qs(0x5309c1c8) c = <drum_hit>
		case 3
		printf channel = <channel> qs(0x5309c1c8) c = <drum_hit>
		printf channel = <channelb> qs(0x49c200ee) c = <drum_hit>
		case 4
		printf channel = <channel> qs(0x5d924835) c = <drum_hit>
		printf channel = <channelb> qs(0x5d924835) c = <drum_hit>
		case 5
		printf channel = <channel> qs(0x97066e04) c = <drum_hit>
		printf channel = <channelb> qs(0x97066e04) c = <drum_hit>
		case 6
		printf channel = <channel> qs(0xc7b01e79) c = <drum_hit>
		printf channel = <channelb> qs(0xc7b01e79) c = <drum_hit>
		case 7
		printf channel = <channel> qs(0xa08b4081) c = <drum_hit>
		printf channel = <channelb> qs(0xa08b4081) c = <drum_hit>
		case 8
		printf channel = <channel> qs(0xd7e3dace) c = <drum_hit>
		printf channel = <channelb> qs(0xd7e3dace) c = <drum_hit>
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelb> qs(0x8b73fd0e)
	endswitch
endscript

script print_machine_state_l 
	switch (<drum_l>)
		case 1
		printf channel = <channel> qs(0x04f2dd36) c = <drum_hit>
		printf channel = <channelb> qs(0x318477d9) c = <drum_hit>
		case 2
		printf channel = <channel> qs(0x318477d9) c = <drum_hit>
		printf channel = <channelb> qs(0x1e391c10) c = <drum_hit>
		case 3
		printf channel = <channel> qs(0x1e391c10) c = <drum_hit>
		printf channel = <channelb> qs(0x04f2dd36) c = <drum_hit>
		case 4
		printf channel = <channel> qs(0x10a295ed) c = <drum_hit>
		printf channel = <channelb> qs(0x10a295ed) c = <drum_hit>
		case 5
		printf channel = <channel> qs(0xda36b3dc) c = <drum_hit>
		printf channel = <channelb> qs(0xda36b3dc) c = <drum_hit>
		case 6
		printf channel = <channel> qs(0x8a80c3a1) c = <drum_hit>
		printf channel = <channelb> qs(0x8a80c3a1) c = <drum_hit>
		case 7
		printf channel = <channel> qs(0xedbb9d59) c = <drum_hit>
		printf channel = <channelb> qs(0xedbb9d59) c = <drum_hit>
		case 8
		printf channel = <channel> qs(0x9ad30716) c = <drum_hit>
		printf channel = <channelb> qs(0x9ad30716) c = <drum_hit>
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelb> qs(0x8b73fd0e)
	endswitch
endscript

script print_machine_nostate_r 
	switch (<drum_r>)
		case 1
		printf channel = <channel> qs(0x33043019) c = <drum_hit>
		printf channel = <channelb> qs(0x6e1e8965) c = <drum_hit>
		case 2
		printf channel = <channel> qs(0x6e1e8965) c = <drum_hit>
		printf channel = <channelb> qs(0x2e2dfcd8) c = <drum_hit>
		case 3
		printf channel = <channel> qs(0x2e2dfcd8) c = <drum_hit>
		printf channel = <channelb> qs(0x33043019) c = <drum_hit>
		case 4
		printf channel = <channel> qs(0x8b34831e) c = <drum_hit>
		printf channel = <channelb> qs(0x8b34831e) c = <drum_hit>
		case 5
		printf channel = <channel> qs(0x95314101) c = <drum_hit>
		printf channel = <channelb> qs(0x95314101) c = <drum_hit>
		case 6
		printf channel = <channel> qs(0x7e60c687) c = <drum_hit>
		printf channel = <channelb> qs(0x7e60c687) c = <drum_hit>
		case 7
		printf channel = <channel> qs(0xca510bbe) c = <drum_hit>
		printf channel = <channelb> qs(0xca510bbe) c = <drum_hit>
		case 8
		printf channel = <channel> qs(0x0c0e39df) c = <drum_hit>
		printf channel = <channelb> qs(0x0c0e39df) c = <drum_hit>
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelb> qs(0x8b73fd0e)
	endswitch
endscript

script print_machine_state_r 
	switch (<drum_r>)
		case 1
		printf channel = <channel> qs(0x7e34edc1) c = <drum_hit>
		printf channel = <channelb> qs(0x232e54bd) c = <drum_hit>
		case 2
		printf channel = <channel> qs(0x232e54bd) c = <drum_hit>
		printf channel = <channelb> qs(0x631d2100) c = <drum_hit>
		case 3
		printf channel = <channel> qs(0x631d2100) c = <drum_hit>
		printf channel = <channelb> qs(0x7e34edc1) c = <drum_hit>
		case 4
		printf channel = <channel> qs(0xc6045ec6) c = <drum_hit>
		printf channel = <channelb> qs(0xc6045ec6) c = <drum_hit>
		case 5
		printf channel = <channel> qs(0xd8019cd9) c = <drum_hit>
		printf channel = <channelb> qs(0xd8019cd9) c = <drum_hit>
		case 6
		printf channel = <channel> qs(0x33501b5f) c = <drum_hit>
		printf channel = <channelb> qs(0x33501b5f) c = <drum_hit>
		case 7
		printf channel = <channel> qs(0x8761d666) c = <drum_hit>
		printf channel = <channelb> qs(0x8761d666) c = <drum_hit>
		case 8
		printf channel = <channel> qs(0x413ee407) c = <drum_hit>
		printf channel = <channelb> qs(0x413ee407) c = <drum_hit>
		default
		printf channel = <channel> qs(0x8b73fd0e)
		printf channel = <channelb> qs(0x8b73fd0e)
	endswitch
endscript

script printfpriorities 
	printf \{channel = drummer_logic
		qs(0xb7744d9f)}
	printf channel = drummer_logic qs(0x67e20154) a = <priority_1_l> c = <priority_1_r>
	printf channel = drummer_logic qs(0x67e20154) a = <priority_2_l> c = <priority_2_r>
	printf channel = drummer_logic qs(0x67e20154) a = <priority_3_l> c = <priority_3_r>
	printf channel = drummer_logic qs(0x67e20154) a = <priority_4_l> c = <priority_4_r>
	printf channel = drummer_logic qs(0x67e20154) a = <priority_5_l> c = <priority_5_r>
	printf channel = drummer_logic qs(0x67e20154) a = <priority_6_l> c = <priority_6_r>
	printf \{channel = drummer_logic
		qs(0xb0d23bc0)}
endscript

script printfnotestructure 
	printf channel = drummer_logic qs(0xabee5304) a = <drum_pattern_start> b = <drum_pattern_end>
	if ((<drum_pattern_exists> = true) && ((<drum_pattern_start> < 2) && (<drum_pattern_end> > 0)))
		printf \{channel = drummer_logic
			qs(0x537dabe2)}
	else
		printf \{channel = drummer_logic
			qs(0x36eaf80b)}
	endif
	printf channel = drummer_logic qs(0x84bf29d4) f = <time_to_hit_1>
	printf channel = drummer_logic qs(0x1b4c7d39) c = <num_pieces_hit_1>
	printf channel = drummer_logic qs(0xee058389) b = <pieces_value_1_1>
	printf channel = drummer_logic qs(0x608a846a) b = <pieces_value_1_2>
	if ((<drum_pattern_exists> = true) && ((<drum_pattern_start> < 3) && (<drum_pattern_end> > 1)))
		printf \{channel = drummer_logic
			qs(0x8da1c0a1)}
	else
		printf \{channel = drummer_logic
			qs(0x3f8e4fc3)}
	endif
	printf channel = drummer_logic qs(0x0a302e37) f = <time_to_hit_2>
	printf channel = drummer_logic qs(0xf07bc63a) c = <num_pieces_hit_2>
	printf channel = drummer_logic qs(0x999b5179) b = <pieces_value_2_1>
	printf channel = drummer_logic qs(0x1714569a) b = <pieces_value_2_2>
	if ((<drum_pattern_exists> = true) && ((<drum_pattern_start> < 4) && (<drum_pattern_end> > 2)))
		printf \{channel = drummer_logic
			qs(0x8da1c0a1)}
	else
		printf \{channel = drummer_logic
			qs(0x3f8e4fc3)}
	endif
	printf channel = drummer_logic qs(0xc69a2ea9) f = <time_to_hit_3>
	printf channel = drummer_logic qs(0x1fb9ad04) c = <num_pieces_hit_3>
	printf channel = drummer_logic qs(0x023e1d16) b = <pieces_value_3_1>
	printf channel = drummer_logic qs(0x8cb11af5) b = <pieces_value_3_2>
	if ((<drum_pattern_exists> = true) && ((<drum_pattern_start> < 5) && (<drum_pattern_end> > 3)))
		printf \{channel = drummer_logic
			qs(0x8da1c0a1)}
	else
		printf \{channel = drummer_logic
			qs(0x3f8e4fc3)}
	endif
	printf channel = drummer_logic qs(0xcc5f27b0) f = <time_to_hit_4>
	printf channel = drummer_logic qs(0xfd65b67d) c = <num_pieces_hit_4>
	printf channel = drummer_logic qs(0x76a6f499) b = <pieces_value_4_1>
	printf channel = drummer_logic qs(0xf829f37a) b = <pieces_value_4_2>
	if ((<drum_pattern_exists> = true) && ((<drum_pattern_start> < 6) && (<drum_pattern_end> > 4)))
		printf \{channel = drummer_logic
			qs(0x8da1c0a1)}
	else
		printf \{channel = drummer_logic
			qs(0x3f8e4fc3)}
	endif
	printf channel = drummer_logic qs(0x00f5272e) f = <time_to_hit_5>
	printf channel = drummer_logic qs(0x12a7dd43) c = <num_pieces_hit_5>
	printf channel = drummer_logic qs(0xed03b8f6) b = <pieces_value_5_1>
	printf channel = drummer_logic qs(0x638cbf15) b = <pieces_value_5_2>
	if ((<drum_pattern_exists> = true) && ((<drum_pattern_start> < 7) && (<drum_pattern_end> > 5)))
		printf \{channel = drummer_logic
			qs(0x8da1c0a1)}
	else
		printf \{channel = drummer_logic
			qs(0x3f8e4fc3)}
	endif
	printf channel = drummer_logic qs(0x8e7a20cd) f = <time_to_hit_6>
	printf channel = drummer_logic qs(0xf9906640) c = <num_pieces_hit_6>
	printf channel = drummer_logic qs(0x9a9d6a06) b = <pieces_value_6_1>
	printf channel = drummer_logic qs(0x14126de5) b = <pieces_value_6_2>
endscript

script printfassignprinter 
	if ((<start_hit_l> = true) && (<start_hit_r> = true))
		drum_l = (<drum_current_value_l>)
		drum_r = (<drum_current_value_r>)
		channel = drummer_record_crossed
		channelb = drummer_record
		if (<drum_was_patterned> = true)
			print_machine_state drum_l = <drum_l> drum_r = <drum_r> drum_hit = <drum_hit> channel = <channel> channelb = <channelb> drum_hit = <drum_hit>
		else
			print_machine_nostate drum_l = <drum_l> drum_r = <drum_r> drum_hit = <drum_hit> channel = <channel> channelb = <channelb> drum_hit = <drum_hit>
		endif
	elseif (<start_hit_l> = true)
		drum_l = (<drum_current_value_l>)
		channel = drummer_record_crossed
		channelb = drummer_record
		if (<drum_was_patterned> = true)
			print_machine_state_l drum_l = <drum_l> drum_hit = <drum_hit> channel = <channel> channelb = <channelb> drum_hit = <drum_hit>
		else
			print_machine_nostate_l drum_l = <drum_l> drum_hit = <drum_hit> channel = <channel> channelb = <channelb> drum_hit = <drum_hit>
		endif
	elseif (<start_hit_r> = true)
		drum_r = (<drum_current_value_r>)
		channel = drummer_record_crossed
		channelb = drummer_record
		if (<drum_was_patterned> = true)
			print_machine_state_r drum_r = <drum_r> drum_hit = <drum_hit> channel = <channel> channelb = <channelb> drum_hit = <drum_hit>
		else
			print_machine_nostate_r drum_r = <drum_r> drum_hit = <drum_hit> channel = <channel> channelb = <channelb> drum_hit = <drum_hit>
		endif
	else
	endif
	drum_l = <pieces_value_1_1>
	drum_r = <pieces_value_1_2>
	channel = drummer_actual
	print_machine_drumpieces drum_l = <drum_l> drum_r = <drum_r> drum_hit = <drum_hit> channel = <channel> drum_hit = (<drum_hit> + 1)
endscript

script printfgraphview 
	graph = (<test> * 80)
	CastToInteger \{graph}
	switch <graph>
		case 0
		printf channel = <channel> qs(0x6c159a5a) b = <test> c = <Timer>
		case 1
		printf channel = <channel> qs(0xbd3c1a77) b = <test> c = <Timer>
		case 2
		printf channel = <channel> qs(0xdbf76810) b = <test> c = <Timer>
		case 3
		printf channel = <channel> qs(0x455c21e5) b = <test> c = <Timer>
		case 4
		printf channel = <channel> qs(0x239fbfd3) b = <test> c = <Timer>
		case 5
		printf channel = <channel> qs(0x3c58db6b) b = <test> c = <Timer>
		case 6
		printf channel = <channel> qs(0x6c9e6c7b) b = <test> c = <Timer>
		case 7
		printf channel = <channel> qs(0xa63cbd86) b = <test> c = <Timer>
		case 8
		printf channel = <channel> qs(0x020c3b51) b = <test> c = <Timer>
		case 9
		printf channel = <channel> qs(0x4e2e451a) b = <test> c = <Timer>
		case 10
		printf channel = <channel> qs(0x24ef233f) b = <test> c = <Timer>
		case 11
		printf channel = <channel> qs(0xd3bdbb7b) b = <test> c = <Timer>
		case 12
		printf channel = <channel> qs(0xa95bc694) b = <test> c = <Timer>
		case 13
		printf channel = <channel> qs(0x5d60beca) b = <test> c = <Timer>
		case 14
		printf channel = <channel> qs(0x457f8289) b = <test> c = <Timer>
		case 15
		printf channel = <channel> qs(0x59940024) b = <test> c = <Timer>
		case 16
		printf channel = <channel> qs(0xb2f883b5) b = <test> c = <Timer>
		case 17
		printf channel = <channel> qs(0xda4b99e9) b = <test> c = <Timer>
		case 18
		printf channel = <channel> qs(0x18e9ac7e) b = <test> c = <Timer>
		case 19
		printf channel = <channel> qs(0xb87a8cbc) b = <test> c = <Timer>
		case 20
		printf channel = <channel> qs(0xd16f6232) b = <test> c = <Timer>
		case 21
		printf channel = <channel> qs(0xffd78aa4) b = <test> c = <Timer>
		case 22
		printf channel = <channel> qs(0x6075566c) b = <test> c = <Timer>
		case 23
		printf channel = <channel> qs(0xef08747c) b = <test> c = <Timer>
		case 24
		printf channel = <channel> qs(0xe4a0dfab) b = <test> c = <Timer>
		case 25
		printf channel = <channel> qs(0x4c40932c) b = <test> c = <Timer>
		case 26
		printf channel = <channel> qs(0xd731ecbd) b = <test> c = <Timer>
		case 27
		printf channel = <channel> qs(0xb03d65e0) b = <test> c = <Timer>
		case 28
		printf channel = <channel> qs(0xc8cb0f44) b = <test> c = <Timer>
		case 29
		printf channel = <channel> qs(0xbf2f0595) b = <test> c = <Timer>
		case 30
		printf channel = <channel> qs(0xe663161d) b = <test> c = <Timer>
		case 31
		printf channel = <channel> qs(0xc7961ac4) b = <test> c = <Timer>
		case 32
		printf channel = <channel> qs(0x3b804e6f) b = <test> c = <Timer>
		case 33
		printf channel = <channel> qs(0xed4c59c6) b = <test> c = <Timer>
		case 34
		printf channel = <channel> qs(0x83d984d2) b = <test> c = <Timer>
		case 35
		printf channel = <channel> qs(0x8c31654a) b = <test> c = <Timer>
		case 36
		printf channel = <channel> qs(0x2c491f0d) b = <test> c = <Timer>
		case 37
		printf channel = <channel> qs(0xb3117acb) b = <test> c = <Timer>
		case 38
		printf channel = <channel> qs(0x8a5f3bc5) b = <test> c = <Timer>
		case 39
		printf channel = <channel> qs(0xcaf280a5) b = <test> c = <Timer>
		case 40
		printf channel = <channel> qs(0x7d70c77d) b = <test> c = <Timer>
		case 41
		printf channel = <channel> qs(0x98635e4d) b = <test> c = <Timer>
		case 42
		printf channel = <channel> qs(0xf89233ff) b = <test> c = <Timer>
		case 43
		printf channel = <channel> qs(0x1f8fcc54) b = <test> c = <Timer>
		case 44
		printf channel = <channel> qs(0xc796a973) b = <test> c = <Timer>
		case 45
		printf channel = <channel> qs(0x88374e6f) b = <test> c = <Timer>
		case 46
		printf channel = <channel> qs(0x2c055062) b = <test> c = <Timer>
		case 47
		printf channel = <channel> qs(0x956e24ea) b = <test> c = <Timer>
		case 48
		printf channel = <channel> qs(0x58856c60) b = <test> c = <Timer>
		case 49
		printf channel = <channel> qs(0x15784844) b = <test> c = <Timer>
		case 50
		printf channel = <channel> qs(0x8ff67ae7) b = <test> c = <Timer>
		case 51
		printf channel = <channel> qs(0x606d1449) b = <test> c = <Timer>
		case 52
		printf channel = <channel> qs(0x1a6a03ab) b = <test> c = <Timer>
		case 53
		printf channel = <channel> qs(0x8ac463be) b = <test> c = <Timer>
		case 54
		printf channel = <channel> qs(0xf64b3065) b = <test> c = <Timer>
		case 55
		printf channel = <channel> qs(0xf9b4ce97) b = <test> c = <Timer>
		case 56
		printf channel = <channel> qs(0xf118f74e) b = <test> c = <Timer>
		case 57
		printf channel = <channel> qs(0x94f11170) b = <test> c = <Timer>
		case 58
		printf channel = <channel> qs(0x18345e0c) b = <test> c = <Timer>
		case 59
		printf channel = <channel> qs(0x477445d3) b = <test> c = <Timer>
		case 60
		printf channel = <channel> qs(0xaa29ffb4) b = <test> c = <Timer>
		case 61
		printf channel = <channel> qs(0xeff63c37) b = <test> c = <Timer>
		case 62
		printf channel = <channel> qs(0x78f0a933) b = <test> c = <Timer>
		case 63
		printf channel = <channel> qs(0x8f4c4050) b = <test> c = <Timer>
		case 64
		printf channel = <channel> qs(0x8aec11bd) b = <test> c = <Timer>
		case 65
		printf channel = <channel> qs(0x86f0ae5d) b = <test> c = <Timer>
		case 66
		printf channel = <channel> qs(0x28643a33) b = <test> c = <Timer>
		case 67
		printf channel = <channel> qs(0x091ca71e) b = <test> c = <Timer>
		case 68
		printf channel = <channel> qs(0x6cf306aa) b = <test> c = <Timer>
		case 69
		printf channel = <channel> qs(0x11095693) b = <test> c = <Timer>
		case 70
		printf channel = <channel> qs(0xbd78a389) b = <test> c = <Timer>
		case 71
		printf channel = <channel> qs(0x66241b7c) b = <test> c = <Timer>
		case 72
		printf channel = <channel> qs(0xaf2a3672) b = <test> c = <Timer>
		case 73
		printf channel = <channel> qs(0xcf314fb1) b = <test> c = <Timer>
		case 74
		printf channel = <channel> qs(0xe91a899e) b = <test> c = <Timer>
		case 75
		printf channel = <channel> qs(0x7d99f7cd) b = <test> c = <Timer>
		case 76
		printf channel = <channel> qs(0x806379c3) b = <test> c = <Timer>
		case 77
		printf channel = <channel> qs(0x2537df81) b = <test> c = <Timer>
		case 78
		printf channel = <channel> qs(0xe8e7f6f9) b = <test> c = <Timer>
		case 79
		printf channel = <channel> qs(0xaac81afd) b = <test> c = <Timer>
		case 80
		printf channel = <channel> qs(0x63ac87d4) b = <test> c = <Timer>
		default
		printf channel = <channel> qs(0x16c756f5) a = <test> b = <Timer>
	endswitch
endscript

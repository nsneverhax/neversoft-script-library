
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
	channel = mydebug
	printf channel = <channel> qs(0xb7744d9f)
	printf channel = <channel> qs(0x67e20154) a = <priority_1_l> c = <priority_1_r>
	printf channel = <channel> qs(0x67e20154) a = <priority_2_l> c = <priority_2_r>
	printf channel = <channel> qs(0x67e20154) a = <priority_3_l> c = <priority_3_r>
	printf channel = <channel> qs(0x67e20154) a = <priority_4_l> c = <priority_4_r>
	printf channel = <channel> qs(0x67e20154) a = <priority_5_l> c = <priority_5_r>
	printf channel = <channel> qs(0x67e20154) a = <priority_6_l> c = <priority_6_r>
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
	graph = 0.0
	integer_value = 0
	graph = (<graphme> * 80)
	converttointeger floatvalue = <graph>
	switch <integer_value>
		case 0
		printf channel = <channel> qs(0x2a32bc7c) b = <graphme> d = <more3> a = <more> c = <more2>
		case 1
		printf channel = <channel> qs(0x6d843998) b = <graphme> d = <more3> a = <more> c = <more2>
		case 2
		printf channel = <channel> qs(0x2402012a) b = <graphme> d = <more3> a = <more> c = <more2>
		case 3
		printf channel = <channel> qs(0x8eedcd69) b = <graphme> d = <more3> a = <more> c = <more2>
		case 4
		printf channel = <channel> qs(0xdb4faea4) b = <graphme> d = <more3> a = <more> c = <more2>
		case 5
		printf channel = <channel> qs(0xf98b7840) b = <graphme> d = <more3> a = <more> c = <more2>
		case 6
		printf channel = <channel> qs(0x350f7c7a) b = <graphme> d = <more3> a = <more> c = <more2>
		case 7
		printf channel = <channel> qs(0x4efa2ea2) b = <graphme> d = <more3> a = <more> c = <more2>
		case 8
		printf channel = <channel> qs(0x33a197ce) b = <graphme> d = <more3> a = <more> c = <more2>
		case 9
		printf channel = <channel> qs(0xa7161c75) b = <graphme> d = <more3> a = <more> c = <more2>
		case 10
		printf channel = <channel> qs(0xc1dd6e12) b = <graphme> d = <more3> a = <more> c = <more2>
		case 11
		printf channel = <channel> qs(0x5f7627e7) b = <graphme> d = <more3> a = <more> c = <more2>
		case 12
		printf channel = <channel> qs(0x39b5b9d1) b = <graphme> d = <more3> a = <more> c = <more2>
		case 13
		printf channel = <channel> qs(0x2672dd69) b = <graphme> d = <more3> a = <more> c = <more2>
		case 14
		printf channel = <channel> qs(0x76b46a79) b = <graphme> d = <more3> a = <more> c = <more2>
		case 15
		printf channel = <channel> qs(0xbc16bb84) b = <graphme> d = <more3> a = <more> c = <more2>
		case 16
		printf channel = <channel> qs(0x18263d53) b = <graphme> d = <more3> a = <more> c = <more2>
		case 17
		printf channel = <channel> qs(0x54044318) b = <graphme> d = <more3> a = <more> c = <more2>
		case 18
		printf channel = <channel> qs(0x3ec5253d) b = <graphme> d = <more3> a = <more> c = <more2>
		case 19
		printf channel = <channel> qs(0xc997bd79) b = <graphme> d = <more3> a = <more> c = <more2>
		case 20
		printf channel = <channel> qs(0x3f5589bc) b = <graphme> d = <more3> a = <more> c = <more2>
		case 21
		printf channel = <channel> qs(0x474ab8c8) b = <graphme> d = <more3> a = <more> c = <more2>
		case 22
		printf channel = <channel> qs(0x5f55848b) b = <graphme> d = <more3> a = <more> c = <more2>
		case 23
		printf channel = <channel> qs(0x43be0626) b = <graphme> d = <more3> a = <more> c = <more2>
		case 24
		printf channel = <channel> qs(0xa8d285b7) b = <graphme> d = <more3> a = <more> c = <more2>
		case 25
		printf channel = <channel> qs(0xc0619feb) b = <graphme> d = <more3> a = <more> c = <more2>
		case 26
		printf channel = <channel> qs(0x02c3aa7c) b = <graphme> d = <more3> a = <more> c = <more2>
		case 27
		printf channel = <channel> qs(0xa2508abe) b = <graphme> d = <more3> a = <more> c = <more2>
		case 28
		printf channel = <channel> qs(0x69bbd0bd) b = <graphme> d = <more3> a = <more> c = <more2>
		case 29
		printf channel = <channel> qs(0xe5fd8ca6) b = <graphme> d = <more3> a = <more> c = <more2>
		case 30
		printf channel = <channel> qs(0x7a5f506e) b = <graphme> d = <more3> a = <more> c = <more2>
		case 31
		printf channel = <channel> qs(0xf522727e) b = <graphme> d = <more3> a = <more> c = <more2>
		case 32
		printf channel = <channel> qs(0xfe8ad9a9) b = <graphme> d = <more3> a = <more> c = <more2>
		case 33
		printf channel = <channel> qs(0x566a952e) b = <graphme> d = <more3> a = <more> c = <more2>
		case 34
		printf channel = <channel> qs(0xcd1beabf) b = <graphme> d = <more3> a = <more> c = <more2>
		case 35
		printf channel = <channel> qs(0xaa1763e2) b = <graphme> d = <more3> a = <more> c = <more2>
		case 36
		printf channel = <channel> qs(0xd2e10946) b = <graphme> d = <more3> a = <more> c = <more2>
		case 37
		printf channel = <channel> qs(0xa5050397) b = <graphme> d = <more3> a = <more> c = <more2>
		case 38
		printf channel = <channel> qs(0xfc49101f) b = <graphme> d = <more3> a = <more> c = <more2>
		case 39
		printf channel = <channel> qs(0xddbc1cc6) b = <graphme> d = <more3> a = <more> c = <more2>
		case 40
		printf channel = <channel> qs(0xd38c3751) b = <graphme> d = <more3> a = <more> c = <more2>
		case 41
		printf channel = <channel> qs(0xf7665fc4) b = <graphme> d = <more3> a = <more> c = <more2>
		case 42
		printf channel = <channel> qs(0x99f382d0) b = <graphme> d = <more3> a = <more> c = <more2>
		case 43
		printf channel = <channel> qs(0x961b6348) b = <graphme> d = <more3> a = <more> c = <more2>
		case 44
		printf channel = <channel> qs(0x3663190f) b = <graphme> d = <more3> a = <more> c = <more2>
		case 45
		printf channel = <channel> qs(0xa93b7cc9) b = <graphme> d = <more3> a = <more> c = <more2>
		case 46
		printf channel = <channel> qs(0x90753dc7) b = <graphme> d = <more3> a = <more> c = <more2>
		case 47
		printf channel = <channel> qs(0xd0d886a7) b = <graphme> d = <more3> a = <more> c = <more2>
		case 48
		printf channel = <channel> qs(0x67b9e961) b = <graphme> d = <more3> a = <more> c = <more2>
		case 49
		printf channel = <channel> qs(0x8249584f) b = <graphme> d = <more3> a = <more> c = <more2>
		case 50
		printf channel = <channel> qs(0xe2b835fd) b = <graphme> d = <more3> a = <more> c = <more2>
		case 51
		printf channel = <channel> qs(0x05a5ca56) b = <graphme> d = <more3> a = <more> c = <more2>
		case 52
		printf channel = <channel> qs(0xddbcaf71) b = <graphme> d = <more3> a = <more> c = <more2>
		case 53
		printf channel = <channel> qs(0x921d486d) b = <graphme> d = <more3> a = <more> c = <more2>
		case 54
		printf channel = <channel> qs(0x362f5660) b = <graphme> d = <more3> a = <more> c = <more2>
		case 55
		printf channel = <channel> qs(0x8f4422e8) b = <graphme> d = <more3> a = <more> c = <more2>
		case 56
		printf channel = <channel> qs(0x42af6a62) b = <graphme> d = <more3> a = <more> c = <more2>
		case 57
		printf channel = <channel> qs(0x0f524e46) b = <graphme> d = <more3> a = <more> c = <more2>
		case 58
		printf channel = <channel> qs(0x95dc7ce5) b = <graphme> d = <more3> a = <more> c = <more2>
		case 59
		printf channel = <channel> qs(0x7a47124b) b = <graphme> d = <more3> a = <more> c = <more2>
		case 60
		printf channel = <channel> qs(0x22946f34) b = <graphme> d = <more3> a = <more> c = <more2>
		case 61
		printf channel = <channel> qs(0x90ee65bc) b = <graphme> d = <more3> a = <more> c = <more2>
		case 62
		printf channel = <channel> qs(0xec613667) b = <graphme> d = <more3> a = <more> c = <more2>
		case 63
		printf channel = <channel> qs(0xe39ec895) b = <graphme> d = <more3> a = <more> c = <more2>
		case 64
		printf channel = <channel> qs(0xeb32f14c) b = <graphme> d = <more3> a = <more> c = <more2>
		case 65
		printf channel = <channel> qs(0x8edb1772) b = <graphme> d = <more3> a = <more> c = <more2>
		case 66
		printf channel = <channel> qs(0x021e580e) b = <graphme> d = <more3> a = <more> c = <more2>
		case 67
		printf channel = <channel> qs(0x5d5e43d1) b = <graphme> d = <more3> a = <more> c = <more2>
		case 68
		printf channel = <channel> qs(0x11d50ffc) b = <graphme> d = <more3> a = <more> c = <more2>
		case 69
		printf channel = <channel> qs(0xf5dc3a35) b = <graphme> d = <more3> a = <more> c = <more2>
		case 70
		printf channel = <channel> qs(0x62daaf31) b = <graphme> d = <more3> a = <more> c = <more2>
		case 71
		printf channel = <channel> qs(0x95664652) b = <graphme> d = <more3> a = <more> c = <more2>
		case 72
		printf channel = <channel> qs(0x90c617bf) b = <graphme> d = <more3> a = <more> c = <more2>
		case 73
		printf channel = <channel> qs(0x9cdaa85f) b = <graphme> d = <more3> a = <more> c = <more2>
		case 74
		printf channel = <channel> qs(0x324e3c31) b = <graphme> d = <more3> a = <more> c = <more2>
		case 75
		printf channel = <channel> qs(0x1336a11c) b = <graphme> d = <more3> a = <more> c = <more2>
		case 76
		printf channel = <channel> qs(0x76d900a8) b = <graphme> d = <more3> a = <more> c = <more2>
		case 77
		printf channel = <channel> qs(0x0b235091) b = <graphme> d = <more3> a = <more> c = <more2>
		case 78
		printf channel = <channel> qs(0xa752a58b) b = <graphme> d = <more3> a = <more> c = <more2>
		case 79
		printf channel = <channel> qs(0x7c0e1d7e) b = <graphme> d = <more3> a = <more> c = <more2>
		case 80
		printf channel = <channel> qs(0x4fa2cb43) b = <graphme> d = <more3> a = <more> c = <more2>
		default
		printf channel = <channel> qs(0x16b16129) b = <graphme> d = <more3> a = <more> c = <more2>
	endswitch
	graphme = 0.0
	graph = 0
	channel = Name
	more3 = 0.0
	more = 0.0
	more2 = 0.0
endscript

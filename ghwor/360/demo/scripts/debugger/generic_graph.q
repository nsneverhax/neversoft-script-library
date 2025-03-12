
script generic_graph_printer \{extra1 = 0.0
		extra2 = 0.0
		extra3 = 0.0
		graph_high = 1.0
		graph_low = 0.0
		channel = mydebug}
	original = <graphme>
	if (<graphme> > <graph_high>)
		graphme = <graph_high>
	elseif (<graphme> < <graph_low>)
		graphme = <graph_low>
	endif
	percent = ((<graphme> - <graph_low>) / (<graph_high> - <graph_low>))
	final = (<percent> * 80.0)
	integer_value = 0
	converttointeger float_value = <final>
	switch <integer_value>
		case 0
		printf channel = <channel> qs(0xedf80f23) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 1
		printf channel = <channel> qs(0x54e7e356) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 2
		printf channel = <channel> qs(0x25cdfdc7) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 3
		printf channel = <channel> qs(0xda170907) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 4
		printf channel = <channel> qs(0x24e63425) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 5
		printf channel = <channel> qs(0x6d600c97) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 6
		printf channel = <channel> qs(0xc78fc0d4) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 7
		printf channel = <channel> qs(0x922da319) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 8
		printf channel = <channel> qs(0xb0e975fd) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 9
		printf channel = <channel> qs(0x7c6d71c7) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 10
		printf channel = <channel> qs(0x0798231f) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 11
		printf channel = <channel> qs(0x7ac39a73) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 12
		printf channel = <channel> qs(0xee7411c8) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 13
		printf channel = <channel> qs(0x88bf63af) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 14
		printf channel = <channel> qs(0x16142a5a) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 15
		printf channel = <channel> qs(0x70d7b46c) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 16
		printf channel = <channel> qs(0x6f10d0d4) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 17
		printf channel = <channel> qs(0x3fd667c4) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 18
		printf channel = <channel> qs(0xf574b639) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 19
		printf channel = <channel> qs(0x514430ee) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 20
		printf channel = <channel> qs(0x29cd8840) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 21
		printf channel = <channel> qs(0x77a72880) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 22
		printf channel = <channel> qs(0x80f5b0c4) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 23
		printf channel = <channel> qs(0xfa13cd2b) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 24
		printf channel = <channel> qs(0x0e28b575) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 25
		printf channel = <channel> qs(0x16378936) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 26
		printf channel = <channel> qs(0x0adc0b9b) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 27
		printf channel = <channel> qs(0xe1b0880a) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 28
		printf channel = <channel> qs(0x89039256) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 29
		printf channel = <channel> qs(0x4ba1a7c1) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 30
		printf channel = <channel> qs(0xeb328703) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 31
		printf channel = <channel> qs(0x20d9dd00) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 32
		printf channel = <channel> qs(0xac9f811b) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 33
		printf channel = <channel> qs(0x333d5dd3) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 34
		printf channel = <channel> qs(0xbc407fc3) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 35
		printf channel = <channel> qs(0xb7e8d414) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 36
		printf channel = <channel> qs(0x1f089893) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 37
		printf channel = <channel> qs(0x8479e702) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 38
		printf channel = <channel> qs(0xe3756e5f) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 39
		printf channel = <channel> qs(0x9b8304fb) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 40
		printf channel = <channel> qs(0xd744e9be) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 41
		printf channel = <channel> qs(0xb52b1da2) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 42
		printf channel = <channel> qs(0x94de117b) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 43
		printf channel = <channel> qs(0x68c845d0) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 44
		printf channel = <channel> qs(0xbe045279) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 45
		printf channel = <channel> qs(0xd0918f6d) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 46
		printf channel = <channel> qs(0xdf796ef5) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 47
		printf channel = <channel> qs(0x7f0114b2) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 48
		printf channel = <channel> qs(0xe0597174) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 49
		printf channel = <channel> qs(0xd917307a) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 50
		printf channel = <channel> qs(0x99ba8b1a) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 51
		printf channel = <channel> qs(0x2edbe4dc) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 52
		printf channel = <channel> qs(0xcb2b55f2) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 53
		printf channel = <channel> qs(0xabda3840) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 54
		printf channel = <channel> qs(0x4cc7c7eb) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 55
		printf channel = <channel> qs(0x94dea2cc) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 56
		printf channel = <channel> qs(0xdb7f45d0) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 57
		printf channel = <channel> qs(0x7f4d5bdd) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 58
		printf channel = <channel> qs(0xc6262f55) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 59
		printf channel = <channel> qs(0x0bcd67df) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 60
		printf channel = <channel> qs(0xa6b595ca) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 61
		printf channel = <channel> qs(0xdcbe7158) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 62
		printf channel = <channel> qs(0x33251ff6) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 63
		printf channel = <channel> qs(0x49220814) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 64
		printf channel = <channel> qs(0xd98c6801) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 65
		printf channel = <channel> qs(0xa5033bda) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 66
		printf channel = <channel> qs(0xaafcc528) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 67
		printf channel = <channel> qs(0xa250fcf1) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 68
		printf channel = <channel> qs(0xc7b91acf) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 69
		printf channel = <channel> qs(0x4b7c55b3) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 70
		printf channel = <channel> qs(0x143c4e6c) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 71
		printf channel = <channel> qs(0x58b70241) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 72
		printf channel = <channel> qs(0xbcbe3788) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 73
		printf channel = <channel> qs(0x2bb8a28c) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 74
		printf channel = <channel> qs(0xdc044bef) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 75
		printf channel = <channel> qs(0xd9a41a02) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 76
		printf channel = <channel> qs(0xd5b8a5e2) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 77
		printf channel = <channel> qs(0x7b2c318c) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 78
		printf channel = <channel> qs(0x5a54aca1) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 79
		printf channel = <channel> qs(0x3fbb0d15) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		case 80
		printf channel = <channel> qs(0xa07a6eeb) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
		default
		printf channel = <channel> qs(0x124328ae) p = <percent> a = <original> b = <extra1> c = <extra2> d = <extra3>
	endswitch
	graphme = 0.0
	final = 0.0
	percent = 0.0
endscript

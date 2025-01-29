string_ps2_CAUTION = qs(0xb3d16ef9)
string_ps2_MEMORY_CARD_ERROR = qs(0x79597197)
string_ps2_SAVE_NOT_FOUND = qs(0xaf217c7b)
0x27e4f29a = qs(0x14d209cb)
string_ps2_FORMATTING = qs(0xaf23ce9b)
string_ps2_STEREO = qs(0x842009ee)
string_ps2_MONO = qs(0xda6133d7)
0x443b47fa = qs(0xef56c412)
0xffc807ec = qs(0x609993ba)
0x81251732 = qs(0xc40aec34)
0x8ab3fab5 = qs(0x1c3067d4)
0x5bcdb56c = qs(0x1f0c041a)
0x225027e2 = qs(0x4775c198)
0xebbfe2a9 = qs(0xe116f6ac)
0x64eabe1f = qs(0x6d83d9d1)
0x1e74a735 = qs(0x7716d78c)
0xbeceae2f = qs(0xda0aedbd)
0xbf4a7e61 = qs(0x79b97466)
0xe31ed55d = qs(0x4546f57c)
0x80d5c02e = qs(0xb294f5a0)
0x603b76f0 = qs(0x4a46ca6d)
0x4b8010e3 = qs(0x2ac0d831)
0x874323c2 = qs(0x1d50fbb9)
0xe74a2d65 = qs(0x37f773d2)
0x9b0358ac = qs(0x7cedf58b)
0x3c50afc7 = qs(0xcac12143)
0x8fab62cc = qs(0xc8cc661c)
0xe51bf3a8 = qs(0xe35ecdca)

script get_string_ps2 \{message = unknown}
	localized_string = qs(0x03ac90f0)
	switch <message>
		case loading
		if IsPAL
			localized_string = qs(0x49e38ed3)
		else
			localized_string = qs(0x88e5f32c)
		endif
		case saving
		if IsPAL
			localized_string = qs(0x427e77b2)
		else
			localized_string = qs(0x83780a4d)
		endif
		case autosaving
		if IsPAL
			localized_string = qs(0x9229e672)
		else
			localized_string = qs(0x532f9b8d)
		endif
		case overwriting
		if IsPAL
			localized_string = qs(0x1718e7da)
		else
			localized_string = qs(0xd61e9a25)
		endif
		case formatting
		if IsPAL
			localized_string = qs(0xab25977e)
		else
			localized_string = qs(0xbd4e94f0)
		endif
		case deleting
		if IsPAL
			localized_string = qs(0x6a060dbf)
		else
			localized_string = qs(0xab007040)
		endif
		case load_successful
		localized_string = qs(0x627e3b93)
		case format_successful
		localized_string = qs(0x699ece64)
		case save_successful
		localized_string = qs(0x6dd9a39e)
		case overwrite_successful
		localized_string = qs(0xe2a6d737)
		case delete_successful
		localized_string = qs(0xf06f3a47)
		case boot_autosave_warning
		if IsPAL
			localized_string = qs(0x1fe353c3)
		else
			localized_string = qs(0xe2e5fa87)
		endif
		case check_memcard
		if IsPAL
			localized_string = qs(0x14327676)
		else
			localized_string = qs(0x025975f8)
		endif
		case no_memcard_boot
		if IsPAL
			localized_string = qs(0x4cda80b0)
		else
			localized_string = qs(0x6c2fbfb9)
		endif
		case no_memcard_save_boot
		if IsPAL
			localized_string = qs(0x17c4a791)
		else
			localized_string = qs(0xe5d7b154)
		endif
		case no_save_boot
		if IsPAL
			localized_string = qs(0x3d84abc3)
		else
			localized_string = qs(0x2cc9f470)
		endif
		case no_save_ingame
		if IsPAL
			localized_string = qs(0xd7040b25)
		else
			localized_string = qs(0xf65d2ba0)
		endif
		case save_failed
		if IsPAL
			localized_string = qs(0x353f4dd7)
		else
			localized_string = qs(0x3c68adbb)
		endif
		case overwrite_failed
		if IsPAL
			localized_string = qs(0xc34afcc5)
		else
			localized_string = qs(0xca1d1ca9)
		endif
		case attempt_format
		if IsPAL
			localized_string = qs(0xafc70f0b)
		else
			localized_string = qs(0x5d829588)
		endif
		case confirm_format
		if IsPAL
			localized_string = qs(0x318c438f)
		else
			localized_string = qs(0x10d5630a)
		endif
		case already_formatted
		if IsPAL
			localized_string = qs(0x52a0a41c)
		else
			localized_string = qs(0xe9cceef2)
		endif
		case format_failed
		if IsPAL
			localized_string = qs(0xdeae6dc5)
		else
			localized_string = qs(0x76c2d524)
		endif
		case format_cancelled
		localized_string = qs(0x84946897)
		case no_memcard_ingame
		if IsPAL
			localized_string = qs(0xc48e91d1)
		else
			localized_string = qs(0xe5d7b154)
		endif
		case load_failed
		if IsPAL
			localized_string = qs(0x875a0ad5)
		else
			localized_string = qs(0x8e0deab9)
		endif
		case overwrite_warning_boot
		if IsPAL
			localized_string = qs(0xa4650ae7)
		else
			localized_string = qs(0xe92fa81c)
		endif
		case disable_autosave
		localized_string = qs(0xc9c0f19a)
		case overwrite_warning_ingame
		if IsPAL
			localized_string = qs(0x2ef63043)
		else
			localized_string = qs(0x37ef1d18)
		endif
		case lose_progress_ingame
		if IsPAL
			localized_string = qs(0x154459d0)
		else
			localized_string = qs(0xacd40200)
		endif
		case insufficient_space_boot
		if IsPAL
			localized_string = qs(0xb3d5eac3)
		else
			localized_string = qs(0xaea78223)
		endif
		case insufficient_space_ingame
		if IsPAL
			localized_string = qs(0x7ac7c286)
		else
			localized_string = qs(0x61087541)
		endif
		case corrupt_boot
		if IsPAL
			localized_string = qs(0x54002aff)
		else
			localized_string = qs(0x17e23a7f)
		endif
		case 0x8f9625eb
		if IsPAL
			localized_string = qs(0xddaa210d)
		else
			localized_string = qs(0xfcf30188)
		endif
		case confirm_overwrite_boot
		localized_string = qs(0x709d9856)
		case new_memcard_boot
		if IsPAL
			localized_string = qs(0xc70078c7)
		else
			localized_string = qs(0xc68e0ec5)
		endif
		case new_memcard_ingame
		if IsPAL
			localized_string = qs(0x500b93e1)
		else
			localized_string = qs(0xc68e0ec5)
		endif
		case warning_480p
		localized_string = qs(0xbcee917d)
		case now_in_480p
		localized_string = qs(0x3ac61ab5)
		case widescreen_string
		localized_string = qs(0x16589c40)
		case progressivescan_string
		localized_string = qs(0xaec6cab2)
		default

		localized_string = qs(0x03ac90f0)
	endswitch
	return localized_string = <localized_string>
endscript
string_ps2_fowlvis_blurb = qs(0x219f5824)
string_ps2_fowlvis_outfit_style_1 = qs(0xa20d4ae8)
string_ps2_fowlvis_outfit_style_2 = qs(0x36829412)
string_ps2_fowlvis_outfit_style_3 = qs(0x1b4cbbc1)
string_ps2_fowlvis_outfit_style_4 = qs(0xe3da9943)
string_ps2_robot_blurb = qs(0x6cec1c19)
string_ps2_robot_outfit_style_1 = qs(0x6921effd)
string_ps2_robot_outfit_style_2 = qs(0xcd3db0bc)
string_ps2_robot_outfit_style_3 = qs(0xf2a8898f)
string_ps2_robot_outfit_style_4 = qs(0xacb247f6)
string_ps2_instrument_budcat_blurb = qs(0x4cddb70c)
string_ps2_instrument_felvis_blurb = qs(0xe39d0c4b)
string_ps2_instrument_controller_01_blurb = qs(0x70471ce4)
string_ps2_instrument_controller_02_blurb = qs(0x70471ce4)
string_ps2_instrument_rifle_blurb = qs(0x70908f6d)
string_ps2_instrument_raygun_blurb = qs(0x663b44ca)
0x14105c5b = qs(0x77f1d77f)
0x8d190de1 = qs(0x8cc58c25)
0x1a38aef9 = qs(0x9142e2c7)
0x8331ff43 = qs(0xbcfc6f05)
0xf436cfd5 = qs(0x045c7e83)
0x6a525a76 = qs(0x27b1d735)
0x5e017d12 = qs(0xcc5429f5)
0xc7082ca8 = qs(0x67cb9e93)
0xb00f1c3e = qs(0x98b256bd)
0x2e6b899d = qs(0x70ffd3ae)
0x596cb90b = qs(0xfd785adf)
0xc065e8b1 = qs(0x588e85c4)
0xb762d827 = qs(0x43ed91b2)
0x27ddc5b6 = qs(0xa797d421)
0x50daf520 = qs(0x183f13fa)
0x301d7cc5 = qs(0xf2cdd61b)
0x7134b660 = qs(0x2afc5ae9)
0xe83de7da = qs(0x7564ed22)
0x9f3ad74c = qs(0x66535e18)
0x015e42ef = qs(0x9e50944f)
0x76597279 = qs(0x50265a39)
0xef5023c3 = qs(0x4b2b6512)
0x98571355 = qs(0x7b177ddd)
0x08e80ec4 = qs(0x19925f64)
0x2e75b1f4 = qs(0xa6527eb3)
0x59728162 = qs(0x6c358b59)
0xc07bd0d8 = qs(0xca38e56b)
0xb77ce04e = qs(0x5a1aa102)
0x291875ed = qs(0xd478de01)
0x5e1f457b = qs(0xe565f741)
0xc71614c1 = qs(0x53a8fe12)
0xb0112457 = qs(0x242f0f08)
0x20ae39c6 = qs(0xac102ddf)
0x57a90950 = qs(0x9aecaa9d)
0x376e80b5 = qs(0x31bda5c2)
0x4069b023 = qs(0xb370df1a)
0xd960e199 = qs(0xf39bafb8)
0xae67d10f = qs(0x06bbeffc)
0x300344ac = qs(0xc79665af)
0x4704743a = qs(0x726064c5)
0xde0d2580 = qs(0xf4396de5)
0xa90a1516 = qs(0xa52ef7fc)
0x39b50887 = qs(0xcf655a41)
0x4eb23811 = qs(0xaf14525b)
0x1c43d376 = qs(0x67b9d64a)
0x6b44e3e0 = qs(0x15fa4da1)
0xf24db25a = qs(0x633dc259)
0x854a82cc = qs(0x9fe96654)
0x1b2e176f = qs(0x39b0493d)
0x6c2927f9 = qs(0xfeff53d1)
0xf5207643 = qs(0xebb2d3ed)
0x822746d5 = qs(0xe0f3cc55)
0x12985b44 = qs(0x7cb4c0b3)
0x659f6bd2 = qs(0x7db365fc)
0x0558e237 = qs(0x790e1004)
0x725fd2a1 = qs(0x345dd631)
0xeb56831b = qs(0xaedf9f54)
0x9c51b38d = qs(0xaf55d79c)
0x0235262e = qs(0xa8dcacda)
0x753216b8 = qs(0xb5218dae)
0xec3b4702 = qs(0x31aa8be5)
0x9b3c7794 = qs(0x2efadbbc)
0x0b836a05 = qs(0x9e681360)
0x7c845a93 = qs(0xf41e2df3)
0x4a1974f0 = qs(0xbd2930c8)
0x3d1e4466 = qs(0x6bfb5945)
0xa41715dc = qs(0xe3787924)
0xd310254a = qs(0x2135fb3f)
0x4d74b0e9 = qs(0x18afd934)
0x3a73807f = qs(0x5246c324)
0xa37ad1c5 = qs(0xda88f456)
0xd47de153 = qs(0x4d660a81)
0x44c2fcc2 = qs(0xd993ca0d)
0x33c5cc54 = qs(0x242d7b31)
0xb4eb6104 = qs(0x54683336)
0x52efa62e = qs(0xb6671f3e)
0x83de20a0 = qs(0x712c0792)
0xffc46d37 = qs(0x30a2dabf)
0x31357d4e = qs(0x31029e1f)
0xcde94928 = qs(0x04018eac)
0x63f12611 = qs(0xe3e113d8)
0xf637d043 = qs(0xa011b6f6)
0xdaa2dc25 = qs(0xf82eeba9)
0x346464b3 = qs(0x6a669c1e)
0x5a422832 = qs(0xc8cc661c)
0x5ccea297 = qs(0x69887a9b)
0x8f75a8b6 = qs(0x67b7ef20)
0x6dae1a17 = qs(0x770cd13a)
0x851825d8 = qs(0x0b67e0bb)
0xa49d2fae = qs(0x40555bb6)
0x77776c12 = qs(0xe455a59c)
0x034962e7 = qs(0xe77cc262)
0xb789d22e = qs(0x8aae2817)
0x63c0e5ac = qs(0xbe0d9d9e)
0x65af5e0a = qs(0x9feadc54)
0x8b193bb0 = qs(0x72f9a7b9)
0xe7890846 = qs(0xabe5dc5e)
0x83075eb2 = qs(0xe1848e3a)
0x6deb0840 = qs(0xaa36cf82)
0x0fe087f2 = qs(0x384823fc)
0x67d2aa4b = qs(0x3bd513c7)
0xfb0b0c85 = qs(0xa7767324)
0x5ea50e9b = qs(0x578b3caa)
0x526e0c4f = qs(0x0fcf5513)
0xdd5b6cd8 = qs(0x447a6165)
0xd5d181f8 = qs(0x5ca9ca1c)
0xe32da369 = qs(0x30e49e2e)
0x25fc91f5 = qs(0xd83cddac)
0xf99c23fe = qs(0xdb6b71fc)
0xce8d9e08 = qs(0x89a1ac4a)
0x4d3b7b1b = qs(0x7d367fac)
0xffefc257 = qs(0xc5accb20)
0x66e693ed = qs(0xee8198e3)
0x0c138d34 = qs(0xa27dfbf8)
0x25258bec = qs(0xc18dd892)
0xdb57d070 = qs(0x6c48dcce)
0xcf85957c = qs(0x1a187670)
0x0e059bf8 = qs(0x487a2e66)
0x094678ac = qs(0xf5e40310)
0x70438cd7 = qs(0x2e8540f1)
0x676039aa = qs(0x839a09cf)
0x4279f014 = qs(0x7567c420)
0x6366cfb2 = qs(0xd657dc24)
0x7ef73c4a = qs(0xfec33d01)
0x6d24fcb2 = qs(0x93e54b66)
0xd91222ef = qs(0xc7fa903a)
0xf97267ce = qs(0xf79d6e94)
0xa3df232c = qs(0xb96d3e6f)
0x63f12611 = qs(0x51fec29c)
0x2043d35e = qs(0x1fb477da)
0x8380146c = qs(0x872d3326)
0x267147ea = qs(0x320525c0)
0x7144d5ea = qs(0x5286e58d)
0x7ffa0221 = qs(0x1f2495c4)
0x9f15a15f = qs(0x03eed674)
0x32b549b3 = qs(0x5dad8f98)
0x5e63ec55 = qs(0x00082833)
0xbf15d9fe = qs(0xaf76d0f1)
0x429ef7ca = qs(0x7222255e)
0xbf3345fc = qs(0x2277c167)
0xb1a26e28 = qs(0xb44a6d6e)
0x6024e2ce = qs(0xc15d5a69)
0xb7c2a351 = qs(0xc23843d0)
0x0d590451 = qs(0x31e8520f)
0x4191898e = qs(0xcc5bb5cc)
0x806820df = qs(0x8af4ece7)
0xce205b71 = qs(0xc881d882)
0x9ffc1811 = qs(0x4e2fc434)
0x05e8d400 = qs(0x19a67b2e)
0x68c1bbc5 = qs(0x149cb1db)
0xbc6b12c4 = qs(0xe78361c6)
0x3d0610f4 = qs(0x51a9fe2c)
0x911747cf = qs(0x938de4e3)
0x9e9c6102 = qs(0x05131d3b)
0xf62f2953 = qs(0xee691b56)
0x8c293953 = qs(0xdfc93957)
0x7a0bb8ec = qs(0x61fac895)
0x48015c3a = qs(0xba70736b)
0xd8bcc317 = qs(0x30ccc9ff)
0x06424ecb = qs(0x7fd55179)
0x8466078a = qs(0xf6f30ad3)

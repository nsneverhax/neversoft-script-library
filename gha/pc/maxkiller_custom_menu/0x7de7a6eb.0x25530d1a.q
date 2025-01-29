0x6b586a0d = 0.25
0x22df5593 = 0.8
0x806fd10e = 0.27
0xc9e8ee90 = 0.8
0x7e14d624 = 10.0
0x95236d27 = 9.2

script 0x0ec75cf5 
	0x5314e01c
	change gem_start_scale1 = ($0x6b586a0d * <gem_scale>)
	change gem_end_scale1 = ($0x22df5593 * <gem_scale>)
	change gem_start_scale2 = ($0x806fd10e * <gem_scale>)
	change gem_end_scale2 = ($0xc9e8ee90 * <gem_scale>)
	change whammy_top_width1 = ($0x7e14d624 * <gem_scale>)
	change whammy_top_width2 = ($0x95236d27 * <gem_scale>)
endscript

script 0x24f275df 
	ui_menu_select_sfx
	0x5314e01c
	0xf0be8d89 gem_scale = (<gem_scale> + $0x0b9659df)
	0x8bfffed1
endscript

script 0xa5b44dce 
	ui_menu_select_sfx
	0x5314e01c
	0xf0be8d89 gem_scale = (<gem_scale> - $0x0b9659df)
	0x8bfffed1
endscript
0x0b9659df = 0.05

script 0xf0be8d89 
	0x1e5afd34 $0x8faab8cd params = {gem_scale = <gem_scale>}
endscript

script 0x5314e01c 
	gem_scale = 1.0
	getglobaltags $0x8faab8cd noassert = 1
	return gem_scale = <gem_scale>
endscript
0x8faab8cd = 0xb787be93

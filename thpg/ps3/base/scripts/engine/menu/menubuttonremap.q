pad_event_types = [
	pad_up
	pad_down
	pad_right
	pad_left
	pad_choose
	pad_back
	pad_square
	pad_circle
	pad_l1
	pad_r1
	pad_l2
	pad_r2
	pad_l3
	pad_r3
	pad_select
	pad_start
	pad_option
	pad_option2
	pad_backspace
	pad_space
	pad_alt
	pad_alt2
	pad_expand
	pad_btn_top
	pad_btn_right
	pad_btn_bottom
	pad_btn_left
]
pad_event_up_inversion = false

script setup_main_button_event_mappings 
	setbuttoneventmappings {
		ps3 = [
			[x pad_choose]
			[circle pad_back]
			[square pad_square]
			[circle pad_circle]
			[left_trigger1 pad_l1]
			[right_trigger1 pad_r1]
			[left_trigger2 pad_l2]
			[right_trigger2 pad_r2]
			[select pad_select]
			[left_stick_button pad_l3]
			[right_stick_button pad_r3]
			[square pad_option]
			[triangle pad_option2]
			[square pad_backspace]
			[triangle pad_space]
			[right_trigger2 pad_alt]
			[left_trigger2 pad_alt2]
			[triangle pad_btn_top]
			[circle pad_btn_right]
			[x pad_btn_bottom]
			[square pad_btn_left]
		]
		xenon = [
			[a pad_choose]
			[back pad_back]
			[back pad_select]
			[x pad_square]
			[left_trigger1 pad_l1]
			[right_trigger1 pad_r1]
			[left_trigger2 pad_l2]
			[right_trigger2 pad_r2]
			[b pad_back]
			[b pad_circle]
			[left_stick_button pad_l3]
			[right_stick_button pad_r3]
			[x pad_option]
			[y pad_option2]
			[x pad_backspace]
			[y pad_space]
			[right_trigger2 pad_alt]
			[left_trigger2 pad_alt2]
			[y pad_expand]
			[y pad_btn_top]
			[b pad_btn_right]
			[a pad_btn_bottom]
			[x pad_btn_left]
		]
	}
endscript

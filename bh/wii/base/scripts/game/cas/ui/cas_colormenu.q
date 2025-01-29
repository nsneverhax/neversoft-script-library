colormenu_bar_scale = (2.4, 2.0)
colormenu_bar_focus_rgba = [
	200
	200
	200
	255
]
colormenu_bar_unfocus_rgba = [
	200
	200
	200
	128
]
colormenu_bar_pos = (300.0, 0.0)
colormenu_text_pos = (220.0, 2.0)
colormenu_arrow_pos_up = (280.0, 10.0)
colormenu_arrow_pos_down = (280.0, -10.0)
colormenu_arrow_rgba = [
	100
	90
	80
	255
]
colormenu_arrow_scale = 0.5
colormenu_wrap_arrow_left = -53.0
colormenu_wrap_arrow_right = 95.0
default_cas_hue = 0
default_cas_sat = 0
default_cas_value = 50

script colormenu_set_hsv \{use_default_diffuse = 0}
	setcasappearancecolor part = <part> h = <h> s = <s> v = <v> use_default_diffuse = <use_default_diffuse>
	if ((<part> = cas_female_hair) || (<part> = cas_male_hair))
		if getcasappearancepart part = <part>
			cas_propogate_hair_color
		endif
	endif
	if ((<part> = cas_female_shoes) || (<part> = cas_male_shoes))
		if getcasappearancepart part = <part>
			cas_propogate_shoe_color
		endif
	endif
	RemoveParameter \{h}
	RemoveParameter \{s}
	RemoveParameter \{v}
	if getcasappearancepart \{part = cas_body}
		if GotParam \{h}
			Change ps2_body_color_h = (<h>)
			Change ps2_body_color_s = (<s>)
			Change ps2_body_color_v = (<v>)
			Change ps2_body_color_use_default_diffuse = (<use_default_diffuse>)
			ForEachIn ($master_editable_list) do = ps2_propegate_body_color
		endif
	endif
	cas_propogate_color_to_other_parts \{part = cas_body
		other_parts = $ps2_fleshy_parts_array}
	updatecurrentcasmodel \{buildscript = color_model_from_appearance}
endscript

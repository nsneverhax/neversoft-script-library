
script jamroom_wizard_get_style_name 
	musicstudio_mainobj :musicstudiojamroom_getcurrentstyleindex
	style = (($jamroom_wizard_styles [<style_index>]).name_text)
	formattext textname = name_text qs(0x33eba334) s = <style>
	return name_text = <name_text>
endscript

script jamroom_wizard_get_list_checksum_styles 
	return \{list_checksum = jamroom_wizard_styles}
endscript

script jamroom_wizard_set_style 
	musicstudio_mainobj :musicstudiojamroom_setcurrentstyleindex style_index = <index>
endscript

script jamroom_wizard_get_toggled_autoplay_name 
	musicstudio_mainobj :musicstudiojamroom_getbotstatus instrument = <instrument>
	if (<enabled> = 1)
		formattext textname = name_text qs(0x7231322c) a = <text>
	else
		formattext textname = name_text qs(0xbaff3112) a = <text>
	endif
	return name_text = <name_text>
endscript

script jamroom_wizard_toggle_autoplay 
	musicstudio_mainobj :musicstudiojamroom_togglebotstatus instrument = <instrument>
	if musicstudio_jamroom_wizard :desc_resolvealias \{name = alias_ghmix_menu
			param = ghmix_menu}
		musicstudio_mainobj :musicstudio_getplayerfromindex player = <player>
		<player_object> :musicstudiomenu_setstate {
			id = <ghmix_menu>
			state = jamroom_wizard_autoplay_state
		}
	endif
endscript

script jamroom_wizard_generic_back_control_helpers 
endscript

script musicstudio_styles_init_scales 
	if gotparam \{root}
		setarrayelement arrayname = jam_track_rootnotes globalarray index = <instrument> newvalue = <root>
	endif
	if gotparam \{scaleindex}
		setarrayelement arrayname = jam_track_scaleindex globalarray index = <instrument> newvalue = <scaleindex>
	endif
	jam_init_scales_all_instruments
endscript

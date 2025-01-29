
script jamroom_wizard_get_style_name 
	musicstudio_mainobj :MusicStudioJamRoom_GetCurrentStyleIndex
	style = (($jamroom_wizard_styles [<style_index>]).name_text)
	FormatText TextName = name_text qs(0x33eba334) s = <style>
	return name_text = <name_text>
endscript

script jamroom_wizard_get_list_checksum_styles 
	return \{list_checksum = jamroom_wizard_styles}
endscript

script jamroom_wizard_set_style 
	musicstudio_mainobj :MusicStudioJamRoom_SetCurrentStyleIndex style_index = <index>
endscript

script jamroom_wizard_get_toggled_autoplay_name 
	musicstudio_mainobj :MusicStudioJamRoom_GetBotStatus instrument = <instrument>
	if (<enabled> = 1)
		FormatText TextName = name_text qs(0x7231322c) a = <text>
	else
		FormatText TextName = name_text qs(0xbaff3112) a = <text>
	endif
	return name_text = <name_text>
endscript

script jamroom_wizard_toggle_autoplay 
	musicstudio_mainobj :MusicStudioJamRoom_ToggleBotStatus instrument = <instrument>
	if musicstudio_jamroom_wizard :Desc_ResolveAlias \{name = alias_ghmix_menu
			param = ghmix_menu}
		musicstudio_mainobj :MusicStudio_GetPlayerFromIndex player = <player>
		<player_object> :MusicStudioMenu_SetState {
			id = <ghmix_menu>
			state = jamroom_wizard_autoplay_state
		}
	endif
endscript

script jamroom_wizard_generic_back_control_helpers 
endscript

script musicstudio_styles_init_scales 
	if GotParam \{root}
		SetArrayElement arrayName = jam_track_rootnotes GlobalArray index = <instrument> newValue = <root>
	endif
	if GotParam \{ScaleIndex}
		SetArrayElement arrayName = jam_track_scaleindex GlobalArray index = <instrument> newValue = <ScaleIndex>
	endif
	jam_init_scales_all_instruments
endscript

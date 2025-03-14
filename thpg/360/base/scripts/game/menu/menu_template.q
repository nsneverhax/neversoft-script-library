menu_template_style_ticker = {
	menu_create_script = make_cas_menu
	item_create_script = add_cas_menu_item
	menu_finish_script = cas_menu_finish
}

script menu_template_create parent = root_window
	setscreenelementlock id = <parent> off
	if screenelementexists id = <menu_id>
		destroyscreenelement id = <menu_id>
	endif
	<menu_create_script> <...>
	if gotparam pad_back_script
		<menu_id> :setprops {
			event_handlers = [
				{
					pad_back
					menu_template_kill
					params = {
						id = <menu_id>
						callback_script = <pad_back_script>
						callback_params = <pad_back_params>
					}
				}
			]
		}
	endif
	if gotparam items
		foreachin {
			<items>
			do = <item_create_script>
			params = {
				focus_script = <focus_script>
				unfocus_script = <unfocus_script>
				exclusive_device = <exclusive_device>
			}
		}
	endif
	if gotparam helper_text_elements
		create_helper_text helper_text_elements = <helper_text_elements>
	endif
	if gotparam menu_finish_script
		<menu_finish_script>
	endif
	if gotparam additional_event_handlers
		<menu_id> :setprops event_handlers = <additional_event_handlers>
	endif
	if gotparam tags
		<menu_id> :settags <tags>
	endif
	if NOT gotparam no_focus
		launchevent type = focus target = <menu_id>
	endif
endscript

script menu_template_kill 
	if gotparam \{id}
		disassociatefromobject
		destroyscreenelement id = <id>
	endif
	if gotparam \{callback_script}
		<callback_script> <callback_params>
	endif
endscript

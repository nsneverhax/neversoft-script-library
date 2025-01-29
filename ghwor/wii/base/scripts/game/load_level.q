fake_net = 0
AssertOnMissingScripts = 0
AssertOnMissingAssets = 1
AlwaysDump = 0
next_level_script = nullscript
dont_call_zone_init_hack = 0

script zone_init 
	printf qs(0x24c35764) s = <zone_string_name>
	if (<zone_string_name> = 'z_viewer')
		printf \{qs(0xae81ca89)}
		Change \{AssertOnMissingScripts = 0}
	endif
	MemPushContext \{TopDownHeap}
	formatText TextName = zone_editable_text checksumName = zone_editable_list '%a%b' a = <zone_string_name> b = '_editable_list'
	if GlobalExists Name = <zone_editable_list> Type = array
		AddEditableList <zone_editable_list>
	endif
	MemPopContext
	Wait \{1
		gameframes}
	MemPushContext \{BottomUpHeap}
	ParseNodeArray {
		queue
		zone_name = <zone_name>
		array_name = <array_name>
	}
	if GotParam \{sfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <sfx_zone_name>
			array_name = <sfx_array_name>
		}
	endif
	if GotParam \{gfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <gfx_zone_name>
			array_name = <gfx_array_name>
		}
	endif
	if GotParam \{gfx2_array_name}
		ParseNodeArray {
			queue
			zone_name = <gfx_zone_name>
			array_name = <gfx2_array_name>
		}
	endif
	if GotParam \{lfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <lfx_zone_name>
			array_name = <lfx_array_name>
		}
	endif
	if GotParam \{mfx_array_name}
		ParseNodeArray {
			queue
			zone_name = <mfx_zone_name>
			array_name = <mfx_array_name>
		}
	endif
	MemPopContext
	formatText checksumName = zone_setup_script '%a_Setup' a = <zone_string_name>
	if ScriptExists <zone_setup_script>
		SpawnScriptNow zone_init_wait_run_setup params = {zone_setup_script = <zone_setup_script>}
	endif
	lightshow_zone_init zone_string_name = <zone_string_name>
endscript

script zone_init_wait_run_setup 
	begin
	if NOT NodeArrayBusy
		break
	endif
	Wait \{1
		gameframe}
	repeat
	if ScriptExists <zone_setup_script>
		<zone_setup_script>
	endif
	KillSpawnedScript \{Name = crowd_control}
	fastspawnscriptnow \{script_name = crowd_control
		params = {
		}}
endscript

script zone_deinit 
	printf qs(0xb9052920) s = <zone_string_name>
	ParseNodeArray abort array_name = <array_name>
	if GotParam \{sfx_array_name}
		ParseNodeArray abort array_name = <sfx_array_name>
	endif
	if GotParam \{gfx_array_name}
		ParseNodeArray abort array_name = <gfx_array_name>
	endif
	if GotParam \{gfx2_array_name}
		ParseNodeArray abort array_name = <gfx2_array_name>
	endif
	if GotParam \{lfx_array_name}
		ParseNodeArray abort array_name = <lfx_array_name>
	endif
	if GotParam \{mfx_array_name}
		ParseNodeArray abort array_name = <mfx_array_name>
	endif
	formatText TextName = zone_editable_text checksumName = zone_editable_list '%a%b' a = <zone_string_name> b = '_editable_list'
	if GlobalExists Name = <zone_editable_list> Type = array
		RemoveEditableList <zone_editable_list>
	endif
endscript

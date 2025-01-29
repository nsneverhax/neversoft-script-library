0xbc64bd01 = FALSE
0x180ccff4 = [
	0
	73
	163
	255
]
0x8c78bd9e = [
	180
	180
	180
	255
]
0x00c890a0 = [
	[
		182
		164
		14
		255
	]
	[
		9
		113
		219
		255
	]
	[
		202
		109
		0
		255
	]
	[
		127
		108
		143
		255
	]
]
0x9959f551 = [
	[
		255
		252
		162
		255
	]
	[
		162
		232
		255
		255
	]
	[
		255
		234
		163
		255
	]
	[
		229
		229
		229
		255
	]
]
0x42413662 = [
	0
	177
	206
	255
]

script 0x3e572301 
	return ($0xbc64bd01)
endscript

script 0x5a603ec5 
	if ScreenElementExists \{id = band_lobby_desc_id}
		if band_lobby_desc_id :desc_resolvealias \{Name = 0x179e5690}
			<resolved_id> :se_getparentid
			if GotParam \{parent_id}
				<parent_id> :se_setprops texture = dialog_bg2
				<parent_id> :se_getparentid
				<parent_id> :se_getparentid
				ResolveScreenElementID id = {<parent_id> child = 9}
				if GotParam \{resolved_id}
					<resolved_id> :se_setprops alpha = 0
				else
					ScriptAssert \{'Please update this script to comply with most recent version of the band_lobby NxGUI file'}
				endif
			else
				ScriptAssert \{'Please update this script to comply with most recent version of the band_lobby NxGUI file'}
			endif
		else
			ScriptAssert \{'Please update this script to comply with most recent version of the band_lobby NxGUI file'}
		endif
		if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
			viewport_menu = <resolved_id>
			i = 0
			begin
			0xa80f0dcc state = 0x41db207a index = <i>
			i = (<i> + 1)
			repeat ($g_num_lobby_local_submenus)
		endif
	else
		ScriptAssert \{'Tried to set up a non-existent wii exclusive band lobby'}
	endif
endscript

script 0xa80f0dcc 
	RequireParams \{[
			state
			index
		]
		all}
	if band_lobby_desc_id :desc_resolvealias \{Name = alias_band_viewport_vmenu}
		ResolveScreenElementID id = {<resolved_id> child = <index>}
		if (<state> = 0x41db207a)
			<resolved_id> :se_setprops {
				0xd6f201e8 = ($0x180ccff4)
				0x86f0c4f2 = ($0x180ccff4)
				0xb52efcac = ($0x8c78bd9e)
				lobby_frame_sm_rgba = ($0x8c78bd9e)
				time = 0.2
			}
		else
			<resolved_id> :se_setprops {
				0xd6f201e8 = ($0x00c890a0 [<index>])
				0x86f0c4f2 = ($0x00c890a0 [<index>])
				0xb52efcac = ($0x9959f551 [<index>])
				lobby_frame_sm_rgba = ($0x9959f551 [<index>])
				time = 0.2
			}
		endif
	endif
endscript

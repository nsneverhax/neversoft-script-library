
script createMap {
		parent = root_window
		container_type = containerelement
		container_dims = (1280.0, 720.0)
		container_just = [left top]
		container_pos (0.0, 0.0)
		z_priority = 1.0
		movespeed = 32 left = -1.0 right = 1.0 top = -1.0 bottom = 1.0
		start_scale = 1.0 min_scale = 0.5 max_scale = 2.0 zoomspeed = 0.01
	}
	if NOT (gotparam container_id)
		scriptassert 'createMap requires a container_id'
	endif
	if NOT (gotparam texture)
		scriptassert 'createMap requires a texture'
	endif
	if NOT ((<container_type> = containerelement) || (<container_type> = windowelement))
		scriptassert 'createMap: container_type must be set to either ContainerElement or WindowElement'
	endif
	createscreenelement {
		type = <container_type>
		parent = <parent>
		id = <container_id>
		dims = <container_dims>
		just = <container_just>
		pos = <container_pos>
		z_priority = <z_priority>
		tags = {
			run_script = 0
			icon_count = 0
			scale = 0.0
		}
		event_handlers = [
			{focus runMapControls params = {
					movespeed = <movespeed> left = <left> right = <right> top = <top> bottom = <bottom>
					start_scale = <start_scale> min_scale = <min_scale> max_scale = <max_scale> zoomspeed = <zoomspeed>
				}}
			{unfocus stopMapControls}
		]
	}
	createscreenelement {
		type = containerelement
		parent = <container_id>
		dims = (0.0, 0.0)
		just = [center center]
		pos = (<container_dims> / 2)
		z_priority = (<z_priority> + 0.1)
		child_anchor = [center center]
	}
	<container_id> :settags main_container_id = <id>
	<container_id> :getsingletag main_container_id
	createscreenelement {
		type = spriteelement
		parent = <main_container_id>
		texture = <texture>
		just = [0.0 0.0]
		pos = (0.0, 0.0)
		scale = <start_scale>
		z_priority = (<z_priority> + 0.2)
	}
	<container_id> :settags map_id = <id>
	calculateProportional pos = (890.0, -10.0) dims = (1024.0, 1024.0)
	createscreenelement {
		type = spriteelement
		parent = <id>
		texture = crib
		just = [0.0 0.0]
		pos = {<pro_pos> proportional}
		z_priority = (<z_priority> + 0.21000001)
	}
	getscreenelementdims id = <id>
	createscreenelement {
		type = containerelement
		parent = <main_container_id>
		just = [0.0 0.0]
		pos = (0.0, 0.0)
		dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * <height>))
		z_priority = (<z_priority> + 0.2)
	}
	<container_id> :settags icon_container_id = <id>
endscript

script runMapControls 
	gettags
	if (<run_script> = 0)
		<id> :settags {
			run_script = 1
		}
		runscriptonscreenelement leftStickControl id = <id> params = {
			movespeed = <movespeed> left = <left> right = <right> top = <top> bottom = <bottom>
			start_scale = <start_scale> min_scale = <min_scale> max_scale = <max_scale> zoomspeed = <zoomspeed>
		}
	endif
endscript

script stopMapControls 
	gettags
	if (<run_script> = 1)
		<id> :settags {
			run_script = 0
		}
		killspawnedscript id = <id> name = leftStickControl
	endif
endscript

script leftStickControl 
	gettags
	begin
	getanalogueinfo
	if NOT ((<rightx> = 0.0) && (<righty> = 0.0))
		if controllerpressed r2
			zoomMap id = <id> min_scale = <min_scale> max_scale = <max_scale> zoomspeed = <zoomspeed>
		else
			moveMap id = <id> movespeed = <movespeed> left = <left> right = <right> top = <top> bottom = <bottom>
		endif
		updateIconContainer id = <id>
	endif
	wait 1 gameframes
	repeat
endscript

script moveMap 
	getanalogueinfo
	<id> :getsingletag map_id
	<id> :getsingletag icon_container_id
	getscreenelementdims id = <map_id>
	getscreenelementprops id = <map_id>
	<halfWidth> = (<width> / 2.0)
	<halfHeight> = (<height> / 2.0)
	<currPosX> = ((<just> [0]) * <halfWidth>)
	<currPosY> = ((<just> [1]) * <halfHeight>)
	<moveX> = (<rightx> * <movespeed>)
	<movey> = (<righty> * <movespeed>)
	<newPosX> = (<currPosX> + <moveX>)
	<newPosY> = (<currPosY> + <movey>)
	<newJustX> = (<newPosX> / <halfWidth>)
	<newJustY> = (<newPosY> / <halfHeight>)
	if (<newJustX> > <right>)
		<newJustX> = <right>
	endif
	if (<newJustX> < <left>)
		<newJustX> = <left>
	endif
	if (<newJustY> > <bottom>)
		<newJustY> = <bottom>
	endif
	if (<newJustY> < <top>)
		<newJustY> = <top>
	endif
	<newJust> = [0.0 0.0]
	setarrayelement arrayname = newJust index = 0 newvalue = <newJustX>
	setarrayelement arrayname = newJust index = 1 newvalue = <newJustY>
	setscreenelementprops {
		id = <map_id>
		just = <newJust>
	}
	doscreenelementmorph {
		id = <icon_container_id>
		dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * <height>))
		pos = (((-1.0, 0.0) * <newPosX>) + ((0.0, -1.0) * <newPosY>))
	}
	setscreenelementprops {
		id = <map_id>
		pos = (0.0, 0.0)
	}
endscript

script zoomMap 
	getanalogueinfo
	<id> :getsingletag map_id
	getscreenelementprops id = <map_id>
	<multiplier> = (<righty> * -10.0)
	casttointeger multiplier
	<temp_scale> = (<scale> + (<multiplier> * <zoomspeed>))
	if (<temp_scale> > <max_scale>)
		<temp_scale> = <max_scale>
	endif
	if (<temp_scale> < <min_scale>)
		<temp_scale> = <min_scale>
	endif
	if (<temp_scale> = <scale>)
		return
	endif
	doscreenelementmorph {
		id = <map_id>
		scale = <temp_scale>
	}
	<id> :settags scale = ((<temp_scale> * 0.25) - 0.25)
endscript

script morphMap time = 0.0
	<id> :getsingletag map_id
	getscreenelementprops id = <map_id>
	<count> = (<time> / 0.05)
	casttointeger count
	if (<count> = 0)
		<count> = 1
	endif
	<addX> = (((<new_just> [0]) - ((<just> [0]))) / <count>)
	<addY> = (((<new_just> [1]) - ((<just> [1]))) / <count>)
	<changeJust> = [0.0 0.0]
	setarrayelement arrayname = changeJust index = 0 newvalue = ((<just> [0]))
	setarrayelement arrayname = changeJust index = 1 newvalue = ((<just> [1]))
	if (gotparam new_scale)
		<addScale> = ((<new_scale> - <scale>) / <count>)
		<changeScale> = <scale>
	endif
	begin
	setarrayelement arrayname = changeJust index = 0 newvalue = ((<changeJust> [0]) + <addX>)
	setarrayelement arrayname = changeJust index = 1 newvalue = ((<changeJust> [1]) + <addY>)
	setscreenelementprops {
		id = <map_id>
		just = <changeJust>
	}
	if (gotparam new_scale)
		<changeScale> = (<changeScale> + <addScale>)
		doscreenelementmorph {
			id = <map_id>
			scale = <changeScale>
		}
		<id> :settags scale = ((<changeScale> * 0.25) - 0.25)
	endif
	setscreenelementprops {
		id = <map_id>
		pos = (0.0, 0.0)
	}
	updateIconContainer id = <id>
	wait 0.05 seconds ignoreslomo
	repeat <count>
endscript

script addMapIcon {
		icon_create_script = nullscript
		icon_create_params = {}
		icon_focus_script = nullscript
		icon_unfocus_script = nullscript
		scale = 1.25
	}
	if NOT (gotparam parent)
		scriptassert 'addMapIcon requires an id for the parent element'
	endif
	if NOT (gotparam pos)
		scriptassert 'addMapIcon requires a pos (proportional) for the icon'
	endif
	<parent> :getsingletag icon_count
	<parent> :getsingletag icon_container_id
	createscreenelement {
		type = containerelement
		parent = <icon_container_id>
		just = [center center]
		pos = {<pos> proportional}
		scale = <scale>
		tags = {
			pro_pos = <pos>
			index = <icon_count>
			icon_focus_script = <icon_focus_script>
			icon_unfocus_script = <icon_unfocus_script>
			icon_scale = <scale>
		}
	}
	if (gotparam local_id)
		setscreenelementprops {
			id = <id>
			local_id = <local_id>
		}
	endif
	<icon_create_script> parent = <id> <icon_create_params>
	<parent> :settags {
		icon_count = (<icon_count> + 1)
	}
endscript

script killMapIcons 
	if NOT (gotparam parent)
		scriptassert \{'killMapIcons requires an id for the parent element'}
	endif
	<parent> :getsingletag icon_count
	<parent> :getsingletag icon_container_id
	destroyscreenelement id = <icon_container_id> preserve_parent
	<parent> :settags {
		icon_count = 0
	}
endscript

script calculateProportional 
	if NOT (gotparam pos)
		scriptassert 'addMapIcon requires a position (pos)'
	endif
	if NOT (gotparam dims)
		scriptassert 'addMapIcon requires dimentions of the image it\'s positioned on (dims)'
	endif
	<x> = (((<pos> [0]) - 65.0) / (<dims> [0]))
	<y> = (((<pos> [1]) - 35.0) / (<dims> [1]))
	return pro_pos = (((1.0, 0.0) * <x>) + ((0.0, 1.0) * <y>))
endscript

script updateIconContainer 
	<id> :getsingletag map_id
	<id> :getsingletag icon_container_id
	getscreenelementdims id = <map_id>
	getscreenelementprops id = <map_id>
	<currPosX> = ((<just> [0]) * (<width> / 2.0))
	<currPosY> = ((<just> [1]) * (<height> / 2.0))
	setscreenelementprops {
		id = <icon_container_id>
		dims = (((1.0, 0.0) * <width>) + ((0.0, 1.0) * <height>))
		pos = (((-1.0, 0.0) * <currPosX>) + ((0.0, -1.0) * <currPosY>))
	}
	<id> :getsingletag icon_count
	if (<icon_count> = 0)
		return
	endif
	<id> :getsingletag scale
	<i> = 0
	begin
	assignalias id = {<icon_container_id> child = <i>} alias = curr_icon
	curr_icon :getsingletag pro_pos
	curr_icon :getsingletag icon_scale
	doscreenelementmorph {
		id = curr_icon
		pos = {<pro_pos> proportional}
		scale = (<icon_scale> + <scale>)
	}
	<i> = (<i> + 1)
	repeat <icon_count>
endscript

script moveMapToIcon time = 0.0
	if NOT (gotparam parent)
		scriptassert 'moveMapToIcon requires an id for the parent element'
	endif
	if NOT ((gotparam index) || (gotparam local_id))
		scriptassert 'moveMapToIcon requires either an index or a local_id'
	endif
	if NOT (screenelementexists id = <parent>)
		scriptassert 'moveMapToIcon: screen element <parent> does not exist'
	endif
	<parent> :getsingletag icon_count
	<parent> :getsingletag icon_container_id
	if (gotparam index)
		if NOT (screenelementexists id = {<icon_container_id> child = <index>})
			return
			scriptassert 'moveMapToIcon: The specified index is invalid'
		endif
		resolvescreenelementid id = {<icon_container_id> child = <index>}
	else
		if NOT (screenelementexists id = {<icon_container_id> child = <local_id>})
			return
			scriptassert 'moveMapToIcon: The specified local_id is invalid'
		endif
		resolvescreenelementid id = {<icon_container_id> child = <local_id>}
	endif
	if NOT gotparam resolved_id
		return
	endif
	runscriptonscreenelement id = <resolved_id> moveMapToIconSpawned params = {<...>}
endscript

script moveMapToIconSpawned 
	<parent> :getsingletag curr_icon
	<parent> :settags curr_icon = <resolved_id>
	<resolved_id> :getsingletag pro_pos
	<icon_pos> = [0.0 0.0]
	setarrayelement arrayname = icon_pos index = 0 newvalue = (((<pro_pos> [0]) * 2.0) - 1.0)
	setarrayelement arrayname = icon_pos index = 1 newvalue = (((<pro_pos> [1]) * 2.0) - 1.0)
	if (gotparam zoom)
		morphMap id = <parent> new_just = <icon_pos> new_scale = <zoom> time = <time>
	else
		morphMap id = <parent> new_just = <icon_pos> time = <time>
	endif
	if screenelementexists id = <curr_icon>
		<curr_icon> :getsingletag icon_unfocus_script
		<curr_icon> :getsingletag icon_focus_script
		killspawnedscript name = <icon_focus_script>
		<icon_unfocus_script> parent = <curr_icon>
		removeparameter icon_focus_script
		removeparameter icon_unfocus_script
	endif
	<resolved_id> :getsingletag icon_focus_script
	<icon_focus_script> parent = <resolved_id>
endscript

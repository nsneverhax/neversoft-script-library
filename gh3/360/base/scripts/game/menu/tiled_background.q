
script tilesprite \{parent = root_window
		container_type = containerelement
		tile_dims = (1280.0, 720.0)
		pos = (0.0, 0.0)
		sprite_props = {
		}
		container_props = {
		}}
	if NOT gotparam \{texture}
		printf \{"TileSprite needs a texture"}
		return
	endif
	createscreenelement {
		type = <container_type>
		parent = <parent>
		dims = <tile_dims>
		pos = <pos>
		just = [left top]
		child_anchor = [left top]
		<container_props>
	}
	<container_id> = <id>
	if NOT gotparam \{dims}
		createscreenelement {
			type = spriteelement
			parent = <parent>
			texture = <texture>
		}
		getscreenelementdims id = <id>
		if ((<width> < 1) || (<height> < 1))
			printf \{"why is the width or height not positive?"}
			destroyscreenelement id = <container_id>
			return
		endif
		destroyscreenelement id = <id>
	else
		<width> = (<dims> [0])
		<height> = (<dims> [1])
	endif
	<container_id> :settags {
		width = <width>
		height = <height>
		pos = <pos>
	}
	if gotparam \{flip_h}
		<container_id> :settags {
			flip_h
		}
	endif
	if gotparam \{flip_v}
		<container_id> :settags {
			flip_v
		}
	endif
	<x> = 0
	<y> = 0
	<row> = 0
	<column> = 0
	<count> = 0
	begin
	<flip> = {}
	if gotparam \{flip_h}
		mod a = <row> b = (2)
		if (<mod> = 0)
			<flip> = {flip_h}
		endif
	endif
	if gotparam \{flip_v}
		mod a = <column> b = (2)
		if (<mod> = 0)
			<flip> = {<flip> flip_v}
		endif
	endif
	createscreenelement {
		type = spriteelement
		parent = <container_id>
		texture = <texture>
		dims = <dims>
		just = [left top]
		pos = (((1.0, 0.0) * <x>) + ((0.0, 1.0) * <y>))
		<sprite_props>
		<flip>
	}
	<count> = (<count> + 1)
	<x> = (<x> + <width>)
	<column> = (<column> + 1)
	if (<x> > (<tile_dims> [0]))
		<x> = 0
		<y> = (<y> + <height>)
		<row> = (<row> + 1)
		<column> = 0
		if (<y> > (<tile_dims> [1]))
			return {id = <container_id> count = <count>}
		endif
	endif
	repeat
endscript

script tilespriteloop \{move_x = 1
		move_y = 0}
	gettags
	if gotparam \{flip_v}
		<width> = (<width> * 2)
	endif
	if gotparam \{flip_h}
		<height> = (<height> * 2)
	endif
	if ((<move_x> > <width>) || (<move_x> < (<width> * -1)))
		printf \{"move_x is greater then the width of the image"}
		return
	endif
	if ((<move_y> > <height>) || (<move_y> < (<height> * -1)))
		printf \{"move_y is greater then the height of the image"}
		return
	endif
	<x> = 0
	<y> = 0
	begin
	<x> = (<x> + <move_x>)
	<y> = (<y> + <move_y>)
	if (<x> > <width>)
		<x> = (<x> - <width>)
		domorph {
			pos = {((-1.0, 0.0) * <width>) relative}
		}
	endif
	if (<x> < (<width> * -1))
		<x> = (<width> + <x>)
		domorph {
			pos = {((1.0, 0.0) * <width>) relative}
		}
	endif
	if (<y> > <height>)
		<y> = (<y> - <height>)
		domorph {
			pos = {((0.0, -1.0) * <height>) relative}
		}
	endif
	if (<y> < (<height> * -1))
		<y> = (<height> + <y>)
		domorph {
			pos = {((0.0, 1.0) * <height>) relative}
		}
	endif
	domorph {
		pos = (((1.0, 0.0) * ((<pos> [0]) + <x>)) + ((0.0, 1.0) * ((<pos> [1]) + <y>)))
		time = 0.1
	}
	repeat
endscript

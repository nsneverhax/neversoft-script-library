button_array = [
	"0"
	"1"
	"2"
	"3"
	"4"
	"5"
	"6"
	"7"
	"8"
	"9"
	"a"
	"b"
	"c"
	"d"
	"e"
	"f"
	"g"
	"h"
	"i"
	"j"
	"k"
	"l"
]
meta_array = [
	"0"
	"1"
	"2"
	"3"
	"4"
	"5"
	"6"
	"7"
	"8"
	"9"
	"a"
	"b"
	"c"
	"d"
	"e"
	"f"
	"g"
	"h"
	"i"
	"j"
	"k"
	"l"
	"m"
	"n"
	"o"
	"p"
	"q"
	"r"
	"s"
	"t"
	"u"
	"v"
]

script debug_show_buttons \{Scale = 0.8
		z_priority = 100
		padding_scale = 1.5}
	SetScreenElementLock \{OFF
		Id = root_window}
	if ScreenElementExists \{Id = button_container}
		DestroyScreenElement \{Id = button_container}
		return
	endif
	CreateScreenElement \{Type = ContainerElement
		PARENT = root_window
		Id = button_container
		Pos = (320.0, 240.0)
		Dims = (640.0, 480.0)
		event_handlers = [
			{
				pad_back
				debug_kill_buttons
				Params = {
				}
			}
		]}
	CreateScreenElement \{Type = SpriteElement
		PARENT = button_container
		texture = white2
		rgba = [
			0
			0
			0
			100
		]
		Scale = (80.0, 30.0)
		Pos = (320.0, 210.0)}
	CreateScreenElement \{Type = TextElement
		PARENT = button_container
		Text = "buttons"
		font = text_A1
		Scale = 1
		Pos = (320.0, 120.0)
		z_priority = 101}
	CreateScreenElement {
		Type = HMenu
		PARENT = button_container
		Id = debug_buttons
		Pos = (320.0, 160.0)
		just = [Center Bottom]
		internal_just = [LEFT Center]
		padding_scale = <padding_scale>
		spacing_between = <spacing_between>
		Scale = <Scale>
		z_priority = <z_priority>
	}
	GetArraySize \{button_array}
	Index = 0
	begin
	FormatText TextName = Text "%i" I = (button_array [<Index>])
	FormatText TextName = button "\\b%i" I = (button_array [<Index>])
	create_debug_button_item Text = <Text> button = <button> PARENT = debug_buttons
	Index = (<Index> + 1)
	repeat <array_Size>
	CreateScreenElement \{Type = TextElement
		PARENT = button_container
		Text = "meta chars"
		font = text_A1
		Scale = 1
		Pos = (320.0, 200.0)
		z_priority = 101}
	CreateScreenElement {
		Type = HMenu
		PARENT = button_container
		Id = debug_meta1
		Pos = (320.0, 240.0)
		just = [Center Bottom]
		internal_just = [LEFT Center]
		padding_scale = <padding_scale>
		spacing_between = <spacing_between>
		Scale = <Scale>
		z_priority = <z_priority>
	}
	GetArraySize \{meta_array}
	Index = 0
	begin
	FormatText TextName = Text "%i" I = (meta_array [<Index>])
	FormatText TextName = button "\\m%i" I = (meta_array [<Index>])
	create_debug_button_item Text = <Text> button = <button> PARENT = debug_meta1
	Index = (<Index> + 1)
	repeat 16
	CreateScreenElement {
		Type = HMenu
		PARENT = button_container
		Id = debug_meta2
		Pos = (320.0, 280.0)
		just = [Center Bottom]
		internal_just = [LEFT Center]
		padding_scale = <padding_scale>
		spacing_between = <spacing_between>
		Scale = <Scale>
		z_priority = <z_priority>
	}
	begin
	FormatText TextName = Text "%i" I = (meta_array [<Index>])
	FormatText TextName = button "\\m%i" I = (meta_array [<Index>])
	create_debug_button_item Text = <Text> button = <button> PARENT = debug_meta2
	Index = (<Index> + 1)
	repeat (<array_Size> -16)
	LaunchEvent \{Type = Focus
		Target = button_container}
endscript

script create_debug_button_item 
	CreateScreenElement {
		Type = ContainerElement
		PARENT = <PARENT>
		Pos = (0.0, 0.0)
		Dims = (20.0, 20.0)
		internal_just = [Center Center]
		just = [Center Center]
	}
	parent_id = <Id>
	CreateScreenElement {
		Type = TextElement
		PARENT = <parent_id>
		Text = <Text>
		font = text_A1
		Pos = (0.0, 0.0)
		just = [Center Center]
	}
	CreateScreenElement {
		Type = TextElement
		PARENT = <parent_id>
		Text = <button>
		font = text_A1
		Pos = (0.0, 15.0)
		just = [Center Center]
	}
	GetScreenElementDims Id = <Id>
	if GotParam \{width}
		if (<width> > 30)
			SetScreenElementProps Id = <parent_id> Dims = (55.0, 20.0)
			SetScreenElementProps Id = <Id> Pos = (15.0, 15.0)
		endif
	endif
endscript

script debug_kill_buttons 
	if ScreenElementExists \{Id = button_container}
		DestroyScreenElement \{Id = button_container}
	endif
endscript

script rebuild_panel_stuff 
	destroy_panel_stuff
	create_panel_stuff
endscript

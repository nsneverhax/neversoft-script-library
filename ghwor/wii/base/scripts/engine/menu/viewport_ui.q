
script destroy_viewport_ui \{viewport_id = menu_viewport
		viewport_override_id = menu_viewport_override
		window_id = viewport_root}
	if ScreenElementExists id = <window_id>
		<window_id> :Die
	endif
	if ViewportExists id = <viewport_id>
		SetSearchAllAssetContexts
		DestroyViewportTextureOverride viewportid = <viewport_override_id>
		SetSearchAllAssetContexts \{OFF}
		DestroyViewport id = <viewport_id>
	endif
endscript

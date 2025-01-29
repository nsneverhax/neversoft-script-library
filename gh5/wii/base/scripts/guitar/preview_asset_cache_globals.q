default_preview_asset_image_cache_size_xenon = 1843200
default_preview_asset_sound_cache_size_xenon = 921600
default_preview_asset_image_cache_size_wii = 900000
default_preview_asset_sound_cache_size_wii = 18770000
default_preview_asset_image_cache_size_ps3 = 13440
default_preview_asset_sound_cache_size_ps3 = 768
default_preview_asset_max_file_requests = 300
default_preview_asset_image_size_xenon = 46080
default_preview_asset_image_size_wii = 8450
default_preview_asset_image_size_ps3 = 384
default_preview_asset_image_vram_size = 40080
default_preview_asset_sound_size_xenon = 307200
default_preview_asset_sound_size_wii = 307200
default_preview_asset_sound_size_ps3 = 256
default_preview_asset_sound_vram_size = 220000
default_preview_asset_on_disc_assets = [
]

script calculate_preview_image_limit 
	if isxenonorwindx
		return limit = (($default_preview_asset_image_cache_size_xenon) / ($default_preview_asset_image_size_xenon))
	elseif isngc
		return limit = (($default_preview_asset_image_cache_size_wii) / ($default_preview_asset_image_size_wii))
	else
		return limit = (($default_preview_asset_image_cache_size_ps3) / ($default_preview_asset_image_size_ps3))
	endif
endscript

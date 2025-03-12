default_preview_asset_image_cache_size_xenon = 2304000
default_preview_asset_sound_cache_size_xenon = 3686400
default_preview_asset_image_cache_size_ps3 = 19200
default_preview_asset_sound_cache_size_ps3 = 3072
default_preview_asset_max_file_requests = 300
default_preview_asset_image_size_xenon = 46080
default_preview_asset_image_size_ps3 = 384
default_preview_asset_image_vram_size = 40960
default_preview_asset_sound_size_xenon = 307200
default_preview_asset_sound_size_ps3 = 256
default_preview_asset_sound_vram_size = 307200
default_preview_asset_on_disc_assets = [
]

script calculate_preview_image_limit 
	if isxenonorwindx
		return limit = (($default_preview_asset_image_cache_size_xenon) / ($default_preview_asset_image_size_xenon))
	else
		return limit = (($default_preview_asset_image_cache_size_ps3) / ($default_preview_asset_image_size_ps3))
	endif
endscript

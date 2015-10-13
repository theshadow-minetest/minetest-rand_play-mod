dofile(minetest.get_modpath(minetest.get_current_modname()).."/config.lua")

function soundtest()
	local handle = minetest.sound_play(soundprefix, {gain = playvol})
	minetest.after(longest, function()
		minetest.sound_stop(handle)
	end)
	minetest.after((longest+10), function()
		soundtest()
	end)
end

minetest.after(delay, function()
	soundtest()
end)

print("Mod rand_play loaded")

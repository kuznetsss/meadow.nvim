package.path = package.path .. ';../lua/wombat-nvim.lua'

local test_cases = {
    { hsv = {0,0,0}, hex = '#000000', rgb = {0,0,0} },
    { hsv = {0,0,100}, hex = '#ffffff', rgb = {255,255,255} },
    { hsv = {0,100,100}, hex = '#ff0000', rgb = {255,0,0} },
    { hsv = {120,100,100}, hex = '#00ff00', rgb = {0,255,0} },
    { hsv = {240,100,100}, hex = '#0000ff', rgb = {0,0,255} },
    { hsv = {60,100,100}, hex = '#ffff00', rgb = {255,255,0} },
    { hsv = {180,100,100}, hex = '#00ffff', rgb = {0,255,255} },
    { hsv = {300,100,100}, hex = '#ff00ff', rgb = {255,0,255} },
    { hsv = {0,0,75}, hex = '#bfbfbf', rgb = {191,191,191} },
    { hsv = {0,0,50}, hex = '#808080', rgb = {128,128,128} },
    { hsv = {0,100,50}, hex = '#800000', rgb = {128,0,0} },
    { hsv = {60,100,50}, hex = '#808000', rgb = {128,128,0} },
    { hsv = {120,100,50}, hex = '#008000', rgb = {0,128,0} },
    { hsv = {300,100,50}, hex = '#800080', rgb = {128,0,128} },
    { hsv = {180,100,50}, hex = '#008080', rgb = {0,128,128} },
    { hsv = {240,100,50}, hex = '#000080', rgb = {0,0,128} }
}

local function EXPECT_EQ(t1, t2, name)
    if type(t1) == 'table' then
        assert(table.concat(t1) == table.concat(t2),
            name .. ': ' .. table.concat(t1) .. ' vs ' .. table.concat(t2))
    else
        assert(t1 == t2, 'name: ' .. t1 .. ' vs ' .. t2)
    end
end

local hsv_to_rgb = require('wombat-nvim').hsv_to_rgb
local rgb_to_hex = require('wombat-nvim').rgb_to_hex
local hsv_to_rgb_hex = require('wombat-nvim').hsv_to_rgb_hex

for _, case in ipairs(test_cases) do
    EXPECT_EQ(hsv_to_rgb(case.hsv), case.rgb, 'hsv_to_rgb')
    EXPECT_EQ(rgb_to_hex(case.rgb), case.hex, 'rgb_to_hex')
    EXPECT_EQ(hsv_to_rgb_hex(case.hsv), case.hex, 'hsv_to_rgb_hex')
end

print(arg[0], ' PASSED')

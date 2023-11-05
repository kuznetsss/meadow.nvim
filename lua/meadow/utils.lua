local utils = {}

-- Force value to b ebetween 0 and 100
---@param value integer: value to modify
---@return integer: value between 0 and 100
utils.clamp = function(value)
    if value < 0 then return 0 end
    if value > 100 then return 100 end
    return value
end

return utils

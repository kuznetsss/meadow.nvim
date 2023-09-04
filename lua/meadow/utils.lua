local utils = {}

utils.log = function(msg, level)
    vim.notify("meadow: " .. msg, level, { title = "meadow"})
end

utils.log_info = function(msg)
    utils.log(msg, vim.log.levels.INFO)
end

utils.log_error = function(msg)
    utils.log(msg, vim.log.levels.INFO)
end

-- Force value to b ebetween 0 and 100
---@param value integer: value to modify
---@return integer: value between 0 and 100
utils.clamp = function(value)
    if value < 0 then return 0 end
    if value > 100 then return 100 end
    return value
end

return utils

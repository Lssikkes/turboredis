local util = {}

-- Range iterator from http://lua-users.org/wiki/RangeIterator
function util.range(from, to, step)
    step = step or 1
    return function(_, lastvalue)
        local nextvalue = lastvalue + step
        if step > 0 and nextvalue <= to or step < 0 and nextvalue >= to or
             step == 0
        then
            return nextvalue
        end
    end, nil, from - step
end

-- Convert a list of key value pairs ({key, value, key, value, ...})
-- to a table of key value pairs ({key=value, key=value, ...})
function util.from_kvlist(inp)
    local out={}
    local o = false
    for i, v in ipairs(inp) do
        if o then
            out[inp[i-1]] = v
        end
        o = not o
    end
    return out
end

-- Flatten a table
function util.flatten(t)
    if type(t) ~= "table" then return {t} end
    local flat_t = {}
    for _, elem in ipairs(t) do
        for _, val in ipairs(util.flatten(elem)) do
            flat_t[#flat_t + 1] = val
        end
    end
    return flat_t
end

return util

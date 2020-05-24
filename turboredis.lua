-- make sure string.split is defined, turbo-redis requires it to be there.
if string.split == nil then
  function string:split(delimiter)
    local result = { }
    local from  = 1
    local delim_from, delim_to = string.find( self, delimiter, from  )
    while delim_from do
      table.insert( result, string.sub( self, from , delim_from-1 ) )
      from  = delim_to + 1
      delim_from, delim_to = string.find( self, delimiter, from  )
    end
    table.insert( result, string.sub( self, from  ) )
    return result
  end
end

local turboredis = {
    SORT_DESC = "desc",
    SORT_ASC = "asc",
    SORT_LIMIT = "limit",
    SORT_BY = "by",
    SORT_STORE = "store",
    SORT_GET = "get",
    Z_WITHSCORES = "withscores",
    Z_LIMIT = "limit",
    Z_PLUSINF = "+inf",
    Z_MININF = "-inf"
}
turboredis.Connection = require("turboredis.connection")
turboredis.PubSubConnection = require("turboredis.pubsub")
turboredis.resp = require("turboredis.resp")
turboredis.COMMANDS = require("turboredis.commands")
turboredis.util = require("turboredis.util")
return turboredis

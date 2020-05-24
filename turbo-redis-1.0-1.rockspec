package = "turbo-redis"
version = "1.0-1"
source = {
   url = "git://github.com/me/Lssikkes/turboredis",
   tag = "1.0-1",
}
description = {
   summary = "turbo-redis",
   detailed = [[
      Redis client designed to be used with Turbo.lua for increased performance over other libraries in conjunction with Turbo.
   ]],
   homepage = "https://github.com/Lssikkes/turboredis", 
   license = "MIT"
}
dependencies = {
   "lua >= 5.1, < 5.4"
}
build = {
   type = "builtin",
   modules = {
      turboredis = {
        "turboredis.lua", 
        "turboredis/command.lua",
        "turboredis/commands.lua",
        "turboredis/connection.lua",
        "turboredis/pipeline.lua",
        "turboredis/pubsub.lua",
        "turboredis/resp.lua",
        "turboredis/util.lua"
      }
   }
}

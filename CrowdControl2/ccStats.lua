local ccStats = {}

local responseCode = require("tcpResponseCode")

local mul = function (stat, change) return stat * change end
local div = function (stat, change) return stat / change end
local add = function (stat, change) return stat + change end
local sub = function (stat, change) return stat - change end


local stats ={
    {stat = "MoveSpeed", change = 1.1, increase = mul, decrease = div},
    {stat = "ShotSpeed", change = 1.1, increase = mul, decrease = div},
    {stat = "MaxFireDelay", change = 1, increase = sub, decrease = add},
    {stat = "Damage", change = 1.1, increase = mul, decrease = div},
    {stat = "Luck", change = 1, increase = add, decrease = sub}}

function modifyStat(stat, delta, method)
    if stat == "MoveSpeed" then
        player.MoveSpeed = method(player.MoveSpeed, delta)
    elseif stat == "ShotSpeed" then
        player.ShotSpeed = method(player.ShotSpeed, delta)
    elseif stat == "MaxFireDelay" then
        player.MaxFireDelay = method(player.MaxFireDelay, delta)
    elseif stat == "Damage" then
        player.Damage = method(player.Damage, delta)
    elseif stat == "Luck" then
        player.Luck = method(player.Luck, delta)
    end
end

function ccStats.AddRandomStat()
    local index = math.random(#stats)
    modifyStat(stats[index].stat, stats[index].change, stats[index].increase)
    return responseCode.success
end

function ccStats.RemoveRandomStat()
    local index = math.random(#stats)
    modifyStat(stats[index].stat, stats[index].change, stats[index].decrease)
    return responseCode.success
end

--When adding a new function add the mapping of Crowd control code to function here
ccStats.methods = {
    add_stat = ccStats.AddRandomStat,
    remove_stat = ccStats.RemoveRandomStat

}

return ccStats
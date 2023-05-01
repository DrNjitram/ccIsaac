local ccTrinkets = {}
local responseCode = require("tcpResponseCode")

-- Used internally
function ccTrinkets:GiveTrinket()
    local trinket = player:GetTrinket(0)
   if trinket ==  53 or trinket == TrinketType.TRINKET_TICK then
       return responseCode.failure, "Tick Check"
    else
	local trinket = (rng:RandomInt(TrinketType.NUM_TRINKETS))
    if trinket == 0 or trinket == 53 or trinket == 190 or trinket == nil then
    player:AddTrinket(1)
    else
	--player:AnimateTrinket (trinket, "Pickup", "PlayerPickupSparkle")
	player:AddTrinket(trinket)
        end
    end
end




function ccTrinkets:DropTrinket()
    local trinket = player:GetTrinket(0)

    if trinket ==  53 or trinket == TrinketType.TRINKET_TICK then
        return responseCode.failure, "No Trinket To Drop"
    end

    player:DropTrinket(player.Position, false)
end

function ccTrinkets:ReplaceTrinket()
    local response, message = ccTrinkets:DropTrinket()

    ccTrinkets:GiveTrinket()
    return responseCode.success
end

--When adding a new function add the mapping of Crowd control code to function here
ccTrinkets.methods = {
    replace_trinket = ccTrinkets.ReplaceTrinket,
    drop_trinket = ccTrinkets.DropTrinket
}

return ccTrinkets

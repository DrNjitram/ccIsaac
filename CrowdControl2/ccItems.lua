local ccItems = {}

local responseCode = require("tcpResponseCode")

-- internal
function ccItems.GiveItem(item)
    if item == nil then
        return responseCode.failure, "Item does not exist"
    end
    if player:HasCollectible(item) then
        return responseCode.failure, "User Already Has Item"
    end
	--player:QueueItem(Isaac.GetItemConfig():GetCollectible(item))
	player:AnimateCollectible(item, "Pickup", "PlayerPickupSparkle")
    player:AddCollectible(item, 0, true)
    return responseCode.success
end

--internal
function ccItems.TakeItem(item)
    if not player:HasCollectible(item) then
        return responseCode.failure, "User Doesn't Have Item To Remove"
    end
    player:AnimateSad ()
    player:RemoveCollectible(item)
    return responseCode.success
end

function ccItems.GiveRandomItem()
    return ccItems.GiveItem(1 + rng:RandomInt(CollectibleType.NUM_COLLECTIBLES))
end

function ccItems.GiveMissingNo()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_MISSING_NO)
end


function ccItems.GiveSoyMilk()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_SOY_MILK)
end

function ccItems.GiveTheMind()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_MIND)
end

function ccItems.GiveBrimstone()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_BRIMSTONE)
end

function ccItems.GiveKnife()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_MOMS_KNIFE)
end

function ccItems.GivePoly()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_POLYPHEMUS)
end

function ccItems.GiveSacredHeart()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_SACRED_HEART)
end

function ccItems.RemoveRandomItem()
	if player:GetCollectibleCount() < 1 then
		return responseCode.failure, "User has no items"
	else
		local colletibles = {}
		for i=1, CollectibleType.NUM_COLLECTIBLES do
			if player:HasCollectible(i) then
				table.insert(colletibles, i)
			end
		end
        if active_flight == true then
            colletibles[CollectibleType.COLLECTIBLE_THE_LORD_OF_THE_PIT] = nil
            if player:GetCollectibleCount() == 1 then
                return responseCode.failure, "User has no items to remove"
            end
        end
           
		return ccItems.TakeItem(colletibles[1 + rng:RandomInt(player:GetCollectibleCount())])
	end
    return responseCode.failure, "Failed to select item"
end

function ccItems.RemoveMissingNo()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_MISSING_NO)
end

function ccItems.RemoveSoyMilk()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_SOY_MILK)
end

function ccItems.RemoveTheMind()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_MIND)
end

function ccItems.RemoveBrimstone()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_BRIMSTONE)
end

function ccItems.RemoveKnife()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_MOMS_KNIFE)
end

function ccItems.RemovePoly()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_POLYPHEMUS) 
end

function ccItems.RemoveSacredHeart()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_SACRED_HEART)
end

--New

function ccItems.GiveOneUp()
	if CollectibleType.COLLECTIBLE_1UP ~= nil then -- for afterbirth
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_1UP)
	else
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_ONE_UP)
	end
end

function ccItems.RemoveOneUp()
    if CollectibleType.COLLECTIBLE_1UP ~= nil then -- for afterbirth
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_1UP)
	else
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_ONE_UP)
	end
end

--New 2

function ccItems.GiveRockBottom()
	if CollectibleType.COLLECTIBLE_ROCK_BOTTOM ~= nil then -- for afterbirth
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_ROCK_BOTTOM)
	else
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_ROCK_BOTTOM)
	end
end

function ccItems.RemoveRockBottom()
    if CollectibleType.COLLECTIBLE_ROCK_BOTTOM ~= nil then -- for afterbirth
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_ROCK_BOTTOM)
	else
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_ROCK_BOTTOM)
	end
end

function ccItems.GiveBlackCandle()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_BLACK_CANDLE)
end

function ccItems.RemoveBlackCandle()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_BLACK_CANDLE)
end

function ccItems.GiveTinyPlanet()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_TINY_PLANET)
end

function ccItems.RemoveTinyPlanet()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_TINY_PLANET)
end

function ccItems.GiveCurseOfTheTower()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_CURSE_OF_THE_TOWER)
end

function ccItems.RemoveCurseOfTheTower()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_CURSE_OF_THE_TOWER)
end

function ccItems.GiveChaos()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_CHAOS)
end

function ccItems.RemoveChaos()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_CHAOS)
end

function ccItems.GiveIpecac()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_IPECAC)
end

function ccItems.RemoveIpecac()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_IPECAC)
end

function ccItems.GiveHostHat()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_HOST_HAT)
end

function ccItems.RemoveHostHat()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_HOST_HAT)
end

function ccItems.GiveTheWiz()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_THE_WIZ)
end

function ccItems.RemoveTheWiz()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_THE_WIZ)
end

function ccItems.GiveDeepPockets()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_DEEP_POCKETS)
end

function ccItems.RemoveDeepPockets()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_DEEP_POCKETS)
end

function ccItems.GiveBirthRight()
	if CollectibleType.COLLECTIBLE_BIRTHRIGHT ~= nil then -- for afterbirth
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_BIRTHRIGHT)
	else
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_BIRTHRIGHT)
	end
end

function ccItems.RemoveBirthRight()
    if CollectibleType.COLLECTIBLE_BIRTHRIGHT ~= nil then -- for afterbirth
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_BIRTHRIGHT)
	else
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_BIRTHRIGHT)
	end
end

function ccItems.GiveCSection()
	if CollectibleType.COLLECTIBLE_C_SECTION ~= nil then -- for afterbirth
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_C_SECTION)
	else
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_C_SECTION)
	end
end

function ccItems.RemoveCSection()
    if CollectibleType.COLLECTIBLE_C_SECTION ~= nil then -- for afterbirth
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_C_SECTION)
	else
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_C_SECTION)
	end
end

function ccItems.GiveBozo()
	if CollectibleType.COLLECTIBLE_BOZO ~= nil then -- for afterbirth
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_BOZO)
	else
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_BOZO)
	end
end

function ccItems.RemoveBozo()
    if CollectibleType.COLLECTIBLE_BOZO ~= nil then -- for afterbirth
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_BOZO)
	else
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_BOZO)
	end
end

function ccItems.GiveGodHead()
	if CollectibleType.COLLECTIBLE_GODHEAD ~= nil then -- for afterbirth
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_GODHEAD)
	else
		return ccItems.GiveItem(CollectibleType.COLLECTIBLE_GODHEAD)
	end
end

function ccItems.RemoveGodHead()
    if CollectibleType.COLLECTIBLE_GODHEAD ~= nil then -- for afterbirth
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_GODHEAD)
	else
		return ccItems.TakeItem(CollectibleType.COLLECTIBLE_GODHEAD)
	end
end

function ccItems.GiveCursedEeye()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_CURSED_EYE)
end

function ccItems.RemoveCursedEye()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_CURSED_EYE)
end

function ccItems.GiveTechX()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_TECH_X)
end

function ccItems.RemoveTechX()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_TECH_X)
end

function ccItems.GiveDrFetus()
    return ccItems.GiveItem(CollectibleType.COLLECTIBLE_DR_FETUS)
end

function ccItems.RemoveDrFetus()
    return ccItems.TakeItem(CollectibleType.COLLECTIBLE_DR_FETUS)
end

--When adding a new function add the mapping of Crowd control code to function here
ccItems.methods = {
    give_missing_no = ccItems.GiveMissingNo,
    give_soy_milk = ccItems.GiveSoyMilk,
    give_the_mind = ccItems.GiveTheMind,
    give_brimstone = ccItems.GiveBrimstone,
    give_knife = ccItems.GiveKnife,
    give_poly = ccItems.GivePoly,
    give_sacred_heart = ccItems.GiveSacredHeart,
    remove_missing_no = ccItems.RemoveMissingNo,
    remove_soy_milk = ccItems.RemoveSoyMilk,
    remove_the_mind = ccItems.RemoveTheMind,
    remove_brimstone = ccItems.RemoveBrimstone,
    remove_knife = ccItems.RemoveKnife,
    remove_poly = ccItems.RemovePoly,
    remove_sacred_heart = ccItems.RemoveSacredHeart,
	remove_random_item = ccItems.RemoveRandomItem,
	give_random_item = ccItems.GiveRandomItem,
	give_one_up = ccItems.GiveOneUp,
	remove_one_up = ccItems.RemoveOneUp,
    give_rock_bottom = ccItems.GiveRockBottom,
    remove_rock_bottom = ccItems.RemoveRockBottom,
    give_black_candle = ccItems.GiveBlackCandle,
    remove_black_candle = ccItems.RemoveBlackCandle,
    give_tiny_planet = ccItems.GiveTinyPlanet,
    remove_tiny_planet = ccItems.RemoveTinyPlanet,
    give_curse_of_the_tower = ccItems.GiveCurseOfTheTower,
    remove_curse_of_the_tower = ccItems.RemoveCurseOfTheTower,
    give_chaos = ccItems.GiveChaos,
    remove_chaos = ccItems.RemoveChaos,
    give_ipecac = ccItems.GiveIpecac,
    remove_ipecac = ccItems.RemoveIpecac,
    give_host_hat = ccItems.GiveHostHat,
    remove_host_hat = ccItems.RemoveHostHat,
    give_the_wiz = ccItems.GiveTheWiz,
    remove_the_wiz = ccItems.RemoveTheWiz,
    give_deep_pockets = ccItems.GiveDeepPockets,
    remove_deep_pockets = ccItems.RemoveDeepPockets,
    give_birth_right = ccItems.GiveBirthRight,
    remove_birth_right = ccItems.RemoveBirthRight,
    give_c_section = ccItems.GiveCSection,
    remove_c_section = ccItems.RemoveCSection,
    give_bozo = ccItems.GiveBozo,
    remove_bozo = ccItems.RemoveBozo,
    give_god_head = ccItems.GiveGodHead,
    remove_god_head = ccItems.RemoveGodHead,
    give_cursed_eye = ccItems.GiveCursedEeye,
    remove_cursed_eye = ccItems.RemoveCursedEye,
    give_tech_x = ccItems.GiveTechX,
    remove_tech_x = ccItems.RemoveTechX,
    give_dr_fetus = ccItems.GiveDrFetus,
    remove_dr_fetus = ccItems.RemoveDrFetus
}

return ccItems
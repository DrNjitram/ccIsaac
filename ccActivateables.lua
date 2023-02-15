local ccActivateables = {}

local responseCode = require("tcpResponseCode")

-- Internal function
function ccActivateables.UseActiveItem(item)
    player:UseActiveItem(
        item,
        true,
        false,
        false,
        false
    )
end

function ccActivateables.RollD1()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_D1)
    return responseCode.success
end

function ccActivateables.RollD4()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_D4)
    return responseCode.success
end

function ccActivateables.RollD6()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_D6)
    return responseCode.success
end

function ccActivateables.RollD7()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_D7)
    return responseCode.success
end

function ccActivateables.RollD8()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_D8)
    return responseCode.success
end

function ccActivateables.RollD10()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_D10)
    return responseCode.success
end

function ccActivateables.RollD12()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_D12)
    return responseCode.success
end

function ccActivateables.RollD20()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_D20)
    return responseCode.success
end

function ccActivateables.RollDInf()
    if CollectibleType.COLLECTIBLE_D_INFINITY ~= nil then -- for afterbirth
		return ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_D_INFINITY)
	else
		return ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_DINF)
	end
    return responseCode.success
end

function ccActivateables.UseGuppiesHead()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_GUPPYS_HEAD)
    return responseCode.success
end

function ccActivateables.UseGuppiesPaw()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_GUPPYS_PAW)
    return responseCode.success
end

function ccActivateables.UseShovel()
    if CollectibleType.COLLECTIBLE_WE_NEED_TO_GO_DEEPER ~= nil then -- for afterbirth
		return ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_WE_NEED_TO_GO_DEEPER)
	else
		return ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_WE_NEED_GO_DEEPER)
	end
    return responseCode.success
end

function ccActivateables.UseDadsKey()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_DADS_KEY)
    return responseCode.success
end

function ccActivateables.UseClicker()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_CLICKER)
    return responseCode.success
end

function ccActivateables.UsePause()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_PAUSE)
    return responseCode.success
end

function ccActivateables.UseMegaBlast()
    if CollectibleType.COLLECTIBLE_MEGA_BLAST ~= nil then -- for afterbirth
		return ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_MEGA_BLAST)
	else
		return ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_MEGA_SATANS_BREATH)
	end
    return responseCode.success
end

function ccActivateables.UseForgetMeNow()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_FORGET_ME_NOW)
    return responseCode.success
end

function ccActivateables.UseRKey()
    if CollectibleType.COLLECTIBLE_R_KEY == nil then
        ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_FORGET_ME_NOW)
    else
        ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_R_KEY)
    end
    return responseCode.success
end

function ccActivateables.UseMegaMush()
    if CollectibleType.COLLECTIBLE_MEGA_MUSH == nil then
        return responseCode.failure, "Must be playing Repentance"
    else
        ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_MEGA_MUSH)
    end
    return responseCode.success
end
--NEW added items
function ccActivateables.UseMysteryGift()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_MYSTERY_GIFT)
    return responseCode.success
end

function ccActivateables.UseDiplopia ()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_DIPLOPIA)
    return responseCode.success
end

function ccActivateables.UseBoxOfFriends()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_BOX_OF_FRIENDS)
    return responseCode.success
end

function ccActivateables.UseSmelter()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER)
    return responseCode.success
end

function ccActivateables.UseSacrificialAltar()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_SACRIFICIAL_ALTAR)
    return responseCode.success
end

function ccActivateables.UseDullRazor()
    ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_DULL_RAZOR)
    return responseCode.success
end

function ccActivateables.UseWavyCap()
    if CollectibleType.COLLECTIBLE_WAVY_CAP == nil then
        return responseCode.failure, "Must be playing Repentance"
    else
        ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_WAVY_CAP)
    end
    return responseCode.success
end

function ccActivateables.UseSprinkler()
    if CollectibleType.COLLECTIBLE_SPRINKLER == nil then
        return responseCode.failure, "Must be playing Repentance"
    else
        ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_SPRINKLER)
    end
    return responseCode.success
end

function ccActivateables.UseDeathCertificate()
    if CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE == nil then
        return responseCode.failure, "Must be playing Repentance"
    else
        ccActivateables.UseActiveItem(CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE)
    end
    return responseCode.success
end

--When adding a new function add the mapping of Crowd control code to function here
ccActivateables.methods = {
    use_d1 = ccActivateables.RollD1,
    use_d4 = ccActivateables.RollD4,
    use_d6 = ccActivateables.RollD6,
    use_d7 = ccActivateables.RollD7,
    use_d8 = ccActivateables.RollD8,
    use_d10 = ccActivateables.RollD10,
    use_d12 = ccActivateables.RollD12,
    use_d20 = ccActivateables.RollD20,
    use_d_inf = ccActivateables.RollDInf,

    use_guppies_head = ccActivateables.UseGuppiesHead,
    use_guppies_paw = ccActivateables.UseGuppiesPaw,

    use_shovel = ccActivateables.UseShovel,
    use_dads_key = ccActivateables.UseDadsKey,
    use_clicker = ccActivateables.UseClicker,
    use_pause = ccActivateables.UsePause,
    use_mega_blast = ccActivateables.UseMegaBlast,
    use_forget_me_now = ccActivateables.UseForgetMeNow,
	use_r_key = ccActivateables.UseRKey,
    use_mega_mush = ccActivateables.UseMegaMush,
    use_mystery_gift = ccActivateables.UseMysteryGift,
    use_diplopia = ccActivateables.UseDiplopia,
    use_box_of_friends = ccActivateables.UseBoxOfFriends,
    use_smelter = ccActivateables.UseSmelter,
    use_sacrificial_altar = ccActivateables.UseSacrificialAltar,
    use_dull_razor = ccActivateables.UseDullRazor,
    use_wavy_cap = ccActivateables.UseWavyCap,
    use_sprinkler = ccActivateables.UseSprinkler,
    use_death_certificate = ccActivateables.UseDeathCertificate

}
return ccActivateables
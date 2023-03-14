local ccTimed = {}

local responseCode = require("tcpResponseCode")

function ccTimed.ActivateSeedEffect(effect)
    if Game():GetSeeds():HasSeedEffect(effect) == true then
        return responseCode.failure, "Effect already active"
    end
    if Game():GetSeeds():AddSeedEffect(effect) ==true then
    return responseCode.success
    end
end

function ccTimed.EndSeedEffect(effect)
    if Game():GetSeeds():HasSeedEffect(effect) then
        Game():GetSeeds():RemoveSeedEffect(effect)
    end
    return responseCode.success
end

function ccTimed.GiveItem(item)
    if item == nil then
        return responseCode.failure, "Item does not exist"
    end
    if player:HasCollectible(item) then
        return responseCode.failure, "User Already Has Item"
    end
    player:AddCollectible(item, 0, true)

    return responseCode.success
end

function ccTimed.InverseControls()
    return ccTimed.ActivateSeedEffect(SeedEffect.SEED_CONTROLS_REVERSED)
end

function ccTimed.InverseControls_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_CONTROLS_REVERSED)
end

function ccTimed.Pixelation()
    if SeedEffect.SEED_RETRO_VISION ~= nil then
        pixelation_active = true
        return ccTimed.ActivateSeedEffect(SeedEffect.SEED_RETRO_VISION)
    else
        pixelation_active = true
        Game():AddPixelation(300)
    end
    return responseCode.success
end

function ccTimed.Pixelation_end()
    pixelation_active = false
    if SeedEffect.SEED_RETRO_VISION ~= nil then
        return ccTimed.EndSeedEffect(SeedEffect.SEED_RETRO_VISION)
    end
    return responseCode.success
end

function ccTimed.flipped()
    shader_inverted = 1
    return responseCode.success
end

function ccTimed.flipped_end()
    shader_inverted = 0
    return responseCode.success
end

--I just think this looks cooler thats it
function ccTimed.flight()
    active_flight = true
    return ccTimed.GiveItem(CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT)
end

function ccTimed.flight_end()
    active_flight = false
    if not player:HasCollectible(CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT) then
        return responseCode.success --Failure, but success? somehow?
    end
    player:RemoveCollectible(CollectibleType.COLLECTIBLE_LORD_OF_THE_PIT)
    return responseCode.success
end

function ccTimed.SUPERHOT()
    if SeedEffect.SEED_SUPER_HOT ~= nil then
        return ccTimed.ActivateSeedEffect(SeedEffect.SEED_SUPER_HOT)
    else
        return responseCode.failure, "Can only be used with Repentance"
    end

    return responseCode.success
end

function ccTimed.SUPERHOT_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_SUPER_HOT)
end

function ccTimed.NoHUD()
    ccTimed.ActivateSeedEffect(SeedEffect.SEED_NO_HUD)
end

function ccTimed.NoHUD_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_NO_HUD)
end

function ccTimed.OLDTV()
    ccTimed.ActivateSeedEffect(SeedEffect.SEED_OLD_TV)
end

function ccTimed.OLDTV_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_OLD_TV)
end

function ccTimed.POOPTRAIL()
    ccTimed.ActivateSeedEffect(SeedEffect.SEED_POOP_TRAIL)
end

function ccTimed.POOPTRAIL_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_POOP_TRAIL)
end

function ccTimed.IcePhysics()
    ccTimed.ActivateSeedEffect(SeedEffect.SEED_ICE_PHYSICS)
end

function ccTimed.IcePhysics_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_ICE_PHYSICS)
end

function ccTimed.CamoEnemies()
    ccTimed.ActivateSeedEffect(SeedEffect.SEED_CAMO_ENEMIES)
end

function ccTimed.CamoEnemies_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_CAMO_ENEMIES)
end

function ccTimed.Dyslexia()
    ccTimed.ActivateSeedEffect(SeedEffect.SEED_DYSLEXIA)
end

function ccTimed.Dyslexia_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_DYSLEXIA)
end

function ccTimed.DamageWhenStopped()
    ccTimed.ActivateSeedEffect(SeedEffect.SEED_DAMAGE_WHEN_STOPPED)
end

function ccTimed.DamageWhenStopped_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_DAMAGE_WHEN_STOPPED)
end

function ccTimed.MassiveDamage()
    ccTimed.ActivateSeedEffect(SeedEffect.SEED_ISAAC_TAKES_MASSIVE_DAMAGE)
end

function ccTimed.MassiveDamage_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_ISAAC_TAKES_MASSIVE_DAMAGE)
end

function ccTimed.Invincible()
    return ccTimed.ActivateSeedEffect(SeedEffect.SEED_INVINCIBLE)
end

function ccTimed.Invincible_end()
    return ccTimed.EndSeedEffect(SeedEffect.SEED_INVINCIBLE)
end


--turned off for now :(
--function ccTimed.Gfuel()
--    ccTimed.ActivateSeedEffect(SeedEffect.SEED_G_FUEL)
--end

--function ccTimed.Gfuel_end()
--    return ccTimed.EndSeedEffect(SeedEffect.SEED_G_FUEL)
--end

ccTimed.methods = {
    inverted_timed = ccTimed.InverseControls,
    inverted_timed_end = ccTimed.InverseControls_end,
    pixelation_timed = ccTimed.Pixelation,
    pixelation_timed_end = ccTimed.Pixelation_end,
    flipped_timed = ccTimed.flipped,
    flipped_timed_end = ccTimed.flipped_end,
    flight_timed = ccTimed.flight,
    flight_timed_end = ccTimed.flight_end,
    super_hot_timed = ccTimed.SUPERHOT,
    super_hot_timed_end = ccTimed.SUPERHOT_end,
    no_hud_timed = ccTimed.NoHUD,
    no_hud_timed_end = ccTimed.NoHUD_end,
    old_tv_timed = ccTimed.OLDTV,
    old_tv_timed_end = ccTimed.OLDTV_end,
    poop_trail_timed = ccTimed.POOPTRAIL,
    poop_trail_timed_end = ccTimed.POOPTRAIL_end,
    ice_physics_timed = ccTimed.IcePhysics,
    ice_physics_timed_end = ccTimed.IcePhysics_end,
    camo_enemies_timed = ccTimed.CamoEnemies,
    camo_enemies_timed_end = ccTimed.CamoEnemies_end,
    dyslexia_timed = ccTimed.Dyslexia,
    dyslexia_timed_end = ccTimed.Dyslexia_end,
    damage_when_stopped_timed = ccTimed.DamageWhenStopped,
    damage_when_stopped_timed_end = ccTimed.DamageWhenStopped_end,
    isaac_takes_massive_damage_timed = ccTimed.MassiveDamage,
    isaac_takes_massive_damage_timed_end = ccTimed.MassiveDamage_end,
    invincible_timed = ccTimed.Invincible,
    invincible_timed_end = ccTimed.Invincible_end
}

return ccTimed

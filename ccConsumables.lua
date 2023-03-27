local ccConsumables = {}
local responseCode = require("tcpResponseCode")
--Increased the amount to a full heart container as it is confusing for players to have a half empty heart container they can't fill
function ccConsumables.AddHeartContainer()
    local character = player:GetPlayerType()
    if character == PlayerType.PLAYER_THELOST or character == PlayerType.PLAYER_THELOST_B or character == PlayerType.PLAYER_KEEPER or character == PlayerType.PLAYER_KEEPER_B or character == PlayerType.PLAYER_JUDAS_B or player:GetMaxHearts() == 24 then
        return responseCode.failure, "Already At Max Hearts"
    end
    player:AddMaxHearts(2)
    player:AddHearts(2)
    return responseCode.success
end

function ccConsumables.RemoveHeartContainer()
    if character == PlayerType.PLAYER_KEEPER or character == PlayerType.PLAYER_KEEPER_B or player:GetMaxHearts() == 2 or player:GetMaxHearts() == 0 then
        return responseCode.failure, "Already At Min Hearts"
    end
    player:AddMaxHearts(-2)
    return responseCode.success
end

function ccConsumables.HealHalfHeart()
    if player:GetHearts() >= player:GetMaxHearts() then
        return responseCode.failure, "Already At Full Health"
    end
    player:AddHearts(1)
    return responseCode.success
end
--added extra hearts just in case they are playing maggy with birthright
function ccConsumables.HealFull()
    if player:GetHearts() >= player:GetMaxHearts() then
        return responseCode.failure, "Already At Full Health"
    end
    player:AddHearts(36)
    return responseCode.success
end

function ccConsumables.DamageHalfHeart()
    if player:GetHearts() == 1 or player:GetHearts() == 0 or player:GetHearts() == 2 then
	    return responseCode.failure, "Already At Min Hearts"
    end
    player:TakeDamage(1, DamageFlag.DAMAGE_RED_HEARTS, EntityRef(player), 0)
    return responseCode.success
end

function ccConsumables.AddCoin(numberOfCoins)
    numberOfCoins = numberOfCoins or 1
    if player:GetNumCoins() >= 99 then
        return responseCode.failure, "Already At Full Coins"
    end
    player:AddCoins(numberOfCoins)
    return responseCode.success
end

function ccConsumables.RemoveCoin(numberOfCoins)
    numberOfCoins = numberOfCoins or 1
    if player:GetNumCoins() <= 0 then
        return responseCode.failure, "Already At Min Coins"
    end
	if player:GetNumCoins() < numberOfCoins then
		return responseCode.failure, "Does Not Have Enough Coins"
    end
    player:AddCoins(-numberOfCoins);
    return responseCode.success
end

function ccConsumables.AddBomb(numberOfBombs)
    numberOfBombs = numberOfBombs or 1
    if player:GetNumBombs() >= 99 then
        return responseCode.failure, "Already At Full Bombs"
    end
    player:AddBombs(numberOfBombs)
    return responseCode.success
end

function ccConsumables.RemoveBomb(numberOfBombs)
    numberOfBombs = numberOfBombs or 1
    if player:GetNumBombs() <= 0 then
        return responseCode.failure, "Already At Min Bombs"
    end
	if player:GetNumBombs() < numberOfBombs then
		return responseCode.failure, "Does Not Have Enough Bombs"
    end
    player:AddBombs(-numberOfBombs)
    return responseCode.success
end

function ccConsumables.AddGoldenBomb()
    if player:HasGoldenBomb() then
        return responseCode.failure, "Already Has A Golden Bomb"
    end
    player:AddGoldenBomb()
    return responseCode.success
end

function ccConsumables.RemoveGoldenBomb()
    if not player:HasGoldenBomb() then
        return responseCode.failure, "Doesn't Have A Golden Bomb"
    end
    player:RemoveGoldenBomb()
    return responseCode.success
end

function ccConsumables.AddKey(numberofKeys)
    numberofKeys = numberofKeys or 1
    if player:GetNumKeys() >= 99 then
        return responseCode.failure, "Already At Full Keys"
    end
    player:AddKeys(numberofKeys)
    return responseCode.success
end

function ccConsumables.RemoveKey(numberofKeys)
    numberofKeys = numberofKeys or 1
    if player:GetNumKeys() <= 0 then
        return responseCode.failure, "Already At Min Keys"
    end
	if player:GetNumKeys() < numberofKeys then
		return responseCode.failure, "Does Not Have Enough Keys"
    end
    player:AddKeys(-numberofKeys)
    return responseCode.success
end

function ccConsumables.AddGoldenKey()
    if player:HasGoldenKey() then
        return responseCode.failure, "Already Has A Golden Key"
    end
    player:AddGoldenKey()
    return responseCode.success
end

function ccConsumables.RemoveGoldenKey()
    if not player:HasGoldenKey() then
        return responseCode.failure, "Doesn't Have A Golden Key"
    end
    player:RemoveGoldenKey()
    return responseCode.success
end

function ccConsumables.UseRandomCard()
    player:UseCard(1 + rng:RandomInt(Card.NUM_CARDS))
    return responseCode.success
end

function ccConsumables.UseRandomPill()
    player:UsePill(rng:RandomInt(PillEffect.NUM_PILL_EFFECTS), rng:RandomInt(PillColor.NUM_PILLS))
    return responseCode.success
end

-- New
function ccConsumables.AddFlies(numberofFlies)
    player:AddBlueFlies(numberofFlies, player.Position, player)
    return responseCode.success
end

function ccConsumables.AddSpiders(numberofSpiders)
    for i=1,numberofSpiders do player:AddBlueSpider(player.Position) end
    return responseCode.success
end

function ccConsumables.AddDips(numberofDips)
    local dipTypes = {0, 1, 2, 3, 4, 5, 6, 12, 13, 14, 20}
    for i=1,numberofDips do player:AddFriendlyDip(dipTypes[1 + rng:RandomInt(11)], player.Position) end
    return responseCode.success
end

function ccConsumables.AddGigabomb()
    if player:GetNumBombs() >= 99 then
        return responseCode.failure, "Already At Full Bombs"
    end
    player:AddBombs(1)
    player:AddGigaBombs(1)
    return responseCode.success
end

function ccConsumables.RemoveGigabomb()
    if player:GetNumGigaBombs() <= 0 then
        return responseCode.failure, "Already At Min Gigabombs"
    end
    player:AddBombs(-1)
    player:AddGigaBombs(-1)
    return responseCode.success
end

--New 2

function ccConsumables.UseExplosiveDiarrhea()
    player:UsePill((PillEffect.PILLEFFECT_EXPLOSIVE_DIARRHEA),(PillColor.PILL_WHITE_AZURE))
    return responseCode.success
end

function ccConsumables.UseHolyCard()
    player:UseCard((Card.CARD_HOLY))
    return responseCode.success
end

function ccConsumables.UseDagazRune()
    player:UseCard((Card.RUNE_DAGAZ))
    return responseCode.success
end

function ccConsumables.UseChaosCard()
    player:UseCard((Card.CARD_CHAOS))
    return responseCode.success
end

function ccConsumables.UseCreditCard()
    player:UseCard((Card.CARD_CREDIT))
    return responseCode.success
end

function ccConsumables.UseSuicideKingCard()
    player:UseCard((Card.CARD_SUICIDE_KING))
    return responseCode.success
end

function ccConsumables.UseReverseHighPriestessCard()
    player:UseCard((Card.CARD_REVERSE_HIGH_PRIESTESS))
    return responseCode.success
end

function ccConsumables.UseReverseEmperor()
    player:UseCard((Card.CARD_REVERSE_EMPEROR))
    return responseCode.success
end

function ccConsumables.UseSoulOfCain()
    player:UseCard((Card.CARD_SOUL_CAIN))
    return responseCode.success
end

function ccConsumables.UseSoulOfEve()
    player:UseCard((Card.CARD_SOUL_EVE))
    return responseCode.success
end

function ccConsumables.UseSoulOfLilith()
    player:UseCard((Card.CARD_SOUL_LILITH))
    return responseCode.success
end

--When adding a new function add the mapping of Crowd control code to function here
ccConsumables.methods = {
    add_heart_container = ccConsumables.AddHeartContainer,
    remove_heart_container = ccConsumables.RemoveHeartContainer,
    damage_half_heart = ccConsumables.DamageHalfHeart,
    heal_half_heart = ccConsumables.HealHalfHeart,
    heal_full = ccConsumables.HealFull,

    add_coin = ccConsumables.AddCoin,
    remove_coin = ccConsumables.RemoveCoin,
    add_bomb = ccConsumables.AddBomb,
    remove_bomb = ccConsumables.RemoveBomb,
    add_key = ccConsumables.AddKey,
    remove_key = ccConsumables.RemoveKey,
    add_golden_bomb = ccConsumables.AddGoldenBomb,
    remove_golden_bomb = ccConsumables.RemoveGoldenBomb,
    add_golden_key = ccConsumables.AddGoldenKey,
    remove_golden_key = ccConsumables.RemoveGoldenKey,

    use_random_card = ccConsumables.UseRandomCard,
    use_holy_card = ccConsumables.UseHolyCard,
    use_random_pill = ccConsumables.UseRandomPill,
    use_explosive_diarrhea_pill = ccConsumables.UseExplosiveDiarrhea,
    use_dagaz_rune = ccConsumables.UseDagazRune,
    use_chaos_card = ccConsumables.UseChaosCard,
    use_credit_card = ccConsumables.UseCreditCard,
    use_suicide_king_card = ccConsumables.UseSuicideKingCard,
    use_reverse_high_priestess_card = ccConsumables.UseReverseHighPriestessCard,
    use_reverse_emperor_card = ccConsumables.UseReverseEmperor,
    use_soul_of_cain_card = ccConsumables.UseSoulOfCain,
    use_soul_of_eve_card = ccConsumables.UseSoulOfEve,
    use_soul_of_lilith_card = ccConsumables.UseSoulOfLilith,

	give_blue_flies = ccConsumables.AddFlies,
	give_blue_spider = ccConsumables.AddSpiders,
    give_random_dip = ccConsumables.AddDips,

    add_giga_bomb = ccConsumables.AddGigabomb,
    remove_giga_bomb = ccConsumables.RemoveGigabomb
}

return ccConsumables


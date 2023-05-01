using System;
using System.Collections.Generic;
using CrowdControl.Common;
using JetBrains.Annotations;
using ConnectorType = CrowdControl.Common.ConnectorType;
using EffectRequest = ConnectorLib.JSON.EffectRequest;
using RequestType = ConnectorLib.JSON.RequestType;

namespace CrowdControl.Games.Packs
{
    [UsedImplicitly]
    public class BindingOfIsaacRepentance2 : SimpleTCPPack
    {
        public override string Host => "127.0.0.1";

        public override ushort Port => 58430;

        public override ISimpleTCPPack.MessageFormat MessageFormat => ISimpleTCPPack.MessageFormat.CrowdControlLegacy;

        public BindingOfIsaacRepentance2(UserRecord player, Func<CrowdControlBlock, bool> responseHandler, Action<object> statusUpdateHandler) : base(player, responseHandler, statusUpdateHandler) { }

        public override Game Game => new Game(186, "The Binding Of Isaac: Repentance (orcchamp)", "BindingOfIsaacRepentance_orcchamp", "PC", ConnectorType.SimpleTCPConnector);

        // When adding new functions to the mod please add the new Crowd Control Effect here
        //This is a display name mapped to a unique string. This is used to map the function from CC to Mod
        public override EffectList Effects => new List<Effect>
        {
            new("Add Heart Container", "add_heart_container") {Price = 25, Description = "Add a red heart container"},
            new("Remove Heart Container", "remove_heart_container") {Price = 30, Description = "Remove a red heart container (can not remove last red heart container)"},
            new("Damage Player", "damage_half_heart") {Price = 10, Description = "Deal half a red heart of damage (will not kill player)"},
            new("Heal Player", "heal_half_heart") {Price = 10, Description = "Heal half a red heart of damage"},
            new("Full Heal Player", "heal_full") {Price = 50, Description = "Fills all empty red hearts"},
            new("Teleport Player", "random_tp") {Price = 25, Description = "Teleport player to a random room, including secret rooms"},
            new("Give Blue spider", "quantity_give_blue_spider") {Quantity = 25, Price = 5, Description = "Give the player a number of blue spiders"},
            new("Give Flies", "quantity_give_blue_flies") {Quantity = 25, Price = 5, Description = "Give the player a number of blue flies"},
            new("Give Dips", "quantity_give_random_dip") {Quantity = 25, Price = 5, Description = "Give the player a number of random dips"},
            new("Charge Item", "charge_item") {Price = 20, Description = "Fully charge the current item!"},
            new("Use Item", "use_active_item") {Price = 25, Description = "Use the current active item and drain its charge!"},
            new("Fart!", "fart") {Price = 10, Description = "Oof, thats a smelly one"},
            new("Explode!", "explode") {Price = 10, Description = "Explosion (will not kill player)!"},
            new("Apply A Random Curse", "apply_random_curse") {Price = 50, Description = "Apply a random curse, like curse of Gamma Up!, the blind, the maze"},

			//Timed Effects Folder
			//new("Timed Effects", "timed_effects", ItemKind.Folder),
            new("No HUD", "no_hud_timed") {Category = "Timed Effects", Duration = 30, Price = 50, Description = "I CAN'T SEE!"},
            new("SUPER HOT", "super_hot_timed") {Category = "Timed Effects", Duration = 30, Price = 50, Description = "SUPER HOT SUPER HOT SUPER HOT SUPER HOT SUPER HOT"},
            new("Invert Controls", "inverted_timed") {Category = "Timed Effects", Duration = 30, Price = 50, Description = "What is up and what is down?"},
            new("Invulnerability", "invincible_timed") {Category = "Timed Effects", Duration = 15, Price = 50, Description = "I AM INVINCIBLE!"},
            new("Retrovision", "pixelation_timed") {Category = "Timed Effects", Duration = 30, Price = 50, Description = "We all know the CD-i was the best console!"},
            new("Flip the screen", "flipped_timed") {Category = "Timed Effects", Duration = 30, Price = 50, Description = "What is up and what is down *2?"},
            new("Flight", "flight_timed") {Category = "Timed Effects", Duration = 30, Price = 50, Description = "Fly so high!",},
            new("CRT Vision", "old_tv_timed") {Category = "Timed Effects", Duration = 30, Price = 50, Description = "Just like in the old days!"},
            new("Poop Trail", "poop_trail_timed") {Category = "Timed Effects", Duration = 15, Price = 50, Description = "Just gross"},
            new("Massive Damage", "isaac_takes_massive_damage_timed") {Category = "Timed Effects", Duration = 15, Price = 500, Description = "Paper thin defense (All damage taken is equal to 12 full hearts)"},
            new("Damage when stopped", "damage_when_stopped_timed") {Category = "Timed Effects", Duration = 15, Price = 250, Description = "Can't stop won't stop"},
            new("Camo Enemies", "camo_enemies_timed") {Category = "Timed Effects", Duration = 30, Price = 50, Description = "Turn on enemy radar."},
            new("Dyslexia", "dyslexia_timed") {Category = "Timed Effects", Duration = 30,  Price = 50, Description = "Learn 2 read."},
            new("Ice Physics", "ice_physics_timed") {Category = "Timed Effects", Duration = 30,  Price = 50, Description = "Don't lose your grip now."},


			//Stats folder
			//new("Change Stats", "change_stats", ItemKind.Folder),
            new("Buff Random Stat", "add_stat") {Category = "Change Stats", Price = 25, Description = "Buff a random stat (Damage, Speed, Shot speed by 10%, Luck and Shot delay by 1)"},
            new("Nerf Random Stat", "remove_stat") {Category = "Change Stats", Price = 30, Description = "Nerf a random stat (Damage, Speed, Shot speed by 10%, Luck and Shot delay by 1)"},

			//Trinket Folder
			//new("Give/Take Trinket", "give_take_trinket", ItemKind.Folder),
            new("Give Random Trinket", "replace_trinket") {Category = "Give/Take Trinket Items", Price = 25, Description = "Give a random trinket (will drop current trinket on floor)"},
            new("Drop Trinket", "drop_trinket") {Category = "Give/Take Trinket Items", Price = 25, Description = "Drop the current trinket onto te floor"},

			//Give Take Consumeable Folder
			//new("Give/Take Consumable", "give_take_consumeable", ItemKind.Folder),
            new("Give Coin", "quantity_add_coin") {Category = "Give/Take Consumable Items", Quantity = 99, Price = 5, Description = ""},
            new("Take Coin", "quantity_remove_coin") {Category = "Give/Take Consumable Items", Quantity = 99, Price = 5, Description = ""},
            new("Give Bomb", "quantity_add_bomb") {Category = "Give/Take Consumable Items", Quantity = 99, Price = 5, Description = ""},
            new("Take Bomb", "quantity_remove_bomb") {Category = "Give/Take Consumable Items", Quantity = 99, Price = 5, Description = ""},
            new("Give Golden Bomb", "add_golden_bomb") {Category = "Give/Take Consumable Items", Price = 25, Description = "Unlimited bombs!"},
            new("Take Golden Bomb", "remove_golden_bomb") {Category = "Give/Take Consumable Items", Price = 25, Description = ""},
            new("Give Key", "quantity_add_key") {Category = "Give/Take Consumable Items", Quantity = 99, Price = 5, Description = ""},
            new("Take Key", "quantity_remove_key") {Category = "Give/Take Consumable Items", Quantity = 99, Price = 5, Description = ""},
            new("Give Golden Key", "add_golden_key") {Category = "Give/Take Consumable Items", Price = 25, Description = "Unlimited keys!"},
            new("Take Golden Key", "remove_golden_key") {Category = "Give/Take Consumable Items", Price = 25, Description = ""},
            new("Add Gigabomb", "add_giga_bomb") {Category = "Give/Take Consumable Items", Price = 25, Description = "Add a big boi bomb that blows up the floor!"},
            new("Take Gigabomb", "remove_giga_bomb") {Category = "Give/Take Consumable Items", Price = 25, Description = ""},

			//Pocket items such as Cards, Pills, Souls, and runes
			//new("Pocket Items", "pocket_items", ItemKind.Folder),
            new("Use Random Pill", "use_random_pill") {Category = "Pocket Items", Price = 15, Description = "Use a random pill"},
            new("Explosive Diarrhea", "use_explosive_diarrhea_pill") {Category = "Pocket Items", Price = 100, Description = "Explosive Diarrhea is putting it mildy"},
            new("Use Random Card", "use_random_card") {Category = "Pocket Items", Price = 25, Description = "Use a random card"},
            new("Use Holy Card", "use_holy_card") {Category = "Pocket Items", Price = 25, Description = "Don't forget to use protection"},
            new("Use Dagaz Rune", "use_dagaz_rune") {Category = "Pocket Items", Price = 25, Description = "Undoes Curses and Adds 1 soul heart"},
            new("Use Chaos Card", "use_chaos_card") {Category = "Pocket Items", Price = 10, Description = "What if you only had one shot?"},
            new("Use Credit Card", "use_credit_card") {Category = "Pocket Items", Price = 50, Description = "Attention all BOI gamers. Isaac is in great danger and needs your help to beat Mom."},
            new("Use Suicide King", "use_suicide_king_card") {Category = "Pocket Items", Price = 500, Description = "Kills Isaac and spawns 10 consumables and/or items around the location of use."},
            new("Use Reverse High Priestess", "use_reverse_high_priestess_card") {Category = "Pocket Items", Price = 100, Description = "1 minute of mom trying to curbstomp isaac"},
            new("Use Reverse Emperor", "use_reverse_emperor_card") {Category = "Pocket Items", Price = 75, Description = "Teleports Isaac to an extra boss room"},
            new("Use Soul Of Cain", "use_soul_of_cain_card") {Category = "Pocket Items", Price = 15, Description = "Opens red doors where available"},
            new("Use Soul Of Eve", "use_soul_of_eve_card") {Category = "Pocket Items", Price = 10, Description = "Thats a lot of dead birds"},
            new("Use Soul of Lilith", "use_soul_of_lilith_card") {Category = "Pocket Items", Price = 25, Description = "Summon a random familiar for the streamer"},

			// Use Folder
			//new("Use Item", "use_item", ItemKind.Folder),
			//Consumeables
			// Dice
			new("Use D1", "use_d1") {Category = "Use Items", Price = 25, Description = "Duplicates 1 random pickup, trinket, or chest in the current room"},
            new("Use D4", "use_d4") {Category = "Use Items", Price = 100, Description = "Rerolls all items Isaac has into ones from the Treasure Room pool"},
            new("Use D6", "use_d6") {Category = "Use Items", Price = 25, Description = "Rerolls all items in the room (on pedestals and in shops) into other ones from the room's pool"},
            new("Use D7", "use_d7") {Category = "Use Items", Price = 50, Description = "Restarts the current room and will respawn all enemies. When used in a boss room it will teleport Isaac out of the room."},
            new("Use D8", "use_d8") {Category = "Use Items", Price = 50, Description = "Rerolls Isaac's damage, range, speed and tears values."},
            new("Use D12", "use_d12") {Category = "Use Items", Price = 25, Description = "Changes all enemies in the room into random ones."},
            new("Use D20", "use_d20") {Category = "Use Items", Price = 25, Description = "Randomises all pickups and chests in the room."},
			//Other Items
			new("Use Guppy's Head", "use_guppies_head") {Category = "Use Items", Price = 10, Description = "Spawns 2-4 friendly Blue Flies that damage enemies"},
            new("Use Guppy's Paw", "use_guppies_paw") {Category = "Use Items", Price = 50, Description = "Converts one Red Heart Container into three Soul Hearts. "},
            new("Use Shovel", "use_shovel") {Category = "Use Items", Price = 50, Description = "Spawns a  trapdoor to the next floor (can also spawn a crawlspace, containing an item)"},
            new("Use Dad's Key", "use_dads_key") {Category = "Use Items", Price = 10, Description = "Opens all doors in the room, including special doors."},
            new("Use Clicker", "use_clicker") {Category = "Use Items", Price = 100, Description = "Transforms Isaac into a random other character and removes one item"},
            new("Use Pause", "use_pause") {Category = "Use Items", Price = 25, Description = "Pauses all enemies in the room until Isaac fires a tear"},
            new("Use Mega Blast", "use_mega_blast") {Category = "Use Items", Price = 50, Description = "Shoots an incredibly powerful brimstone beam for 30 seconds"},
            new("Use Mega Mush", "use_mega_mush") {Category = "Use Items", Price = 50, Description = "ISAAC SMASH!"},
            new("Use Forget Me Now", "use_forget_me_now") {Category = "Use Items", Price = 100, Description = "Resets the current floor (will not remove items gained on the current floor)"},
            new("Use R Key", "use_r_key") {Category = "Use Items", Price = 150, Description = "Resets the entire run (will change the layouts and bosses. Does not remove items, will use forget me now with AB+)"},
            new("Use Mystery Gift", "use_mystery_gift") {Category = "Use Items", Price = 25, Description = "Spawns an item pedstal."},
            new("Use Diplopia ", "use_diplopia") {Category = "Use Items", Price = 50, Description = "Duplicates all pickups and item pedestals in the room."},
            new("Use Box of Friends", "use_box_of_friends") {Category = "Use Items", Price = 10, Description = "Duplicates all of Isaac's familiars for the current room."},
            new("Use Smelter", "use_smelter") {Category = "Use Items", Price = 30, Description = "Consumes Isaac's currently held trinket and applies its effect permanently."},
            new("Use Sacrificial Altar", "use_sacrificial_altar") {Category = "Use Items", Price = 100, Description = "Sacrifices up to 2 familiars and spawns an item for each familiar sacrificed. Converts all friendly spiders and flies into coins."},
            new("Use Dull Razor", "use_dull_razor") {Category = "Use Items", Price = 25, Description = "Hurts Isaac without depleting health, activating any items that trigger upon taking damage."},
            new("Use Wavy Cap", "use_wavy_cap") {Category = "Use Items", Price = 50, Description = "Increases fire rate, decreases speed, and distorts the screen. All effects become more pronounced with repeated use, and wear off by clearing rooms."},
            new("Use Sprinkler", "use_sprinkler") {Category = "Use Items", Price = 10, Description = "Sentry going up"},
            new("Use Death Certificate", "use_death_certificate") {Category = "Use Items", Price = 50, Description = "So many options but only one choice"},
            new("Use Moms Box", "use_moms_box") {Category = "Use Items", Price = 5, Description = "It could be anything inside"},

			//Give or Take Items folder
			//new("Give/Take Item", "give_take_item", ItemKind.Folder),
            new("Give Random Item", "give_random_item") {Category = "Give/Take Items", Price = 25, Description = "Give any random item (can give items not unlocked yet)"},
            new("Give Missing No", "give_missing_no") {Category = "Give/Take Items", Price = 100, Description = "S\ny\nn\nt\na\nx\ne\nr\nr\no\nr"},
            new("Give Soy Milk", "give_soy_milk") {Category = "Give/Take Items", Price = 50, Description = "DMG down + tears way up"},
            new("Give The Mind", "give_the_mind") {Category = "Give/Take Items", Price = 50, Description = "I know all"},
            new("Give Brimstone", "give_brimstone") {Category = "Give/Take Items", Price = 50, Description = "Blood laser barrage"},
            new("Give Mom's Knife", "give_knife") {Category = "Give/Take Items", Price = 50, Description = "stab stab stab"},
            new("Give Polyphemus", "give_poly") {Category = "Give/Take Items", Price = 50, Description = "Mega tears"},
            new("Give Sacred Heart", "give_sacred_heart") {Category = "Give/Take Items", Price = 50, Description = "Homing shots + DMG up"},
            new("Give 1UP!", "give_one_up") {Category = "Give/Take Items", Price = 100, Description = "Extra life"},
            new("Give Rock Bottom", "give_rock_bottom") {Category = "Give/Take Items", Price = 50, Description = "It's only up from there"},
            new("Give Black Candle", "give_black_candle") {Category = "Give/Take Items", Price = 50, Description = "Curse immunity + evil up "},
            new("Give Curse Of The Tower", "give_curse_of_the_tower") {Category = "Give/Take Items", Price = 75, Description = "Embrace chaos"},
            new("Give Tiny Planet", "give_tiny_planet") {Category = "Give/Take Items", Price = 50, Description = "Orbiting tears + range up"},
            new("Give Chaos", "give_chaos") {Category = "Give/Take Items", Price = 50, Description = "!!!"},
            new("Give Ipecac", "give_ipecac") {Category = "Give/Take Items", Price = 50, Description = "Explosive shots"},
            new("Give Host Hat", "give_host_hat") {Category = "Give/Take Items", Price = 50, Description = "Blast resistance"},
            new("Give The Wiz", "give_the_wiz") {Category = "Give/Take Items", Price = 75, Description = "Double Wiz shot!"},
            new("Give Deep Pockets", "give_deep_pockets") {Category = "Give/Take Items", Price = 50, Description = "More money!"},
            new("Give Birth Right", "give_birth_right") {Category = "Give/Take Items", Price = 50, Description = "???"},
            new("Give C Section", "give_c_section") {Category = "Give/Take Items", Price = 50, Description = "Fetus shots"},
            new("Give Bozo", "give_bozo") {Category = "Give/Take Items", Price = 100, Description = "Party time!"},
            new("Give God Head", "give_god_head") {Category = "Give/Take Items", Price = 50, Description = "God Head"},
            new("Give Cursed Eye", "give_cursed_eye") {Category = "Give/Take Items", Price = 100, Description = "Cursed charge shot"},
            new("Give Tech X", "give_tech_x") {Category = "Give/Take Items", Price = 50, Description = "Laser ring tears"},
            new("Give Dr fetus", "give_dr_fetus") {Category = "Give/Take Items", Price = 50, Description = "Tears = Bombs"},
            new("Take Random Item", "remove_random_item") {Category = "Give/Take Items", Price = 50, Description = "Remove a random item!"},
            new("Take Missing No", "remove_missing_no") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Soy Milk", "remove_soy_milk") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take The Mind", "remove_the_mind") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Brimstone", "remove_brimstone") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Mom's Knife", "remove_knife") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Polyphemus", "remove_poly") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Sacred Heart", "remove_sacred_heart") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take 1UP!", "remove_one_up") {Category = "Give/Take Items", Price = 100, Description = ""},
            new("Take Rock Bottom", "remove_rock_bottom") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Black Candle", "remove_black_candle") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take curse of the tower", "remove_curse_of_the_tower") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Tiny Planet", "remove_tiny_planet") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take chaos", "remove_chaos") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Ipecac", "remove_ipecac") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Host Hat", "remove_host_hat") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take The Wiz", "remove_the_wiz") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Deep Pockets", "remove_deep_pockets") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Birth Right", "remove_birth_right") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take C Section", "remove_c_section") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Bozo", "remove_bozo") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take God Head", "remove_god_head") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Cursed Eye", "remove_cursed_eye") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Tech X", "remove_tech_x") {Category = "Give/Take Items", Price = 50, Description = ""},
            new("Take Dr Fetus", "remove_dr_fetus") {Category = "Give/Take Items", Price = 50, Description = ""}
		};

        public override bool StopAllEffects() => Connector.Send(new EffectRequest
        {
            viewer = "SDK",
            code = "stop_all_effects",
            type = RequestType.Stop
        });
    }
}

using System;
using System.Collections.Generic;
using CrowdControl.Common;
using JetBrains.Annotations;
using ConnectorType = CrowdControl.Common.ConnectorType;
using Request = ConnectorLib.JSON.Request;
using RequestType = ConnectorLib.JSON.RequestType;

namespace CrowdControl.Games.Packs
{
	[UsedImplicitly]
	public class BindingOfIsaacAfterbirthPlus : SimpleTCPPack
	{
		public override string Host => "127.0.0.1";

		public override ushort Port => 58430;

		public BindingOfIsaacAfterbirthPlus(IPlayer player, Func<CrowdControlBlock, bool> responseHandler, Action<object> statusUpdateHandler) : base(player, responseHandler, statusUpdateHandler) { }

		public override Game Game => new Game(60, "The Binding Of Isaac: Repentance", "BindingOfIsaacAfterbirthPlus", "PC", ConnectorType.SimpleTCPServerConnector);

		// When adding new functions to the mod please add the new Crowd Control Effect here
		//This is a display name mapped to a unique string. This is used to map the function from CC to Mod
		public override List<Effect> Effects => new List<Effect>
		{
			new Effect("Add Heart Container", "add_heart_container") {Price = 25, Description = "Add a red heart container"},
			new Effect("Remove Heart Container", "remove_heart_container") {Price = 30, Description = "Remove a red heart container (can not remove last red heart container)"},
			new Effect("Damage Player", "damage_half_heart") {Price = 10, Description = "Deal half a red heart of damage (will not kill player)"},
			new Effect("Heal Player", "heal_half_heart") {Price = 10, Description = "Heal half a red heart of damage"},
			new Effect("Full Heal Player", "heal_full") {Price = 50, Description = "Fills all empty red hearts"},
			new Effect("Teleport Player", "random_tp") {Price = 25, Description = "Teleport player to a random room, including secret rooms"},
			new Effect("Give Blue spider", "give_blue_spider", new[]{"quantity50"}) {Price = 5, Description = "Give the player a number of blue spiders"},
			new Effect("Give Flies", "give_blue_flies", new[]{"quantity50"}) {Price = 5, Description = "Give the player a number of blue flies"},
			new Effect("Give Dips", "give_random_dip", new[]{"quantity50"}) {Price = 5, Description = "Give the player a number of random dips"},
			new Effect("Charge Item", "charge_item") {Price = 20, Description = "Fully charge the current item!"},
			new Effect("Use Item", "use_active_item") {Price = 25, Description = "Use the current active item and drain its charge!"},
			new Effect("Fart!", "fart") {Price = 10, Description = "Oof, thats a smelly one"},
			new Effect("Explode!", "explode") {Price = 10, Description = "Explosion (will not kill player)!"},
			new Effect("Apply A Random Curse", "apply_random_curse") {Price = 50, Description = "Apply a random curse, like curse of Gamma Up!, the blind, the maze"},

			//Timed Effects Folder
			new Effect("Timed Effects", "timed_effects", ItemKind.Folder),
			new Effect("No HUD", "no_hud_timed", "timed_effects") {Price = 50, Description = "I CAN'T SEE! Lasts 30 seconds."},
			new Effect("SUPER HOT", "super_hot_timed", "timed_effects") {Price = 50, Description = "SUPER HOT SUPER HOT SUPER HOT SUPER HOT SUPER HOT (Lasts 30 seconds)"},
			new Effect("Invert Controls", "inverted_timed", "timed_effects") {Price = 50, Description = "What is up and what is down? (Lasts 30 seconds)"},
			new Effect("Invulnerability", "invincible_timed", "timed_effects") {Price = 50, Description = "I AM INVINCIBLE! (Lasts 30 seconds)"},
			new Effect("Retrovision", "pixelation_timed", "timed_effects") {Price = 50, Description = "We all know the CD-i was the best console! (Lasts 30 seconds)"},
			new Effect("Flip the screen", "flipped_timed", "timed_effects") {Price = 50, Description = "What is up and what is down *2? (Lasts 30 seconds)"},
			new Effect("Flight", "flight_timed", "timed_effects") {Price = 50, Description = "Fly so high! (Lasts 60 seconds)"},
			new Effect("CRT Vision", "old_tv_timed", "timed_effects") {Price = 50, Description = "Just like in the old days! (Lasts 60 seconds)"},
			new Effect("Poop Trail", "poop_trail_timed", "timed_effects") {Price = 50, Description = "Just gross (Lasts 15 seconds)"},
			new Effect("Massive Damage", "isaac_takes_massive_damage_timed", "timed_effects") {Price = 500, Description = "Paper thin defense (Lasts 15 seconds)"},
			new Effect("Damage when stopped", "damage_when_stopped_timed", "timed_effects") {Price = 250, Description = "Can't stop won't stop (Lasts 10 seconds)"},
			new Effect("Camo Enemies", "camo_enemies_timed", "timed_effects") {Price = 50, Description = "Turn on enemy radar (Lasts 30 seconds)"},
			new Effect("Dyslexia", "dyslexia_timed", "timed_effects") {Price = 50, Description = "Learn 2 read (Lasts 60 seconds)"},

			//Stats folder
			new Effect("Change Stats", "change_stats", ItemKind.Folder),
			new Effect("Buff Random Stat", "add_stat", "change_stats") {Price = 25, Description = "Buff a random stat (Damage, Speed, Shot speed by 10%, Luck and Shot delay by 1)"},
			new Effect("Nerf Random Stat", "remove_stat", "change_stats") {Price = 30, Description = "Nerf a random stat (Damage, Speed, Shot speed by 10%, Luck and Shot delay by 1)"},

			//Trinket Folder
			new Effect("Give/Take Trinket", "give_take_trinket", ItemKind.Folder),
			new Effect("Give Random Trinket", "replace_trinket", "give_take_trinket") {Price = 25, Description = "Give a random trinket (will drop current trinket on floor)"},
			new Effect("Drop Trinket", "drop_trinket", "give_take_trinket") {Price = 25, Description = "Drop the current trinket onto te floor"},

			//Give Take Consumeable Folder
			new Effect("Give/Take Consumable", "give_take_consumeable", ItemKind.Folder),
			new Effect("Give Coin", "add_coin", new[]{"quantity99"}, "give_take_consumeable") {Price = 5, Description = ""},
			new Effect("Take Coin", "remove_coin", new[]{"quantity99"}, "give_take_consumeable") {Price = 5, Description = ""},
			new Effect("Give Bomb", "add_bomb", new[]{"quantity99"}, "give_take_consumeable") {Price = 5, Description = ""},
			new Effect("Take Bomb", "remove_bomb", new[]{"quantity99"}, "give_take_consumeable") {Price = 5, Description = ""},
			new Effect("Give Golden Bomb", "add_golden_bomb", "give_take_consumeable") {Price = 25, Description = "Unlimited bombs!"},
			new Effect("Take Golden Bomb", "remove_golden_bomb", "give_take_consumeable") {Price = 25, Description = ""},
			new Effect("Give Key", "add_key", new[]{"quantity99"}, "give_take_consumeable") {Price = 5, Description = ""},
			new Effect("Take Key", "remove_key", new[]{"quantity99"}, "give_take_consumeable") {Price = 5, Description = ""},
			new Effect("Give Golden Key", "add_golden_key", "give_take_consumeable") {Price = 25, Description = "Unlimited keys!"},
			new Effect("Take Golden Key", "remove_golden_key", "give_take_consumeable") {Price = 25, Description = ""},
			new Effect("Add Gigabomb", "add_giga_bomb", "give_take_consumeable") {Price = 25, Description = "Add a big boi bomb that blows up the floor!"},
			new Effect("Take Gigabomb", "remove_giga_bomb", "give_take_consumeable") {Price = 25, Description = ""},

			//Pocket items such as Cards, Pills, Souls, and runes
			new Effect("Pocket Items", "pocket_items", ItemKind.Folder),
			new Effect("Use Random Pill", "use_random_pill", "pocket_items") {Price = 15, Description = "Use a random pill"},
			new Effect("Explosive Diarrhea", "use_explosive_diarrhea_pill", "pocket_items") {Price = 100, Description = "Explosive Diarrhea is putting it mildy"},
			new Effect("Use Random Card", "use_random_card", "pocket_items") {Price = 25, Description = "Use a random card"},
			new Effect("Use Holy Card", "use_holy_card", "pocket_items") {Price = 25, Description = "Don't forget to use protection"},
			new Effect("Use Dagaz Rune", "use_dagaz_rune", "pocket_items") {Price = 25, Description = "Undoes Curses and Adds 1 soul heart"},
			new Effect("Use Chaos Card", "use_chaos_card", "pocket_items") {Price = 10, Description = "What if you only had one shot?"},
			new Effect("Use Credit Card", "use_credit_card", "pocket_items") {Price = 50, Description = "Attention all BOI gamers. Isaac is in great danger and needs your help to beat Mom."},
			new Effect("Use Suicide King", "use_suicide_king_card", "pocket_items") {Price = 500, Description = "Kills Isaac and spawns 10 consumables and/or items around the location of use."},
			new Effect("Use Reverse High Priestess", "use_reverse_high_priestess_card", "pocket_items") {Price = 100, Description = "1 minute of mom trying to curbstomp isaac"},
			new Effect("Use Reverse Emperor", "use_reverse_emperor_card", "pocket_items") {Price = 75, Description = "Teleports Isaac to an extra boss room"},
			new Effect("Use Soul Of Cain", "use_soul_of_cain_card", "pocket_items") {Price = 15, Description = "Opens red doors where available"},
			new Effect("Use Soul Of Eve", "use_soul_of_eve_card", "pocket_items") {Price = 10, Description = "Thats a lot of dead birds"},
			new Effect("Use Soul of Lilith", "use_soul_of_lilith_card", "pocket_items") {Price = 25, Description = "Summon a random familiar for the streamer"},

			// Use Folder
			new Effect("Use Item", "use_item", ItemKind.Folder),
			//Consumeables
			// Dice
			new Effect("Use D1", "use_d1", "use_item") {Price = 25, Description = "Duplicates 1 random pickup, trinket, or chest in the current room"},
			new Effect("Use D4", "use_d4", "use_item") {Price = 100, Description = "Rerolls all items Isaac has into ones from the Treasure Room pool"},
			new Effect("Use D6", "use_d6", "use_item") {Price = 25, Description = "Rerolls all items in the room (on pedestals and in shops) into other ones from the room's pool"},
			new Effect("Use D7", "use_d7", "use_item") {Price = 50, Description = "Restarts the current room and will respawn all enemies. When used in a boss room it will teleport Isaac out of the room."},
			new Effect("Use D8", "use_d8", "use_item") {Price = 50, Description = "Rerolls Isaac's damage, range, speed and tears values."},
			new Effect("Use D12", "use_d12", "use_item") {Price = 25, Description = "Changes all enemies in the room into random ones."},
			new Effect("Use D20", "use_d20", "use_item") {Price = 25, Description = "Randomises all pickups and chests in the room."},
			//Other Items
			new Effect("Use Guppy's Head", "use_guppies_head", "use_item") {Price = 10, Description = "Spawns 2-4 friendly Blue Flies that damage enemies"},
			new Effect("Use Guppy's Paw", "use_guppies_paw", "use_item") {Price = 50, Description = "Converts one Red Heart Container into three Soul Hearts. "},
			new Effect("Use Shovel", "use_shovel", "use_item") {Price = 50, Description = "Spawns a  trapdoor to the next floor (can also spawn a crawlspace, containing an item)"},
			new Effect("Use Dad's Key", "use_dads_key", "use_item") {Price = 10, Description = "Opens all doors in the room, including special doors."},
			new Effect("Use Clicker", "use_clicker", "use_item") {Price = 100, Description = "Transforms Isaac into a random other character and removes one item"},
			new Effect("Use Pause", "use_pause", "use_item") {Price = 25, Description = "Pauses all enemies in the room until Isaac fires a tear"},
			new Effect("Use Mega Blast", "use_mega_blast", "use_item") {Price = 50, Description = "Shoots an incredibly powerful brimstone beam for 30 seconds"},
			new Effect("Use Mega Mush", "use_mega_mush", "use_item") {Price = 50, Description = "ISAAC SMASH!"},
			new Effect("Use Forget Me Now", "use_forget_me_now", "use_item") {Price = 100, Description = "Resets the current floor (will not remove items gained on the current floor)"},
			new Effect("Use R Key", "use_r_key", "use_item") {Price = 150, Description = "Resets the entire run (will change the layouts and bosses. Does not remove items, will use forget me now with AB+)"},
			new Effect("Use Mystery Gift", "use_mystery_gift", "use_item") {Price = 25, Description = "Spawns an item pedstal."},
			new Effect("Use Diplopia ", "use_diplopia", "use_item") {Price = 50, Description = "Duplicates all pickups and item pedestals in the room."},
			new Effect("Use Box of Friends", "use_box_of_friends", "use_item") {Price = 10, Description = "Duplicates all of Isaac's familiars for the current room."},
			new Effect("Use Smelter", "use_smelter", "use_item") {Price = 30, Description = "Consumes Isaac's currently held trinket and applies its effect permanently."},
			new Effect("Use Sacrificial Altar", "use_sacrificial_altar", "use_item") {Price = 100, Description = "Sacrifices up to 2 familiars and spawns an item for each familiar sacrificed. Converts all friendly spiders and flies into coins."},
			new Effect("Use Dull Razor", "use_dull_razor", "use_item") {Price = 25, Description = "Hurts Isaac without depleting health, activating any items that trigger upon taking damage."},
			new Effect("Use Wavy Cap", "use_wavy_cap", "use_item") {Price = 50, Description = "Increases fire rate, decreases speed, and distorts the screen. All effects become more pronounced with repeated use, and wear off by clearing rooms."},
			new Effect("Use Sprinkler", "use_sprinkler", "use_item") {Price = 10, Description = "Sentry going up"},
			new Effect("Use Death Certificate", "use_death_certificate", "use_item") {Price = 50, Description = "So many options but only one choice"},
			new Effect("Moms Box", "use_moms_box", "use_item") {Price = 5, Description = "It could be anything inside"},

			//Give or Take Items folder
			new Effect("Give/Take Item", "give_take_item", ItemKind.Folder),
			new Effect("Give Random Item", "give_random_item", "give_take_item") {Price = 25, Description = "Give any random item (can give items not unlocked yet)"},
			new Effect("Give Missing No", "give_missing_no", "give_take_item") {Price = 100, Description = "S\ny\nn\nt\na\nx\ne\nr\nr\no\nr"},
			new Effect("Give Soy Milk", "give_soy_milk", "give_take_item") {Price = 50, Description = "DMG down + tears way up"},
			new Effect("Give The Mind", "give_the_mind", "give_take_item") {Price = 50, Description = "I know all"},
			new Effect("Give Brimstone", "give_brimstone", "give_take_item") {Price = 50, Description = "Blood laser barrage"},
			new Effect("Give Mom's Knife", "give_knife", "give_take_item") {Price = 50, Description = "stab stab stab"},
			new Effect("Give Polyphemus", "give_poly", "give_take_item") {Price = 50, Description = "Mega tears"},
			new Effect("Give Sacred Heart", "give_sacred_heart", "give_take_item") {Price = 50, Description = "Homing shots + DMG up"},
			new Effect("Give 1UP!", "give_one_up", "give_take_item") {Price = 100, Description = "Extra life"},
			new Effect("Give Rock Bottom", "give_rock_bottom", "give_take_item") {Price = 50, Description = "It's only up from there"},
			new Effect("Give Black Candle", "give_black_candle", "give_take_item") {Price = 50, Description = "Curse immunity + evil up "},
			new Effect("Give Curse Of The Tower", "give_curse_of_the_tower", "give_take_item") {Price = 75, Description = "Embrace chaos"},
			new Effect("Give Tiny Planet", "give_tiny_planet", "give_take_item") {Price = 50, Description = "Orbiting tears + range up"},
			new Effect("Give Chaos", "give_chaos", "give_take_item") {Price = 50, Description = "!!!"},
			new Effect("Give Ipecac", "give_ipecac", "give_take_item") {Price = 50, Description = "Explosive shots"},
			new Effect("Give Host Hat", "give_host_hat", "give_take_item") {Price = 50, Description = "Blast resistance"},
			new Effect("Give The Wiz", "give_the_wiz", "give_take_item") {Price = 75, Description = "Double Wiz shot!"},
			new Effect("Give Deep Pockets", "give_deep_pockets", "give_take_item") {Price = 50, Description = "More money!"},
			new Effect("Give Birth Right", "give_birth_right", "give_take_item") {Price = 50, Description = "???"},
			new Effect("Give C Section", "give_c_section", "give_take_item") {Price = 50, Description = "Fetus shots"},
			new Effect("Give Bozo", "give_bozo", "give_take_item") {Price = 100, Description = "Party time!"},
			new Effect("Give God Head", "give_god_head", "give_take_item") {Price = 50, Description = "God Head"},
			new Effect("Give Cursed Eye", "give_cursed_eye", "give_take_item") {Price = 100, Description = "Cursed charge shot"},
			new Effect("Give Tech X", "give_tech_x", "give_take_item") {Price = 50, Description = "Laser ring tears"},
			new Effect("Give Dr fetus", "give_dr_fetus", "give_take_item") {Price = 50, Description = "Tears = Bombs"},
			new Effect("Take Random Item", "remove_random_item", "give_take_item") {Price = 50, Description = "Remove a random item!"},
			new Effect("Take Missing No", "remove_missing_no", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Soy Milk", "remove_soy_milk", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take The Mind", "remove_the_mind", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Brimstone", "remove_brimstone", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Mom's Knife", "remove_knife", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Polyphemus", "remove_poly", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Sacred Heart", "remove_sacred_heart", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take 1UP!", "remove_one_up", "give_take_item") {Price = 100, Description = ""},
			new Effect("Take Rock Bottom", "remove_rock_bottom", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Black Candle", "remove_black_candle", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take curse of the tower", "remove_curse_of_the_tower", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Tiny Planet", "remove_tiny_planet", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take chaos", "remove_chaos", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Ipecac", "remove_ipecac", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Host Hat", "remove_host_hat", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take The Wiz", "remove_the_wiz", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Deep Pockets", "remove_deep_pockets", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Birth Right", "remove_birth_right", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take C Section", "remove_c_section", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Bozo", "remove_bozo", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take God Head", "remove_god_head", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Cursed Eye", "remove_cursed_eye", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Tech X", "remove_tech_x", "give_take_item") {Price = 50, Description = ""},
			new Effect("Take Dr Fetus", "remove_dr_fetus", "give_take_item") {Price = 50, Description = ""},

			//Effects not taken from an active item
			//new Effect("Give/take Item", "give_take_item", ItemKind.Folder) {Price = , Description = ""},
		};

		//Slider ranges need to be defined
		public override List<ItemType> ItemTypes => new List<ItemType>(new[]
		{
			new ItemType("Amount", "quantity99", ItemType.Subtype.Slider, "{\"min\":1,\"max\":99}"),
			new ItemType("Amount", "quantity50", ItemType.Subtype.Slider, "{\"min\":1,\"max\":50}")
		});

		public override bool StopAllEffects() => Connector.Send(new Request {
				viewer = "SDK",
				code = "stop_all_effects",
				type = RequestType.Stop
			});
	}
}

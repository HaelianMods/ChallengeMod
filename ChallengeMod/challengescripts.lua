
function Challenge1()
    RoomSetData.Tartarus.RoomOpening.NextRoomSet = {"Asphodel"}
end

function OnlyBoonsSetup()
    for _, roomData in pairs(RoomData) do
        roomData.SecretSpawnChance = 0.0
        roomData.EligibleRewards = {"Boon", "HermesUpgrade"}
        roomData.ForcedRewardStore = "RunProgress"
    end
end

ModUtil.Path.Wrap("ReachedMaxGods", function(baseFunc, excludedGods)
    if ChallengeMod.ActiveChallenge == ChallengeMod.ChallengeData.BoonsOnly.Name then
        return false
    else
        return baseFunc(excludedGods)
    end    
end, ChallengeMod)

function PomOneBoonSetup()
    for _, roomData in pairs(RoomData) do
        if roomData.Name == "RoomOpening" then
            roomData.SecretSpawnChance = 0.0
            roomData.EligibleRewards = {"Boon"}
        else
            roomData.SecretSpawnChance = 0.0
            roomData.EligibleRewards = {"StackUpgrade"}
            roomData.ForcedRewardStore = "RunProgress"
        end
    end
end

ModUtil.Path.Wrap("IsRoomRewardEligible", function( baseFunc, run, room, reward, previouslyChosenRewards, args)
    if ChallengeMod.ActiveChallenge == ChallengeMod.ChallengeData.PomOneBoon.Name then
        local reward2 = DeepCopyTable(reward)
        reward2.AllowDuplicates = true
        return baseFunc(run, room, reward2, previouslyChosenRewards, args)
    else
        return baseFunc(run, room, reward, previouslyChosenRewards, args)
    end
end, ChallengeMod)


function AllChaosSetup()
    for _, roomData in pairs(RoomData) do
        roomData.SecretSpawnChance = 100.0
        roomData.RequiredMinRoomsSinceSecretDoor = 0
        roomData.ForceSecretDoor = true
    end
end

function SuperChaosSetup()
    table.insert(RewardStoreData.RunProgress, {Name = "TrialUpgrade", AllowDuplicates = true, GameRequirements = {}})
    table.insert(RewardStoreData.RunProgress, {Name = "TrialUpgrade", AllowDuplicates = true, GameRequirements = {}})
    table.insert(RewardStoreData.RunProgress, {Name = "TrialUpgrade", AllowDuplicates = true, GameRequirements = {}})
    table.insert(RewardStoreData.RunProgress, {Name = "TrialUpgrade", AllowDuplicates = true, GameRequirements = {}})
--    RewardStoreData.InvalidOverrides = {}
    for _, roomData in pairs(RoomData) do
        roomData.SecretSpawnChance = 0.0
        if roomData.Name == "RoomOpening" then
            roomData.EligibleRewards = {"Boon"}
        else
            roomData.EligibleRewards = {"Boon", "HermesUpgrade", "TrialUpgrade"}
            roomData.ForcedRewardStore = "RunProgress"
        end  
    end
end

function HammerTimeSetup()
--old set up    
--    ModUtil.IndexArray.Set(RewardStoreData, { "RunProgress", 10, "GameStateRequirements", "RequiredMaxWeaponUpgrades" }, nil)
--    ModUtil.IndexArray.Set(RewardStoreData, { "RunProgress", 11, "GameStateRequirements", "RequiredMaxWeaponUpgrades" }, nil)
--    ModUtil.IndexArray.Set(RewardStoreData, { "RunProgress", 11, "GameStateRequirements", "RequiredMinDepth" }, 50) --you'd get more hammers offered in Ely if you don't push back the chamber depth requirement for the 2nd hammer
    local hammerCounts = {
        Tartarus = 3,
        Asphodel = 5,
        Elysium = 9,
        Styx = 11,
    }
    local minDepths = {
        Tartarus = nil,
        Asphodel = 16,
        Elysium = 26,
        Styx = 37,
    }

    for biome, count in pairs( hammerCounts ) do
        for i = 1, count do
            table.insert( RewardStoreData.RunProgress, {
                Name = "WeaponUpgrade",
                GameStateRequirements = {
                    RequiredMaxWeaponUpgrades = count - 1,
                    RequiredMinDepth = minDepths[biome],
                    RequiredNotInStoreNames = { "ChaosWeaponUpgrade", "WeaponUpgradeDrop" },
                },
            } )
        end
    end
    for _, roomData in pairs(RoomData) do
        if roomData.Name == "RoomOpening" then
            roomData.SecretSpawnChance = 0.0
            roomData.EligibleRewards = {"WeaponUpgrade"}
        else
            roomData.SecretSpawnChance = 0.0
            roomData.EligibleRewards = {"WeaponUpgrade", "Boon", "HermesUpgrade", "StackUpgrade", "RoomRewardMoneyDrop", "RoomRewardMaxHealthDrop"}
            roomData.ForcedRewardStore = "RunProgress"
        end    
    end
end

function SuperHammerTimeSetup()

    --get rid of hammer requirements
    for _, trait in pairs( TraitData ) do
        if trait.RequiredWeapon then
          trait.RequiredFalseTraits = nil
        end
    end

    local hammerCounts = {
        Tartarus = 5,           --how many hammers allowed by end of each biome
        Asphodel = 8,
        Elysium = 12,
        Styx = 15,
    }
    local minDepths = {
        Tartarus = nil,
        Asphodel = 16,
        Elysium = 26,
        Styx = 37,
    }

    for biome, count in pairs( hammerCounts ) do
        for i = 1, count do
            table.insert( RewardStoreData.RunProgress, {
                Name = "WeaponUpgrade",
                GameStateRequirements = {
                    RequiredMaxWeaponUpgrades = count - 1,
                    RequiredMinDepth = minDepths[biome],
                    RequiredNotInStoreNames = { "ChaosWeaponUpgrade", "WeaponUpgradeDrop" },
                },
            } )
        end
    end
    for _, roomData in pairs(RoomData) do
        if roomData.Name == "RoomOpening" then
            roomData.SecretSpawnChance = 0.0
            roomData.EligibleRewards = {"WeaponUpgrade"}
        else
            roomData.SecretSpawnChance = 0.0
            roomData.EligibleRewards = {"WeaponUpgrade", "Boon", "HermesUpgrade", "StackUpgrade", "RoomRewardMoneyDrop", "RoomRewardMaxHealthDrop"}
            roomData.ForcedRewardStore = "RunProgress"
        end    
    end
end

function ChallengeMod.BossRushRoomset()
    for _, roomData in pairs(RoomData) do
        roomData.SecretSpawnChance = 0.0
        roomData.ShrinePointDoorSpawnChance = 0.0
        roomData.ChallengeSpawnChance = 0.0
        roomData.WellShopSpawnChance = 0.0
        roomData.SellTraitShopChance = 0.0
        roomData.FishingPointChance = 0.0
        roomData.FlipHorizontalChance = 0.0
    end

    RoomData.RoomOpening.ForcedRewardStore = "MetaProgress"
    RoomData.RoomOpening.LinkedRooms = {"A_Boss01", "A_Boss02", "A_Boss03"}

    RoomData.A_Boss01.EligibleRewards = {}
    RoomData.A_Boss02.EligibleRewards = {}
    RoomData.A_Boss03.EligibleRewards = {}

    RoomData.A_PostBoss01.LinkedRoom = "B_Boss01"

    RoomData.B_Boss01.RemoveTimerBlock = "InterBiome"
    RoomData.B_Boss01.EligibleRewards = {}
    RoomData.B_Boss01.RemoveTimerBlock = "InterBiome"
    RoomData.B_PostBoss01.LinkedRoom = "C_Boss01"

    RoomData.C_Boss01.RemoveTimerBlock = "InterBiome"
    RoomData.C_PostBoss01.LinkedRoom = "D_Boss01"
    RoomData.C_Boss01.EligibleRewards = {}
    RoomData.C_Boss01.RemoveTimerBlock = "InterBiome"

    RoomData.D_Boss01.RemoveTimerBlock = "InterBiome"
    RoomData.D_Boss01.EligibleRewards = {}
end

function ChallengeMod.BossRushRoomsetHard()
    for _, roomData in pairs(RoomData) do
        roomData.SecretSpawnChance = 0.0
        roomData.ShrinePointDoorSpawnChance = 0.0
        roomData.ChallengeSpawnChance = 0.0
        roomData.WellShopSpawnChance = 0.0
        roomData.SellTraitShopChance = 0.0
        roomData.FishingPointChance = 0.0
        roomData.FlipHorizontalChance = 0.0
    end

    RoomData.RoomOpening.UnthreadedEvents = nil
    RoomData.RoomOpening.LinkedRooms = {"A_Boss01", "A_Boss02", "A_Boss03"}

    RoomData.A_Boss01.NextRoomSet = { "Asphodel"}
    RoomData.A_Boss01.LinkedRoom = "B_Boss02"
    RoomData.A_Boss01.EligibleRewards = {}

    RoomData.A_Boss02.NextRoomSet = { "Asphodel"}
    RoomData.A_Boss02.LinkedRoom = "B_Boss02"
    RoomData.A_Boss02.EligibleRewards = {}

    RoomData.A_Boss03.NextRoomSet = { "Asphodel"}
    RoomData.A_Boss03.LinkedRoom = "B_Boss02"
    RoomData.A_Boss03.EligibleRewards = {}

    RoomData.B_Boss02.NextRoomSet = {"Elysium"}
    RoomData.B_Boss02.LinkedRoom = "C_Boss01"
    RoomData.B_Boss02.RemoveTimerBlock = "InterBiome"
    RoomData.B_Boss02.EligibleRewards = {}

    RoomData.C_Boss01.NextRoomSet = {"Styx"}
    RoomData.C_Boss01.LinkedRoom = "D_Boss01"
    RoomData.C_Boss01.EligibleRewards = {}
    RoomData.C_Boss01.RemoveTimerBlock = "InterBiome"

    RoomData.D_Boss01.RemoveTimerBlock = "InterBiome"
    RoomData.D_Boss01.EligibleRewards = {}
end
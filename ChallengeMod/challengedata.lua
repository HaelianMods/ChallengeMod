ChallengeMod.ChallengeData =
{
    --Template
    Challenge1 =
    {
        Name = "Tartarus skip",
        Description = "Zagreus jumped a bit further from the window and landed in Asphodel. Can you survive the heat of Asphodel with only your starting boon?",
        Author = "PonyWarrior",
        SetupFunction = "Challenge1",
        RestoreRoomData = true,
        HellMode = false,
        HardMode =
        {
            Description = "You thought that was too easy? Try again but with a pitiful health pool and in hell mode. Good luck!",
            SetupFunction = "Challenge1",
            HellMode = true,
            RestoreRoomData = true,
            Trait =
            {
                Icon = "Shop_BedroomDecor",
                Name = "ChallengeMode",
		        MaxHealthMultiplier = 0.2,
                PropertyChanges =
                {
                    {
                        LuaProperty = "MaxHealth",
                        ChangeValue = 0.2,
                        ChangeType = "Multiply",
                    },
                },
            }
        },
    },

    BoonsOnly = 
    {
        Name = "Only Boons",
        Description = "How fast can you clear, at what heat can you clear, if every room gives you a boon?",
        Author = "cgull",
        SetupFunction = "OnlyBoonsSetup",
        HellMode=false,
        RestoreRoomData=true,
    },

    PomOneBoon = 
    {
        Name = "Pom One Boon",
        Description = "Pick a boon in chamber one, then level it up every chamber after that.",
        Author = "cgull",
        SetupFunction = "PomOneBoonSetup",
        HellMode=False,
        RestoreRoomData=true,
    },

    HammerTime = 
    {
        Name = "Hammer Time",
        Description = "Get more hammers offered (up to 12 per run), gets rid of some door rewards.",
        Author = "Haelian",
        SetupFunction = "HammerTimeSetup",
        HellMode=False,
        RestoreRoomData=true,
    },
    
    SuperHammerTime = 
    {
        Name = "SUPER Hammer Time",
        Description = "Get even MORE hammers offered, can get incompatible hammers. NOT FULLY TESTED.",
        Author = "Haelian",
        SetupFunction = "SuperHammerTimeSetup",
        HellMode=False,
        RestoreRoomData=true,
    },

    AllChaos = 
    {
        Name = "ALL of the Chaos",
        Description = "A Chaos gate every possible chamber. Praise Egg.",
        Author = "Haelian",
        SetupFunction = "AllChaosSetup",
        HellMode=False,
        RestoreRoomData=true,
    },

    SuperAllChaos = 
    {
        Name = "More Chaos, More Easily",
        Description = "Chaos boons can now be a room reward and the reward pool is thinner.",
        Author = "Haelian",
        SetupFunction = "SuperChaosSetup",
        HellMode=False,
        RestoreRoomData=true,
    },

    -- BossRush =
    -- {
    --     Name = "Boss Rush",
    --     Description = "Fight the Fury, Bone Hydra, Heroes of Elysium and Hades one after the other as fast as you can with one of the build provided.",
    --     Author = "PonyWarrior",
    --     HellMode = false,
    --     SetupFunction = "ChallengeMod.BossRushRoomset",
    --     RestoreRoomData = true,
    --     HardMode =
    --     {
    --         Description = "Fight the Furies, Bone Hydra, Heroes of Elysium and Hades one after the other as fast as you can with one of the build provided, with Extreme Measures, Hell Mode and no midbiome rooms.",
    --         HellMode = true,
    --         SetupFunction = "ChallengeMod.BossRushRoomsetHard",
    --         RestoreRoomData = true,
    --         ForcedPactOptions =
    --         {
    --             {
    --                 Name = "BossDifficultyShrineUpgrade",
    --                 Level = 4
    --             },
    --         },
    --     },
    -- },
}
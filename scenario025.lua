local scenariodata = {
	index			= 25, --  integer, sort order, MUST BE EQUAL TO FILENAME NUMBER
	scenarioid		= "brothersinarms", -- no spaces, lowercase, this will be used to save the score
	version			= "1.0", -- increment this to keep the score when changing a mission
	title			= "Brothers in Arms", -- can be anything
	author			= "Rasoul", -- your name here
	isnew 			= true,
	imagepath		= "scenario025.jpg", -- placed next to lua file, should be 3:1 ratio banner style
	imageflavor		= "Leave no bot behind", -- This text will be drawn over image
	summary			= [[The enemy has captured and terminated one of you brothers in arms. Free the remaining team members, and bring terrible vengance to the Armada scum.
	]],
	briefing 		= [[For a few decades now, your team of special ops commandos have fought like brothers behind enemy lines. But now the enemy has done the unthinkable, and executed one of your team members held prisoner.

Another member of your team still remains in captivity, while yet another has gotten into a tight spot while attempting a rescue operation.

Your mission is to salvage said rescue operation by infiltrating the enemy base and freeing the rest of your team. Then, with their help, eliminate the entire Armada guard, patrolling throughout the stronghold. Show them no mercy!

Tips:
 - A frontal assault is not recommended.
 - Commandos are special ops units, that can both fight, repair, reclaim, as well as build a few support units.
 - Repairing, building, and reclaiming do not require line of sight, and so can be done through cliffs and other terrian.
 - These can all be done at quite a long range, and while shooting too.
 - Unlike most units, commandos don't blow up along with the air transport carrying them. Instead, they gently float down and land (mostly) unharmed.
 - Set your commandos on repeat, and order them to repair an area around themselves to have them repair each other during open combat.
 - Commandos are stealthy, and so will not be fired upon while out of sight. They can not cloak, however.
 - Commandos are amphibious units, but they can not shoot under water.
 - Reclaim enemy units that they can not shoot.
 - Build mines on repeat within detonation radius of enemy structures to blow them up.
 - Enemy turrets will not shoot through terrain, friendly buildings, or walls.
 - The enemy is producing no units, so there's no need to rush into danger.
 - And, lastly, do scout ahead before making your move.
]],

	mapfilename		= "Cape_Violet_V1", -- the name of the map to be displayed here
	playerstartx	= "5%", -- X position of where player comm icon should be drawn, from top left of the map
	playerstarty	= "37%", -- Y position of where player comm icon should be drawn, from top left of the map
	partime 		= 2400, -- par time in seconds
	parresources	= 50000, -- par resource amount
	difficulty		= 8, -- Percieved difficulty at 'normal' level: integer 1-10
	defaultdifficulty = "Hard", -- an entry of the difficulty table
	difficulties	= { -- Array for sortedness, Keys are text that appears in selector (as well as in scoring!), values are handicap levels
         {name = "Hard"  , playerhandicap = 0, enemyhandicap=0},
    },
	allowedsides		= {"Cortex"}, --these are the permitted factions for this mission
	victorycondition	= "Kill all enemy units", -- This is plaintext, but should be reflected in startscript
	losscondition		= "Loss of any commando",  -- This is plaintext, but should be reflected in startscript
	unitlimits			= { -- table of unitdefname : maxnumberoftese units, 0 is disable it
		-- dont use the one in startscript, put it here!
	} ,
	scenariooptions = { -- this will get lua->json->base64 and passed to scenariooptions in game
		--myoption = "dostuff",armfrt
		scenarioid = "brothersinarms", --must be present for scores
		disablefactionpicker = true, -- this is needed to prevent faction picking outside of the allowedsides
		unitloadout = {
			{name = 'corgeo', x = 1850, y = 229, z = 4000, rot = 0 , team = 0, neutral = false},
			{name = 'corgeo', x = 1248, y = 83, z = 752, rot = 0 , team = 0, neutral = false},
			{name = 'coradvsol', x = 150, y = 222, z = 250, rot = 0 , team = 0, neutral = false},
			{name = 'coradvsol', x = 250, y = 221, z = 150, rot = 0 , team = 0, neutral = false},
			{name = 'coradvsol', x = 250, y = 222, z = 250, rot = 0 , team = 0, neutral = false},
			{name = 'corarad', x = 450, y = 222, z = 450, rot = 0 , team = 0, neutral = false},
			{name = 'corshroud', x = 700, y = 222, z = 400, rot = 0 , team = 0, neutral = false},
			{name = 'cormoho', x = 720, y = 214, z = 160, rot = 16384 , team = 0, neutral = false},
			{name = 'cormoho', x = 448, y = 221, z = 144, rot = 16384 , team = 0, neutral = false},
			{name = 'coreyes', x = 6000, y = 66, z = 4350, rot = 0 , team = 0, neutral = false},
			{name = 'coreyes', x = 8585, y = -5, z = 1840, rot = 0 , team = 0, neutral = false},
			{name = 'coreyes', x = 3500, z = 4250, rot = 0 , team = 0, neutral = false},
			{name = 'coreyes', x = 7892, y = -5, z = 1855, rot = 0 , team = 0, neutral = false},

			{name = 'armfus', x = 10100, y = 190, z = 2300, rot = -16384 , team = 1, neutral = false},
			{name = 'armhlt', x = 9680, y = 66, z = 528, rot = 0 , team = 1, neutral = false},
			{name = 'armfort', x = 9648, y = 63, z = 496, rot = 0 , team = 1, neutral = true},
			{name = 'armfort', x = 9680, y = 66, z = 496, rot = 0 , team = 1, neutral = true},
			{name = 'armfort', x = 9712, y = 68, z = 496, rot = 0 , team = 1, neutral = true},
			{name = 'armfort', x = 9712, y = 68, z = 528, rot = 0 , team = 1, neutral = true},
			{name = 'armfort', x = 9648, y = 63, z = 528, rot = 0 , team = 1, neutral = true},
			{name = 'armfort', x = 9648, y = 64, z = 560, rot = 0 , team = 1, neutral = true},
			{name = 'armfort', x = 9680, y = 66, z = 560, rot = 0 , team = 1, neutral = true},
			{name = 'armfort', x = 9712, y = 69, z = 560, rot = 0 , team = 1, neutral = true},
			{name = 'armmerl', x = 3300, y = 210, z = 3120, rot = -16384 , team = 1, neutral = false},
			{name = 'armmerl', x = 3750, y = 229, z = 1333, rot = -16384 , team = 1, neutral = false},
			{name = 'armeyes', x = 1830, y = 229, z = 4100, rot = -16384 , team = 1, neutral = false},
			{name = 'armageo', x = 9000, y = 82, z = 4370, rot = -16384 , team = 1, neutral = false},
			{name = 'armanni', x = 9170, y = 81, z = 4200, rot = -16384 , team = 1, neutral = false},
			{name = 'armguard', x = 5200, y = 204, z = 1100, rot = -16384 , team = 1, neutral = false},
			{name = 'armclaw', x = 5100, y = 175, z = 1250, rot = -16384 , team = 1, neutral = true},
			{name = 'armclaw', x = 4500, y = 70, z = 1600, rot = -16384 , team = 1, neutral = true},
			{name = 'armbeamer', x = 6000, y = 79, z = 3100, rot = -16384 , team = 1, neutral = false},
			{name = 'armfrt', x = 4200, y = 0, z = 4600, rot = -16384 , team = 1, neutral = false},
			{name = 'armfrt', x = 7150, y = 0, z = 1200, rot = -16384 , team = 1, neutral = false},
			{name = 'armfrt', x = 8400, y = 0, z = 2100, rot = -16384 , team = 1, neutral = false},
			{name = 'armfrt', x = 7300, y = 0, z = 4800, rot = -16384 , team = 1, neutral = false},
			{name = 'armllt', x = 2200, y = 91, z = 1700, rot = -16384 , team = 1, neutral = false},
			{name = 'armllt', x = 3000, y = 82, z = 1700, rot = -16384 , team = 1, neutral = false},
			{name = 'armllt', x = 3000, y = 121, z = 1850, rot = -16384 , team = 1, neutral = false},
			{name = 'armbeamer', x = 4000, y = 88, z = 2000, rot = -16384 , team = 1, neutral = false},
			{name = 'armbeamer', x = 6400, y = 141, z = 2200, rot = -16384 , team = 1, neutral = false},
			{name = 'armhlt', x = 3700, y = 121, z = 2500, rot = -16384 , team = 1, neutral = false},
			{name = 'armbrtha', x = 4900, y = 206, z = 4000, rot = 16384 , team = 1, neutral = false},
			{name = 'armbrtha', x = 5050, y = 191, z = 3850, rot = 16384 , team = 1, neutral = false},
			{name = 'armrad', x = 4835, y = 203, z = 3835, rot = -16384 , team = 1, neutral = false},
			{name = 'armfrad', x = 6400, y = -1, z = 1400, rot = -16384 , team = 1, neutral = false},
			{name = 'armfrad', x = 3800, y = -1, z = 3700, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 5400, y = 130, z = 4000, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 6500, y = 148, z = 3000, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 7777, y = 101, z = 3400, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 9300, y = 80, z = 3400, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 9400, y = 198, z = 4700, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 9700, y = 80, z = 1100, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 7100, y = 225, z = 2000, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 8700, y = 76, z = 4700, rot = -16384 , team = 1, neutral = false},
			{name = 'armamb', x = 6620, y = 75, z = 920, rot = -16384 , team = 1, neutral = false},
			{name = 'armpb', x = 8700, y = 82, z = 3100, rot = -16384 , team = 1, neutral = false},
			{name = 'armdl', x = 6666, y = 84, z = 700, rot = -16384 , team = 1, neutral = false},
			{name = 'armdl', x = 6666, y = 87, z = 1030, rot = -16384 , team = 1, neutral = false},
			{name = 'armguard', x = 7000, y = 156, z = 2800, rot = -16384 , team = 1, neutral = false},
			{name = 'armbeamer', x = 7000, y = 157, z = 3000, rot = -16384 , team = 1, neutral = false},
			{name = 'armbeamer', x = 6800, y = 83, z = 3400, rot = -16384 , team = 1, neutral = false},
			{name = 'armbeamer', x = 7700, y = 100, z = 3500, rot = -16384 , team = 1, neutral = false},
			{name = 'armbeamer', x = 3800, y = 138, z = 2900, rot = -16384 , team = 1, neutral = false},
			{name = 'armtl', x = 7900, y = 0, z = 600, rot = -16384 , team = 1, neutral = false},
			{name = 'armtl', x = 7900, y = 0, z = 600, rot = -16384 , team = 1, neutral = false},
			{name = 'armtl', x = 5000, y = 0, z = 4650, rot = -16384 , team = 1, neutral = false},
			{name = 'armdl', x = 6100, y = 15, z = 2500, rot = -16384 , team = 1, neutral = false},
			{name = 'armdl', x = 5850, y = 14, z = 2800, rot = -16384 , team = 1, neutral = false},
			{name = 'armdl', x = 5600, y = 12, z = 3150, rot = -16384 , team = 1, neutral = false},
			{name = 'armdl', x = 5350, y = 12, z = 3440, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 3550, y = 77, z = 4350, rot = -16384 , team = 1, neutral = false},
			{name = 'armmercury', x = 3550, y = 77, z = 4150, rot = -16384 , team = 1, neutral = false},
			{name = 'armkraken', x = 4650, y = -3, z = 3200, rot = -16384 , team = 1, neutral = false},
			{name = 'armkraken', x = 5600, y = -3, z = 2000, rot = -16384 , team = 1, neutral = false},
			{name = 'armanni', x = 8550, y = 228, z = 1050, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 8200, y = 222, z = 1200, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 8600, y = 226, z = 950, rot = -16384 , team = 1, neutral = false},
			{name = 'armdl', x = 7700, y = 93, z = 950, rot = -16384 , team = 1, neutral = false},
			{name = 'armatl', x = 8900, y = -2, z = 2100, rot = -16384 , team = 1, neutral = false},
			{name = 'armtl', x = 7700, y = 0, z = 2150, rot = -16384 , team = 1, neutral = false},
			{name = 'armatl', x = 8270, y = -2, z = 1580, rot = -16384 , team = 1, neutral = false},
			{name = 'armtl', x = 3900, y = 0, z = 300, rot = -16384 , team = 1, neutral = false},
			{name = 'armtl', x = 7850, y = 0, z = 1600, rot = -16384 , team = 1, neutral = false},
			{name = 'armrl', x = 9340, y = 29, z = 775, rot = -16384 , team = 1, neutral = false},
			{name = 'armflak', x = 9700, y = 64, z = 300, rot = -16384 , team = 1, neutral = false},
			{name = 'armdl', x = 9440, y = 22, z = 380, rot = -16384 , team = 1, neutral = false},
			{name = 'armfhlt', x = 5200, y = -3, z = 2600, rot = -16384 , team = 1, neutral = false},
			{name = 'armhlt', x = 9400, y = 79, z = 3550, rot = -16384 , team = 1, neutral = false},
			{name = 'armfort', x = 9400, y = 79, z = 3518, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 9400, y = 79, z = 3582, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 9432, y = 78, z = 3518, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 9432, y = 79, z = 3582, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 9368, y = 79, z = 3518, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 9368, y = 80, z = 3582, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 9432, y = 79, z = 3550, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 9368, y = 79, z = 3550, rot = -16384 , team = 1, neutral = true},
			{name = 'armbeamer', x = 6100, y = 92, z = 3950, rot = -16384 , team = 1, neutral = false},
			{name = 'armbeamer', x = 6350, y = 65, z = 4200, rot = -16384 , team = 1, neutral = false},
			{name = 'armbeamer', x = 6380, y = 21, z = 4500, rot = -16384 , team = 1, neutral = false},
			{name = 'armflak', x = 6360, y = 47, z = 4350, rot = -16384 , team = 1, neutral = false},
			{name = 'armflak', x = 8800, y = 93, z = 3500, rot = -16384 , team = 1, neutral = false},
			{name = 'armfort', x = 5976, y = 131, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 6008, y = 115, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 6040, y = 105, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 6072, y = 97, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 6104, y = 94, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 6136, y = 94, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 6168, y = 95, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 6200, y = 97, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 6232, y = 100, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 6264, y = 105, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 6296, y = 132, z = 4000, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 5820, y = 99, z = 4400, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 5836, y = 93, z = 4432, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 5852, y = 102, z = 4464, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 5868, y = 99, z = 4496, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 5884, y = 106, z = 4528, rot = -16384 , team = 1, neutral = true},
			{name = 'armfort', x = 5900, y = 115, z = 4560, rot = -16384 , team = 1, neutral = true},
			{name = 'armrl', x = 9671, y = 161, z = 1967, rot = 0 , team = 1, neutral = false},
			{name = 'armamd', x = 9614, y = 94, z = 3204, rot = 0 , team = 1, neutral = false},
			{name = 'armamb', x = 9896, y = 188, z = 2405, rot = 0 , team = 1, neutral = false},
			{name = 'armrl', x = 9529, y = 160, z = 2774, rot = 0 , team = 1, neutral = false},
			{name = 'armbeamer', x = 9338, y = 77, z = 1451, rot = 0 , team = 1, neutral = false},
			{name = 'armbeamer', x = 9391, y = 135, z = 2378, rot = 0 , team = 1, neutral = false},
			{name = 'armbeamer', x = 9880, y = 141, z = 3044, rot = 0 , team = 1, neutral = false},
		},
		featureloadout = {
		}
	},
	-- https://github.com/spring/spring/blob/105.0/doc/StartScriptFormat.txt
	startscript		= [[
[Game]
{
	[allyTeam0]
	{
		numallies = 0;
	}

	[allyTeam1]
	{
		numallies = 0;
	}

	[team0]
	{
		Side = __PLAYERSIDE__;
		Handicap = __PLAYERHANDICAP__;
		RgbColor = 0.0 0.3 0.8;
		AllyTeam = 0;
		TeamLeader = 0;
		StartPosX = 1000;
		StartPosZ = 1650;
	}

	[team1]
	{
		Side = Armada;
		Handicap = __ENEMYHANDICAP__;
		RgbColor = 1.0 0.1 0.0;
		AllyTeam = 1;
		TeamLeader = 0;
		StartPosX = 9300;
		StartPosZ = 1300;
	}

	[team2]
	{
		Side = __PLAYERSIDE__;
		Handicap = __PLAYERHANDICAP__;
		RgbColor = 0.0 0.3 0.8;
		AllyTeam = 0;
		TeamLeader = 0;
		StartPosX = 1000;
		StartPosZ = 1650;
	}

	[player0]
	{
		IsFromDemo = 0;
		Name = __PLAYERNAME__;
		Team = 0;
		rank = 0;
	}

	[ai0]
	{
		Host = 0;
		IsFromDemo = 0;
		Name = Armada Stronghold Guard;
		ShortName = NullAI;
		Team = 1;
		Version = stable;
	}

	[ai1]
	{
		Host = 0;
		IsFromDemo = 0;
		Name = Captive Commando;
		ShortName = NullAI;
		Team = 2;
		Version = stable;
	}

	[modoptions]
	{
		scenariooptions = __SCENARIOOPTIONS__;
		StartEnergy=1000;
		StartMetal=1000;
		deathmode = builders;
	}

	NumRestrictions=__NUMRESTRICTIONS__;

	[RESTRICT]
	{
		__RESTRICTEDUNITS__
	}

	hostip = 127.0.0.1;
	hostport = 0;
	numplayers = 1;
	startpostype = 3;
	mapname = __MAPNAME__;
	ishost = 1;
	numusers = 2;
	gametype = __BARVERSION__;
	GameStartDelay = 0;
	myplayername = __PLAYERNAME__;
	nohelperais = 0;
}
	]],
}

return scenariodata -- scenariodata


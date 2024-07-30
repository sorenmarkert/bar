if not gadgetHandler:IsSyncedCode() then
	return
end

local prisonerFreed = false
local allPatrolsKilled = false
local warheadObjectiveKilled = false
local squad1PatrolDirection = true
local squad2PatrolDirection = true
local warheadUnitID = -1
local nukeWreckFeatureID = -1

local prisonerUnit =
{
	name = 'cormando',
	x = 5800,
	y = 130,
	z = 4480,
	rot = 16384,
	team = 2,
	neutral = true,
	queue = {
		{ cmdID = CMD.MOVE_STATE, args = { 0 } },
		{ cmdID = CMD.FIRE_STATE, args = { 0 } },
	}
}

local criticalUnits = {
	prisonerUnit,
	{
		name = 'cormando',
		x = 1000,
		y = 80,
		z = 1300,
		rot = 16384,
		team = 0,
		neutral = false,
		queue = {
			{ cmdID = CMD.MOVE_STATE, args = { 0 } },
		}
	},
	{
		name = 'cormando',
		x = 1000,
		y = 81,
		z = 1500,
		rot = 16384,
		team = 0,
		neutral = false,
		queue = {
			{ cmdID = CMD.MOVE_STATE, args = { 0 } },
		}
	},
	{
		name = 'cormando',
		x = 8793,
		y = -122,
		z = 2673,
		rot = 0,
		team = 0,
		neutral = false,
		queue = {
			{ cmdID = CMD.MOVE_STATE, args = { 0 } },
		}
	},
}

local jailorUnit =
{
	name = "armzeus",
	x = 6200,
	y = 100,
	z = 4500,
	rot = -8268,
	team = 1,
	neutral = false,
	queue = {
		{ cmdID = CMD.PATROL, args = { 6150, 0, 4300 } },
	}
}

local warheadObjectiveUnit = { name = 'armanni', x = 10100, y = 85, z = 3200, rot = -16384, team = 1, neutral = false }

local squad1Unit1 = { name = "armwar", x = 3600, y = 121, z = 2600, rot = -8268, team = 1, neutral = false }

local squad1Unit2 = { name = "armwar", x = 3600, y = 121, z = 2550, rot = -8268, team = 1, neutral = false }

local squad2Unit1 = { name = "armpw", x = 3100, y = 100, z = 1900, rot = -8268, team = 1, neutral = false }

local squad2Unit2 = { name = "armpw", x = 3100, y = 100, z = 1950, rot = -8268, team = 1, neutral = false }

local squad2Unit3 = { name = "armpw", x = 3100, y = 100, z = 2000, rot = -8268, team = 1, neutral = false }

local patrolUnits = {
	squad1Unit1,
	squad1Unit2,
	squad2Unit1,
	squad2Unit2,
	squad2Unit3,
	{
		name = "armzeus",
		x = 8900,
		y = 228,
		z = 950,
		rot = -8268,
		team = 1,
		neutral = false,
		queue = {
			{ cmdID = CMD.PATROL, args = { 8000, 200, 1200 } },
		}
	},
	{
		name = "armzeus",
		x = 9200,
		y = 200,
		z = 4050,
		rot = -8268,
		team = 1,
		neutral = false,
		queue = {
			{ cmdID = CMD.PATROL, args = { 9500, 200, 4150 } },
			{ cmdID = CMD.PATROL, args = { 9600, 200, 4550 } },
		}
	},
	{
		name = "armzeus",
		x = 9800,
		y = 66,
		z = 600,
		rot = -8268,
		team = 1,
		neutral = false,
		queue = {
			{ cmdID = CMD.PATROL, args = { 9800, 66, 100 } },
			{ cmdID = CMD.PATROL, args = { 10150, 66, 100 } },
			{ cmdID = CMD.PATROL, args = { 10150, 66, 600 } },
		}
	},
	{
		name = "armmar",
		x = 7500,
		y = 200,
		z = 3500,
		rot = -8268,
		team = 1,
		neutral = false,
		queue = {
			{ cmdID = CMD.PATROL, args = { 7500, 266, 3200 } },
			{ cmdID = CMD.PATROL, args = { 9450, 266, 3600 } },
			{ cmdID = CMD.PATROL, args = { 9450, 266, 3300 } },
		}
	},
}

local scoutUnits = {
	{
		name = "armpeep",
		x = 8700,
		y = 100,
		z = 3400,
		rot = -8268,
		team = 1,
		neutral = false,
		queue = {
			{ cmdID = CMD.PATROL, args = { 8700, 0, 3000 } },
		}
	},
	{
		name = "armpeep",
		x = 9500,
		y = 100,
		z = 2700,
		rot = -8268,
		team = 1,
		neutral = false,
		queue = {
			{ cmdID = CMD.PATROL, args = { 9900, 0, 2600 } },
		}
	},
	{
		name = "armpeep",
		x = 9500,
		y = 100,
		z = 3700,
		rot = -8268,
		team = 1,
		neutral = false,
		queue = {
			{ cmdID = CMD.PATROL, args = { 9900, 0, 3800 } },
		}
	},
}

local function LoseGame()
	Spring.SendMessage('MISSION FAILED: CRITICAL UNIT LOST!!')
	Spring.GameOver({ 1 })
end

local function PlayerVictory()
	Spring.SendMessage('MISSION COMPLETE!')
	Spring.GameOver({ 0 })
end

function gadget:UnitDestroyed(unitID, unitDefID)
	-- Commando died, lose game:
	for i, unit in ipairs(criticalUnits) do
		if unitID == unit.unitID then
			LoseGame()
			return
		end
	end
	-- Warhead unit died, lose game:
	if unitID == warheadUnitID then
		warheadUnitID = -1
		LoseGame()
		return
	end
	-- Jailor died, free prisoner:
	if unitID == jailorUnit.unitID then
		Spring.SendMessage('MISSION OBJECTIVE ACHIEVED: PRISONER FREED!')
		Spring.TransferUnit(prisonerUnit.unitID, 0) -- to give voice alert
		Spring.SetUnitNeutral(prisonerUnit.unitID, false)
		Spring.GiveOrderToUnit(prisonerUnit.unitID, CMD.FIRE_STATE, { 2 }, 0)
		prisonerFreed = true
	end
	-- Jailor died, free prisoner:
	if unitID == warheadObjectiveUnit.unitID then
		Spring.SendMessage('MISSION OBJECTIVE ACHIEVED: TARGET DESTROYED!')
		warheadObjectiveUnitKilled = true
	end
	-- Objective unit died?
	if not allPatrolsKilled then
		local anyPatrolsAlive = false
		for i, unit in ipairs(patrolUnits) do
			if Spring.GetUnitIsDead(unit.unitID) == false then
				anyPatrolsAlive = true
			end
		end
		if not anyPatrolsAlive then
			Spring.SendMessage('MISSION OBJECTIVE ACHIEVED: ALL PATROLS ANNIHILATED!')
			allPatrolsKilled = true
		end
	end
	-- Mission complete? win game:
	if prisonerFreed and warheadObjectiveUnitKilled and allPatrolsKilled then
		PlayerVictory()
	end
end

function gadget:FeatureDestroyed(featureID)
	if featureID == nukeWreckFeatureID then
		Spring.SendMessage('MISSION OBJECTIVE ACHIEVED: WARHEAD ACQUIRED!')
		warheadUnitID = Spring.CreateUnit("corroach", 10000, 77, 350, 0, 2)
		Spring.TransferUnit(warheadUnitID, 0) -- to give voice alert
		Spring.GiveOrderToUnit(warheadUnitID, CMD.MOVE_STATE, { 0 }, 0)
		Spring.GiveOrderToUnit(warheadUnitID, CMD.FIRE_STATE, { 0 }, 0)
		Spring.MarkerAddLine(10030, 130, 3130, 10030, 130, 3270)
		Spring.MarkerAddLine(10170, 130, 3130, 10170, 130, 3270)
		Spring.MarkerAddLine(10030, 130, 3130, 10170, 130, 3130)
		Spring.MarkerAddLine(10030, 130, 3270, 10170, 130, 3270)
		Spring.MarkerAddPoint(warheadObjectiveUnit.x, 150, warheadObjectiveUnit.z)
	end
end

local function CreateUnit(unit)
	if UnitDefNames[unit.name] then
		local unitID = Spring.CreateUnit(unit.name, unit.x, unit.y, unit.z, unit.rot, unit.team)
		unit.unitID = unitID
		Spring.SetUnitNeutral(unitID, unit.neutral)
		if unit.queue then
			for i = 1, #unit.queue do
				local order = unit.queue[i]
				Spring.GiveOrderToUnit(unitID, order.cmdID, order.args, CMD.OPT_SHIFT)
			end
		end
		return unitID
	end
end

local function CreateUnits(loadout)
	for k, unit in pairs(loadout) do
		CreateUnit(unit)
	end
end

local function CreateInitialLoadout()
	CreateUnits(criticalUnits)
	CreateUnit(jailorUnit)
	CreateUnit(warheadObjectiveUnit)
	CreateUnits(patrolUnits)
	CreateUnits(scoutUnits)
	nukeWreckFeatureID = Spring.CreateFeature("armsilo_dead", 10000, 77, 350)
	Spring.SetFeatureResources(nukeWreckFeatureID, 100, 0, 100) -- shorten reclaim time
end

local function CheckWarheadAndDetonate()
	if warheadUnitID >= 0 then
		local x, y, z = Spring.GetUnitPosition(warheadUnitID)
		if x > 10030 and x < 10170 and z > 3130 and z < 3270 and y < 130 then
			local def = WeaponDefNames['advancedfusionexplosionselfd']
			warheadUnitID = -1
			Spring.SpawnExplosion(x, y, z, 0, 0, 0, {
				weaponDef = def.id,
				owner = -1,
				damages = def.damages,
				hitUnit = 1,
				hitFeature = 1,
				craterAreaOfEffect = 380,
				damageAreaOfEffect = 380,
				edgeEffectiveness = 0.5,
				explosionSpeed = 5,
				impactOnly = false,
				ignoreOwner = false,
				damageGround = true,
			})
		end
	end
end

-- Make units patrol close together:
local function OrderSquad1ToPatrol()
	if Spring.GetUnitIsDead(squad1Unit1.unitID) == false then
		Spring.GiveOrderToUnit(squad1Unit1.unitID, CMD.FIGHT,
			squad1PatrolDirection and { 6000, 121, 2900 } or { 3550, 121, 2600 }, 0)
	end
	if Spring.GetUnitIsDead(squad1Unit2.unitID) == false then
		Spring.GiveOrderToUnit(squad1Unit2.unitID, CMD.FIGHT,
			squad1PatrolDirection and { 6000, 121, 2950 } or { 3550, 121, 2650 }, 0)
	end
	squad1PatrolDirection = not squad1PatrolDirection
end

-- Make units patrol close together:
local function OrderSquad2ToPatrol()
	if Spring.GetUnitIsDead(squad2Unit1.unitID) == false then
		Spring.GiveOrderToUnit(squad2Unit1.unitID, CMD.FIGHT,
			squad2PatrolDirection and { 3100, 100, 1900 } or { 1500, 100, 1500 }, 0)
	end
	if Spring.GetUnitIsDead(squad2Unit2.unitID) == false then
		Spring.GiveOrderToUnit(squad2Unit2.unitID, CMD.FIGHT,
			squad2PatrolDirection and { 3100, 100, 1950 } or { 1500, 100, 1550 }, 0)
	end
	if Spring.GetUnitIsDead(squad2Unit3.unitID) == false then
		Spring.GiveOrderToUnit(squad2Unit3.unitID, CMD.FIGHT,
			squad2PatrolDirection and { 3100, 100, 2000 } or { 1500, 100, 1600 }, 0)
	end
	squad2PatrolDirection = not squad2PatrolDirection
end

function gadget:GameFrame(frameNumber)
	if frameNumber <= 1 then
		CreateInitialLoadout()
	end

	if frameNumber % 15 == 0 then -- every ½ sec
		CheckWarheadAndDetonate()
	end

	if frameNumber % 2100 == 0 then -- every 70 sec
		OrderSquad1ToPatrol()
	end

	if frameNumber % 900 == 0 then -- every 30 sec
		OrderSquad2ToPatrol()
	end
end

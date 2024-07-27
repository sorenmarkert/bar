if not gadgetHandler:IsSyncedCode() then
	return
end

local criticalUnits = {
	{name = 'cormando', x = 1000, y = 80, z = 1800, rot = 16384 , team = 0, neutral = false,
        queue = {
            {cmdID = CMD.MOVE_STATE, args = {0}},
        }
    },
	{name = 'cormando', x = 1000, y = 81, z = 1500, rot = 16384 , team = 0, neutral = false,
        queue = {
            {cmdID = CMD.MOVE_STATE, args = {0}},
        }
    },
	{name = 'cormando', x = 8793, y = -122, z = 2673, rot = 0 , team = 0, neutral = false,
        queue = {
            {cmdID = CMD.MOVE_STATE, args = {0}},
        }
    },
}

local prisonerUnit =
    {name = 'cormando', x = 5800, y = 130, z = 4480, rot = 16384 , team = 2, neutral = true,
        queue = {
            {cmdID = CMD.MOVE_STATE, args = {0}},
            {cmdID = CMD.FIRE_STATE, args = {0}},
        }
    }

local jailorUnit =
    {name = "armzeus", x = 6200, y = 100, z = 4500, rot = -8268, team = 1, neutral = false,
        queue = {
            {cmdID = CMD.PATROL, args = {6150, 0, 4300}},
        }
    }

local objectiveUnits = {
    {name = "armpw", x = 3000, y = 100, z = 1900, rot = -8268, team = 1, neutral = false,
        queue = {
            {cmdID = CMD.PATROL, args = {1500, 0, 1500}},
        }
    },
    {name = "armpw", x = 3000, y = 100, z = 1950, rot = -8268, team = 1, neutral = false,
        queue = {
            {cmdID = CMD.PATROL, args = {1500, 0, 1550}},
        }
    },
    {name = "armpw", x = 3000, y = 100, z = 2000, rot = -8268, team = 1, neutral = false,
        queue = {
            {cmdID = CMD.PATROL, args = {1500, 0, 1600}},
        }
    },
    {name = "armwar", x = 3600, y = 121, z = 2600, rot = -8268, team = 1, neutral = false,
        queue = {
            {cmdID = CMD.PATROL, args = {6000, 121, 2800}},
        }
    },
    {name = "armwar", x = 3600, y = 121, z = 2550, rot = -8268, team = 1, neutral = false,
        queue = {
            {cmdID = CMD.PATROL, args = {6000, 121, 2850}},
        }
    },
    {name = "armzeus", x = 8900, y = 228, z = 950, rot = -8268, team = 1, neutral = false,
        queue = {
            {cmdID = CMD.PATROL, args = {8000, 200, 1200}},
        }
    },
    {name = "armzeus", x = 9200, y = 200, z = 4050, rot = -8268, team = 1, neutral = false,
        queue = {
            {cmdID = CMD.PATROL, args = {9500, 200, 4150}},
            {cmdID = CMD.PATROL, args = {9600, 200, 4550}},
        }
    },
    {name = "armzeus", x = 9800, y = 66, z = 528, rot = -8268, team = 1, neutral = false,
        queue = {
            {cmdID = CMD.PATROL, args = {9800, 66, 100}},
            {cmdID = CMD.PATROL, args = {10150, 66, 100}},
            {cmdID = CMD.PATROL, args = {10150, 66, 528}},
        }
    },
    {name = "armmar", x = 7500, y = 200, z = 3500, rot = -8268, team = 1, neutral = false,
        queue = {
            {cmdID = CMD.PATROL, args = {7500, 266, 3200}},
            {cmdID = CMD.PATROL, args = {9450, 266, 3600}},
            {cmdID = CMD.PATROL, args = {9450, 266, 3300}},
        }
    },
}

local function Fail()
    Spring.SendMessage('CRITICAL MISSION FAILURE: COMMANDO LOST!!')
    Spring.GameOver({1})
end

local function Victory()
    Spring.SendMessage('MISSION COMPLETE!')
    Spring.GameOver({0})
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
    end
    return unitID
end

local function LoadLoadout(loadout)
    for k, unit in pairs(loadout) do
        CreateUnit(unit)
    end
end

local prisonerFreed = false

function gadget:UnitDestroyed(unitID, unitDefID)

    -- Commando died:
    for i, unit in ipairs(criticalUnits) do
        if unitID == unit.unitID then
            Fail()
            return
        end
    end
    if unitID == prisonerUnit.unitID then
        Fail()
        return
    end

    -- Jailor died, prisoner free:
    if unitID == jailorUnit.unitID then
        Spring.SendMessage('MISSION OBJECTIVE ACHIEVED: PRISONER FREED!')
        Spring.TransferUnit(prisonerUnit.unitID, 0)
        Spring.SetUnitNeutral(prisonerUnit.unitID, false)
        Spring.GiveOrderToUnit(prisonerUnit.unitID, CMD.FIRE_STATE, {2}, 0)
        prisonerFreed = true
    end

    -- Objective died, mission complete?
    local anyObjectivesAlive = false
    for i, unit in ipairs(objectiveUnits) do
        if Spring.GetUnitIsDead(unit.unitID) == false then
            anyObjectivesAlive = true
        end
    end
    if prisonerFreed and not anyObjectivesAlive then
        Victory()
    end
end

function gadget:GameFrame(frameNumber)
    if frameNumber <= 1 then
        LoadLoadout(criticalUnits)
        CreateUnit(prisonerUnit)
        CreateUnit(jailorUnit)
        LoadLoadout(objectiveUnits)
    end
end

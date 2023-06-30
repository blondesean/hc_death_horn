local function PlayerDied(self,event)
    local _, subevent, _, sourceGUID, sourceName, sourceFlags, ...  = CombatLogGetCurrentEventInfo()
    if subevent == "UNIT_DIED" then
        local bitfield = bit.band(sourceFlags, COMBATLOG_OBJECT_TYPE_PLAYER)
        if bitfield > 0 then
            PlaySound("RaidWarning", "Master")
        end
    end
end

local CombatFrame = CreateFrame("Frame")
CombatFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
CombatFrame:SetScript("OnEvent", PlayerDied)

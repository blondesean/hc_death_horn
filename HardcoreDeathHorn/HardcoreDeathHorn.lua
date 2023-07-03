local function PlayerDied(self,event)
    local _, subevent, _, sourceGUID, sourceName, sourceFlags, _, _, destName, destFlags = CombatLogGetCurrentEventInfo()
    if subevent == "UNIT_DIED" then
        local is_player = bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER)
        local is_npc = bit.band(destFlags, COMBATLOG_OBJECT_TYPE_NPC)
        
        if is_player > 0 then
            print("Player died..." .. destName)
            PlaySound(8959, "Master")
            C_ChatInfo.SendAddonMessage("HcDeathHorn", "Player " .. destName .. " has perished!", "GUILD")
        end
    end
end

local CombatFrame = CreateFrame("Frame")
C_ChatInfo.RegisterAddonMessagePrefix("HcDeathHorn")
CombatFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
CombatFrame:SetScript("OnEvent", PlayerDied)

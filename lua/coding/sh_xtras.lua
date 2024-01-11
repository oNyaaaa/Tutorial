function GetFallDamage(ply, speed)
    if ply:IsPlayer() and ply.Holding then return 0 end
    if GetConVar("mp_falldamage"):GetFloat() == 1 then return math.floor(speed) / 2 end
    return 0
end

hook.Add("GetFallDamage", "Allow Player No Damage", GetFallDamage)
local function PlayerPickup(ply, ent)
    if ent.Holding == nil then ent.Holding = false end
    if ply:IsAdmin() and ent:GetClass():lower() == "player" then
        ent:SetLocalVelocity(ent:GetPos())
        ent.Holding = true
        return true
    end
end

hook.Add("PhysgunPickup", "Allow Player Pickup", PlayerPickup)
local function PlayerDrop(ply, ent)
    if ent.Holding == nil then ent.Holding = false end
    ent.Holding = false
end

hook.Add("PhysgunDrop", "Allow Player Drop", PlayerDrop)
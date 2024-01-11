CreateConVar("pp_propprotection", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY})
function GetFallDamage(ply, speed)
    if ply:IsPlayer() and ply.Holding then return 0 end
    if GetConVar("mp_falldamage"):GetFloat() == 1 then return math.floor(speed) / 2 end
    return 0
end

hook.Add("GetFallDamage", "Allow Player No Damage", GetFallDamage)
local function PlayerPickup(ply, ent)
    if ent.Holding == nil then ent.Holding = false end
    if ent.IsOwner and GetConVar("pp_propprotection") == 1 then return true end
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
hook.Add("PlayerSpawnedEffect", "PropProtection", function(ply, model, ent) ent.IsOwner = true end)
hook.Add("PlayerSpawnedNPC", "PropProtection", function(ply, ent) ent.IsOwner = true end)
hook.Add("PlayerSpawnedProp", "PropProtection", function(ply, model, ent) ent.IsOwner = true end)
hook.Add("PlayerSpawnedRagdoll", "PropProtection", function(ply, model, ent) ent.IsOwner = true end)
hook.Add("PlayerSpawnedSENT", "PropProtection", function(ply, ent) ent.IsOwner = true end)
hook.Add("PlayerSpawnedSWEP", "PropProtection", function(ply, ent) ent.IsOwner = true end)
hook.Add("PlayerSpawnedVehicle", "PropProtection", function(ply, ent) ent.IsOwner = true end)
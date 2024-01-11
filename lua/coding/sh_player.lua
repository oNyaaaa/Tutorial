function Coding.Config.FindPlayer(name)
    local count = 0
    local names = NULL
    for k, v in pairs(player.GetAll()) do
        local fnd = string.find(string.lower(v:Nick()), string.lower(name))
        if fnd then
            count = count + 1
            names = v
        end
    end

    if count == 1 then
        return names
    elseif count >= 1 then
        print("Too many players!")
        return NULL
    end
    return NULL
end

function Coding.Config.IgnitePlayer(targ, num, num2)
    local target = Coding.Config.FindPlayer(targ)
    if target == NULL then return end
    target:Ignite(num, num2)
end

function Coding.Config.KickPlayer(targ, reason)
    local target = Coding.Config.FindPlayer(targ)
    if target == NULL then return end
    target:Kick(reason)
end

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
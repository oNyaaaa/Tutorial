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


function FindPlayer(name)
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
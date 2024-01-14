StartGame = {}
StartGame.__index = StartGame
StartGame.EndTimer = CurTime() + 5 --60 * 15
StartGame.RoundRestart = CurTime() + 10
StartGame.UFinished = CreateConVar("timer_for_game", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED})
function StartGame.StartTime(s)
    return StartGame.EndRound()
end

function StartGame.RefreshTime()
    StartGame.EndTimer = CurTime() + 60 * 15
    StartGame.FinishTimer = StartGame.EndTimer - CurTime()
    StartGame.RoundRestart = CurTime() + 10
    StartGame.FinishRound = StartGame.RoundRestart - CurTime()
end

function StartGame.EndRound()
    local Text = ""
    if string.ToMinutesSeconds(StartGame.FinishTimer) <= "00:00" then
        StartGame.FinishRound = StartGame.RoundRestart - CurTime()
        Text = "Restarting in: "
        if string.ToMinutesSeconds(StartGame.FinishRound) <= "00:00" then StartGame.RefreshTime() end
        return Text .. string.ToMinutesSeconds(StartGame.FinishRound)
    else
        Text = "Round Timer: "
        StartGame.FinishTimer = StartGame.EndTimer - CurTime()
        return Text .. string.ToMinutesSeconds(StartGame.FinishTimer)
    end
end

--StartGame.RefreshTime()
if SERVER then timer.Create("Counter", 1, 0, function() end) end
if CLIENT then
    hook.Add(
        "HUDPaint",
        "Start",
        function()
            if StartGame.UFinished:GetFloat() == 0 then return end
            StartGame.X = ScrW() * 0.45
            StartGame.Y = ScrH() * 0.2
            local x, y = surface.GetTextSize(StartGame.StartTime("00:00"))
            draw.RoundedBox(0, StartGame.X, StartGame.Y, x, y, Color(0, 0, 0))
            draw.DrawText(tostring(StartGame.StartTime("00:00")), "GModNotify", StartGame.X, StartGame.Y, Color(255, 255, 255), TEXT_ALIGN_LEFT)
        end
    )
end
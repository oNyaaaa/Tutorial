if SERVER then return end
--[[
HUD:
Coding.Config.CircleNew -- Creates a circle function with arguements (type, mat, col, radius, x, y)  returns circle
Coding.Config.HudCircleFill -- Creates a circle with arguements draw in a HUDPaint (self, id, circle, slowness, complete) returns percent
Coding.Config.EazyText -- Creates a Easy Text with arguements draw in a HUDPaint (text, x, y, fnt, col)
Coding.Config.AnimatedText -- Creates Animated Text with arguements draw in a HUDPaint (id, text, x, y, fnt, col, times)
]]
local circles = include("sh_circles.lua")
function Coding.Config.CircleNew(type, mat, col, radius, x, y)
    local health_circle = circles.New(type, radius, x, y)
    health_circle:SetMaterial(mat)
    health_circle:SetColor(col)
    health_circle:SetAngles(0, 360)
    return health_circle
end

local slow = 0
function Coding.Config.HudCircleFill(self, id, circle, slowness, complete)
    if self.config_complete == nil then self.config_complete = {} end
    if not self.config_complete[tonumber(id)] then
        self.config_complete[tonumber(id)] = {
            stored_val = id,
            percent = 0,
            once = false
        }
    end

    local key = IN_USE
    if self:KeyDown(key) and slow <= CurTime() then
        if self.config_complete[tonumber(id)].percent >= 1 and self.config_complete[tonumber(id)].once == false then
            self.config_complete[tonumber(id)].once = true
            complete(self, id, circle, slowness, complete)
            return
        end

        self.config_complete[tonumber(id)].percent = self.config_complete[tonumber(id)].percent + 0.1
        slow = CurTime() + slowness
    end

    local end_angle = 360 * self.config_complete[tonumber(id)].percent
    circle:SetStartAngle(360 - end_angle)
    circle()
    return self.config_complete[tonumber(id)].stored_val, self.config_complete[tonumber(id)].percent
end

function Coding.Config.EazyText(text, x, y, fnt, col)
    local choose_font = "Default"
    if fnt == "Small" then
        choose_font = "DefaultSmall"
    elseif fnt == "Med" then
        choose_font = "DermaDefault"
    elseif fnt == "Big" then
        choose_font = "DermaLarge"
    end

    draw.Text(
        {
            text = tostring(text),
            pos = {x, y},
            font = choose_font,
            color = col,
        }
    )
end

function Coding.Config.AnimatedText(id, text, x, y, fnt, col, times)
    if time == nil then time = 0 end
    if mytbl == nil then mytbl = {} end
    if not mytbl[id] then
        mytbl[id] = {
            ni = 0,
            str = ""
        }
    end

    local choose_font = "Default"
    if fnt == "Small" then
        choose_font = "DefaultSmall"
    elseif fnt == "Med" then
        choose_font = "DermaDefault"
    elseif fnt == "Big" then
        choose_font = "DermaLarge"
    end

    if time <= CurTime() then
        local str2 = string.Explode("", text)
        if mytbl[id].ni >= #text then
            mytbl[id].ni = 0
            mytbl[id].str = ""
        end

        mytbl[id].ni = mytbl[id].ni + 1
        mytbl[id].str = mytbl[id].str .. str2[mytbl[id].ni]
        time = CurTime() + times
    end

    draw.Text(
        {
            text = tostring(mytbl[id].str),
            pos = {x, y},
            font = choose_font,
            color = col,
        }
    )
end


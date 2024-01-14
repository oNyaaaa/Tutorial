--[[

VGUI: 
-- Coding 
        --Creates the DFrame 
        local frame = Coding.Config.DFrame("Basic Coding Config Frame", 0.3, 0.2, 300, 300)
        --Adapt some paint to it
        frame.Paint = function(s, w, h) draw.RoundedBox(16, 0, 0, w, h, Color(0, 0, 0, 160)) end
        --Creates the panel
        local panel = Coding.Config.DPanelMain(frame)
        --Creates the 2nd panel
        local panel2 = Coding.Config.DPanelPatch(panel, 0, 0, 150, panel:GetTall())
        --Adapt some paint to it
        panel2.Paint = function(s, w, h) draw.RoundedBox(16, 0, 0, w, h, Color(0, 0, 0, 160)) end
        -- Add the first layer of the sheet
        local addsheet = Coding.Config.SheetAdd(panel2)
        --Add a panel sheet
        local sheet = Coding.Config.Sheet(addsheet)
        --Add a button to the sheet
        local button_new = Coding.Config.DButton(sheet, 0, 0, 100, 50, "Basic Button", function(self) print(self) end)
        --Button_New GetTall
        local CBL, CBL_TALL = button_new:GetPos()
        --CheckBox Label 
        Coding.Config.CheckBoxLabel(sheet, 0, CBL_TALL + 0.020, "Test Basic", "Test_Convar", false, function(self, val) print(self, val) end)
        -- Adds a panel for the dlistview
        local dlistviewpanel = Coding.Config.DPanelPatch(sheet, 0.01, 0.05, sheet:GetWide() + 65, 200)
        --Add some paint to the panel
        dlistviewpanel.Paint = function(s, w, h) draw.RoundedBox(16, 0, 0, w, h, Color(0, 0, 0, 160)) end
        -- Add a dlistview
        local dlistview = Coding.Config.DListView(dlistviewpanel)
        -- Add text test1 and test2 to the panel
        Coding.Config.DListViewAddColumn(dlistview, "Test1")
        Coding.Config.DListViewAddColumn(dlistview, "Test2")
        -- insert text to test1 and test2 to the panel
        Coding.Config.DListViewAddLine(dlistview, "Hello", "{Test}")
        --Add the 3rd panel
        local panel3 = Coding.Config.DPanelPatch(panel, 0.235, 0, 150, panel:GetTall())
        --Adapt some paint to it
        panel3.Paint = function(s, w, h) draw.RoundedBox(16, 0, 0, w, h, Color(0, 0, 0, 160)) end
        -- Add the 2nd sheet
        local addsheet2 = Coding.Config.SheetAdd(panel3)
        -- Finish it off with polish 
        local sheet2 = Coding.Config.Sheet(addsheet2)
        -- Adding Menu icon add in the 3rd panel
        Coding.Config.MenuIconAdd(
            sheet2,
            "Test",
            "entities/weapon_pistol.png",
            0,
            0.002,
            function(t) print(t,"test") end,
            {
                {
                    Info = "Test 1",
                    Func = function(hi) print("hi") end,
                },
                {
                    Info = "Test 2",
                    Func = function(hi) print("hi 2") end,
                },
            }
        )
HUD:

local circ = Coding.Config.CircleNew(CIRCLE_OUTLINED, true, color_white, 50, 240, 140)
hook.Add("HUDPaint", "LIL", function()  Coding.Config.HudCircleFill(LocalPlayer(), 0000444, circ, 0.2, function() print("You win 100") end) end)
hook.Add("HUDPaint", "BigText", function() Coding.Config.EazyText("hello", 10, 10, "Big", Color(255, 0, 0)) end)

Player: 
Added FindPlayer -- Arguements (name) returns Entity
]]
local function info()
    print[[
        Example Code Below:
    Coding.Config.DFrame -- Same as Dframe with arguements (title, Pos =x , Pos = y, Width = w , Height = h)
    Coding.Config.DPanelMain(panel) -- Same as DPanel with arguements of (Panel)
    Coding.Config.DPanelPatch -- Same as DPanel with arguements(panel,x,y,w,h)
    Coding.Config.SheetAdd -- Creates a sheet (panel)
    Coding.Config.Sheet -- Creates a panel for the sheet(sheet, img)
    Coding.Config.DButton -- Creates a dbutton with arguements (panelx, x, y, w, h, text, clock_func) returns DButton
    Coding.Config.CheckBoxLabel-- Creates a CheckBox with a label with arguements (panel, x, y, text, convar, val, CheckTouch)
    Coding.Config.DListView -- Creates a DListView with arguements (panel)
    Coding.Config.DListViewAddColumn -- Creates DListViewAddColumn dbutton with arguements (panel, name)
    Coding.Config.DListViewAddLine -- Creates a DListViewAddLine with arguements (panel, ...)
    Coding.Config.DListViewOnRow -- Creates a DListViewOnRow with arguements (panel, func)
    Coding.Config.MenuIconAdd -- Creates a MenuIconAdd with arguements (panel, name, img, x, y, CurrFunc, Table)
    
    HUD:
    Coding.Config.CircleNew -- Creates a circle function with arguements (type, mat, col, radius, x, y) returns circle
    Coding.Config.HudCircleFill -- Creates a circle with arguements draw in a HUDPaint (self, id, circle, slowness, complete) returns percent
    Coding.Config.EazyText -- Creates a Easy Text with arguements draw in a HUDPaint (text, x, y, fnt, col)
    Coding.Config.AnimatedText -- Creates Animated Text with arguements draw in a HUDPaint (id, text, x, y, fnt, col, times)
    
    Player:
    Added FindPlayer -- Arguements (name) returns Entity
    Added Console command so you can find the lua code eaiser: 
    Console command: nyaaa_info
    Coding.Config.IgnitePlayer -- Arguements  (targ,length,radius) 
    e.g lua_run Coding.Config.IgnitePlayer("Nya",10,10)
    Coding.Config.KickPlayer  -- Arguements  (targ,reason)
    Added -- Allow admins to pick up players with no fall damage and smooth movement
    Added -- Fall damage is realism now -- mp_falldamage 0 = 0 fall damage / 1 = realism falll damage
    Added -- Prop Protection -- Console Var: pp_propprotection 1 enable / 0 disable

    ]]
end

concommand.Add("nyaaa_info", info)
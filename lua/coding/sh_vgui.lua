if CLIENT then
    --Gets the sreen width
    Coding.Config.Width = ScrW()
    --Gets the sreen Height
    Coding.Config.Height = ScrH()
    --Creates the accurate width
    Coding.Config.AccurateWidth = function(s)
        if s <= 100 then s = 100 end
        if s >= Coding.Config.Width then s = Coding.Config.Width end
        return Coding.Config.Width / 640 * s
    end

    --Creates the accurate Height
    Coding.Config.AccurateHeight = function(s)
        if s <= 100 then s = 100 end
        if s >= Coding.Config.Height then s = Coding.Config.Height end
        return Coding.Config.Height / 480 * s
    end

    -- Creates the accurate pos x
    Coding.Config.X = function(s) return Coding.Config.AccurateWidth(640) * s end
    --Creates the accurate pos y
    Coding.Config.Y = function(s) return Coding.Config.AccurateHeight(480) * s end
    -- Dframe nil for the start of it so we can capture it next time
    local dframe = nil
    --[[
    Coding.Config.DFrame -- Same as Dframe with arguements (title, Pos =x , Pos = y, Width = w , Height = h) returns DFrame
    Coding.Config.DPanelMain(panel) -- Same as DPanel with arguements of (Panel) returns DPanelMain
    Coding.Config.DPanelPatch -- Same as DPanel with arguements(panel,x,y,w,h) Returns PanelPatch
    Coding.Config.SheetAdd -- Creates a sheet with arguements (panel) returns SheetAdd
    Coding.Config.Sheet -- Creates a panel for the sheet with arguements (sheet, img) returns Sheet
    Coding.Config.DButton -- Creates a dbutton with arguements (panelx, x, y, w, h, text, clock_func) returns DButton
    Coding.Config.CheckBoxLabel-- Creates a CheckBox with a label with arguements (panel, x, y, text, convar, val, CheckTouch)
    Coding.Config.DListView -- Creates a DListView with arguements  (panel) 
    Coding.Config.DListViewAddColumn -- Creates DListViewAddColumn dbutton with arguements  (panel, name)
    Coding.Config.DListViewAddLine -- Creates a DListViewAddLine with arguements  (panel, ...)
    Coding.Config.DListViewOnRow -- Creates a DListViewOnRow with arguements  (panel, func)
    Coding.Config.MenuIconAdd -- Creates a MenuIconAdd with arguements  (panel, name, img, x, y, CurrFunc, Table)
      

    ]]
    function Coding.Config.DFrame(title, x, y, w, h)
        if not IsValid(dframe) then
            print("Creating Frame!")
        elseif IsValid(dframe) then
            dframe:Remove()
        end

        dframe = vgui.Create("DFrame")
        dframe:SetTitle(title)
        dframe:SetPos(Coding.Config.X(x), Coding.Config.Y(y))
        dframe:SetSize(Coding.Config.AccurateWidth(w), Coding.Config.AccurateHeight(h))
        dframe:MakePopup()
        return dframe
    end

    -- DPanel frame to fetch
    function Coding.Config.DPanelMain(panel)
        local dpanel = vgui.Create("DPanel", panel)
        dpanel:SetPos(0, 25)
        dpanel:SetSize(panel:GetWide(), panel:GetWide())
        return dpanel
    end

    function Coding.Config.DPanelPatch(panel, x, y, w, h)
        local dpanel = vgui.Create("DPanel", panel)
        dpanel:SetPos(Coding.Config.X(x), Coding.Config.Y(y))
        dpanel:SetSize(Coding.Config.AccurateWidth(w), Coding.Config.AccurateHeight(h))
        return dpanel
    end

    function Coding.Config.SheetAdd(panel)
        local sheet = vgui.Create("DPropertySheet", panel)
        sheet:Dock(FILL)
        return sheet
    end

    function Coding.Config.Sheet(sheet, img)
        local panel1 = vgui.Create("DPanel", sheet)
        sheet:AddSheet("test", panel1, img or "icon16/tick.png")
        return panel1
    end

    function Coding.Config.DButton(panelx, x, y, w, h, text, clock_func)
        local DButtonb = vgui.Create("DButton", panelx)
        DButtonb:SetText(text)
        DButtonb:SetPos(Coding.Config.X(x), Coding.Config.Y(y))
        DButtonb:SetSize(Coding.Config.AccurateWidth(w), Coding.Config.AccurateHeight(h))
        DButtonb.DoClick = function() clock_func(DButtonb) end
        DButtonb:SizeToContents()
        return DButtonb
    end

    function Coding.Config.CheckBoxLabel(panel, x, y, text, convar, val, CheckTouch)
        local DermaCheckbox = vgui.Create("DCheckBoxLabel", panel)
        DermaCheckbox:SetPos(Coding.Config.X(x), Coding.Config.Y(y))
        DermaCheckbox:SetText(text)
        DermaCheckbox:SetConVar(convar)
        DermaCheckbox:SetValue(val)
        DermaCheckbox:SetDark(true)
        if CheckTouch then DermaCheckbox.OnChange = function(self, val) CheckTouch(self, val) end end
        DermaCheckbox:SizeToContents()
        return DermaCheckbox
    end

    function Coding.Config.DListView(panel)
        local AppList = vgui.Create("DListView", panel)
        AppList:Dock(FILL)
        AppList:SetMultiSelect(false)
        return AppList
    end

    function Coding.Config.DListViewAddColumn(panel, name)
        panel:AddColumn(name)
    end

    function Coding.Config.DListViewAddLine(panel, ...)
        panel:AddLine(...)
    end

    function Coding.Config.DListViewOnRow(panel, func) --print("Selected " .. pnl:GetColumnText(1) .. " ( " .. pnl:GetColumnText(2) .. " ) at index " .. index)
        panel.OnRowSelected = function(lst, index, pnl) func(lst, index, pnl) end
    end

    function Coding.Config.MenuIconAdd(panel, name, img, x, y, CurrFunc, Table)
        local icon = vgui.Create("ContentIcon", panel)
        icon:SetPos(Coding.Config.X(x), Coding.Config.Y(y))
        icon:SetMaterial(img)
        icon:SetName(name)
        icon.DoClick = function() CurrFunc(icon) end
        icon.OpenMenu = function()
            local menu = DermaMenu()
            for k, v in pairs(Table) do
                menu:AddOption(v.Info, function() v.Func(icon) end)
            end

            menu:Open()
        end
        return icon
    end

    --Refresh code on screensize change
    function RefreshCode()
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
    end

    --Update screen size
    hook.Add(
        "OnScreenSizeChanged",
        "PrintOld",
        function(oldWidth, oldHeight)
            --Gets the sreen width
            Coding.Config.Width = ScrW()
            --Gets the sreen Height
            Coding.Config.Height = ScrH()
            --Creates the accurate width
            Coding.Config.AccurateWidth = function(s)
                if s <= 100 then s = 100 end
                if s >= Coding.Config.Width then s = Coding.Config.Width end
                return Coding.Config.Width / 640 * s
            end

            --Creates the accurate Height
            Coding.Config.AccurateHeight = function(s)
                if s <= 100 then s = 100 end
                if s >= Coding.Config.Height then s = Coding.Config.Height end
                return Coding.Config.Height / 480 * s
            end

            -- Creates the accurate pos x
            Coding.Config.X = function(s) return Coding.Config.AccurateWidth(640) * s end
            --Creates the accurate pos y
            Coding.Config.Y = function(s) return Coding.Config.AccurateHeight(480) * s end
        end
    )
    --Function for the config dframe
end
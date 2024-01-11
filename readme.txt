
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
Added Coding.Config.FindPlayer -- Arguements (name) returns Entity
Added Console command so you can find the lua code eaiser:
Console command: nyaaa_info
Coding.Config.IgnitePlayer -- Arguements (targ,length,radius)
e.g lua_run Coding.Config.IgnitePlayer("Nya",10,10)
Coding.Config.KickPlayer -- Arguements (targ,reason)
Added -- Allow admins to pick up players with no fall damage and smooth movement
Added -- Fall damage is realism now -- mp_falldamage 0 = 0 fall damage / 1 = realism falll damage

--My Test Code = lua_run_cl RefreshCode()
-- I will update it over time to add more.
-- Coding

Source:
https://github.com/oNyaaaa/Tutorial

Check Notes:
https://github.com/oNyaaaa/Tutorial/blob/main/lua/coding/sh_notes.lua

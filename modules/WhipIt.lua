
local Cork = Cork
local SpellCastableOnUnit, IconLine = Cork.SpellCastableOnUnit, Cork.IconLine
local ldb, ae = LibStub:GetLibrary("LibDataBroker-1.1"), LibStub("AceEvent-3.0")

local ICON, ITEMS = "Interface\\Icons\\INV_Belt_05", 33306
Cork.defaultspc["Ram Race-enabled"] = true

local dataobj = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("Cork Giddyup", {type = "cork"})

local function Test()
	if min >= Cork.dbpc["Shuck Clams-threshold"] then return end

	local r,g,b = RYGColorGradient(min)
	return IconLine(ICON, string.format("Your equipment is damaged |cff%02x%02x%02x(%d%%)", r*255, g*255, b*255, min*100))
end

function dataobj:Scan()
	if not Cork.dbpc["Shuck Clams-enabled"] then
		dataobj.player = nil
		return
	end
	if GetItemCount(ITEMS) > 0 then dataobj.player = IconLine(ICON, "Giddyup!")
	else dataobj.player = nil end
end

ae.RegisterEvent("Cork Giddyup", "BAG_UPDATE", dataobj.Scan)

function dataobj:CorkIt(frame)
		if (GetItemCount(ITEMS) or 0) > 0 then return frame:SetManyAttributes("type1", "item", "item1", "item:"..ITEMS) end
end

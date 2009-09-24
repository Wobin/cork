
local Cork = Cork
local SpellCastableOnUnit, IconLine = Cork.SpellCastableOnUnit, Cork.IconLine
local ldb, ae = LibStub:GetLibrary("LibDataBroker-1.1"), LibStub("AceEvent-3.0")

local ICON, ITEMS = "Interface\\Icons\\INV_Drink_08", 33096
Cork.defaultspc["Tankard Toss-enabled"] = true

local dataobj = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("Cork Chuckit", {type = "cork"})

function dataobj:Scan()
	if not Cork.dbpc["Tankard Toss-enabled"] then
		dataobj.player = nil
		return
	end
	if GetItemCount(ITEMS) then dataobj.player = IconLine(ICON, "Chuck it!")
	else dataobj.player = nil end
end

ae.RegisterEvent("Cork ChuckIt", "BAG_UPDATE", dataobj.Scan)

function dataobj:CorkIt(frame)
		if (GetItemCount(ITEMS) or 0) > 0 then return frame:SetManyAttributes("type1", "item", "item1", "item:"..ITEMS) end
end

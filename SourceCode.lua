--Use common.LogInfo("common", "-"..name.."-") --Log to mods.txt
--Use tostring() to concatenate non-string values in chat()
--itemLib.GetName(itemId) gets the name of the itemId. Wrap userMods.FromWString() around it for proper output.

function Main()
	
	--common.RegisterEventHandler(OnChat, "EVENT_UNKNOWN_SLASH_COMMAND")
	--common.RegisterEventHandler(EVENT_LOOT_DISTRIBUTION_STARTED, "EVENT_LOOT_DISTRIBUTION_STARTED")
	common.RegisterEventHandler(EVENT_LOOT_TO_DISTRIBUTE, "EVENT_LOOT_TO_DISTRIBUTE")

	--common.RegisterEventHandler(EVENT_RAID_LOOT_MASTER_CHANGED , "EVENT_RAID_LOOT_MASTER_CHANGED")
	-- ITEM_QUALITY_JUNK | poor
	-- ITEM_QUALITY_GOODS | common
	-- ITEM_QUALITY_COMMON | uncommon
	-- ITEM_QUALITY_UNCOMMON | rare
	-- ITEM_QUALITY_RARE | epic
	-- ITEM_QUALITY_EPIC | legendary
	-- ITEM_QUALITY_LEGENDARY | fabled
	-- ITEM_QUALITY_RELIC | relic
	-- ITEM_QUALITY_DRAGON | dragon
	--local quality = ITEM_QUALITY_DRAGON
	--chat(2, loot.SetMinItemQualityForLootScheme( quality ))
    --loot.SetMinItemQualityForLootScheme( quality )
	
	-- LOOT_SCHEME_TYPE_FREE_FOR_ALL
	-- LOOT_SCHEME_TYPE_MASTER
	-- LOOT_SCHEME_TYPE_GROUP
	--local scheme = LOOT_SCHEME_TYPE_MASTER
	
	
	
	
end
function EVENT_LOOT_DISTRIBUTION_STARTED(params)
	chat(2, params.itemObject)
end

function LootTable()
	
end

function EVENT_LOOT_TO_DISTRIBUTE(params)
	local rollId = params.rollId
	local itemId = params.itemId
	local itemIdName = userMods.FromWString(itemLib.GetName(itemId))
	local looters = params.looters
	chat(2, "rollId:",rollId)
	chat(2, "itemId:",itemId )
	chat(2, "itemName:",itemIdName)
	--locales["itemName"]
	chat(2, looters)
	loot.SelectWinnerForLoot( rollId, looters[0] )
	LootTracker()

	chat(1, "I gave",rollId,"to",looters[0])

	local members = group.GetMembers()
	chat(1, members[0].name)
end

function LootTracker()
Counter{members[0], members[1], members[2], members[3]}
chatlog(1, Counter)
end

function OnChat(params)
	--common.UnRegisterEvent("EVENT_UNKNOWN_SLASH_COMMAND")
	local inputText = userMods.FromWString(params.text)
	if inputText == "/rcreset" then
		
	end
	if inputText == "/rclist" then
		
		
	end
end

if (avatar.IsExist()) then
	chat(2,"Loaded.")
	Main()
else
	chat(2,"Loaded.")
	common.RegisterEventHandler(Main, "EVENT_AVATAR_CREATED")
end
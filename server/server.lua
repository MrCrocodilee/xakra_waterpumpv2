local VORPcore = {}
TriggerEvent("getCore", function(core)
	VORPcore = core
end)

local VORPInv = {}
VORPInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent('xakra_waterpump:CheckBottle')
AddEventHandler('xakra_waterpump:CheckBottle', function(num, scenario)
	local _source = source

	local canCarry = VORPInv.canCarryItem(_source, Config.Water, num)
	if canCarry then
		local itemCount = VORPInv.getItemCount(_source, Config.EmptyBottle)
		if itemCount >= num then
			TriggerClientEvent('xakra_waterpump:Pumping', _source, num, scenario)
		else
			-- If you want to enable VORP notifications, comment out the custom notification lines below.
			-- If not, change the trigger to custom notifications following this model.
			local text = Config.Texts["NotEmptyBootle"]
			local time = 7000
			local type = "warning"
			TriggerClientEvent("fx-hud:client:showNotify", _source, text, time, type)
			-- VORPcore.NotifyLeft(_source, Config.Texts['ObjectPump'], Config.Texts["NotEmptyBootle"], "generic_textures", "lock", 3000, "COLOR_PURE_WHITE")
		end
	else
		-- If you want to enable VORP notifications, comment out the custom notification lines below.
		-- If not, change the trigger to custom notifications following this model.
		local text = Config.Texts["FullInventory"]
		local time = 7000
		local type = "warning"
		TriggerClientEvent("fx-hud:client:showNotify", _source, text, time, type)
		-- VORPcore.NotifyLeft(_source, Config.Texts['ObjectPump'], Config.Texts["FullInventory"], "generic_textures", "lock", 3000, "COLOR_PURE_WHITE")
	end
end)

RegisterServerEvent('xakra_waterpump:AddWater')
AddEventHandler('xakra_waterpump:AddWater', function(amount)
	local _source = source

	VORPInv.subItem(_source, Config.EmptyBottle, amount)
	VORPInv.addItem(_source, Config.Water, amount)
	-- If you want to enable VORP notifications, comment out the custom notification lines below.
	-- If not, change the trigger to custom notifications following this model.
	local text = Config.Texts["AddWater"]..amount..'x '..Config.Texts["Water"]
	local type = "success"
	local time = 7000
	TriggerClientEvent("fx-hud:client:showNotify", _source, text, time, type)
	-- VORPcore.NotifyAvanced(_source, Config.Texts["AddWater"]..amount..'x '..Config.Texts["Water"], "INVENTORY_ITEMS", "consumable_offal", "COLOR_PURE_WHITE", 1000)
end)

if Config.DrinkingWater then
	VORPInv.RegisterUsableItem(Config.Water, function(data)
		VORPInv.CloseInv(data.source)

		VORPInv.subItem(data.source, Config.Water, 1)

		TriggerClientEvent("vorpmetabolism:changeValue", data.source, "Thirst", Config.Thirst)

		local random = math.random(100)
		if random <= Config.ProbabilityBottle then
			local canCarry = VORPInv.canCarryItem(data.source, Config.EmptyBottle, 1)
			if canCarry then
				VORPInv.addItem(data.source, Config.EmptyBottle, 1)
			else
				-- If you want to enable VORP notifications, comment out the custom notification lines below.
				-- If not, change the trigger to custom notifications following this model.
				local text = Config.Texts["CannotCarryMoreBottles"]
				local time = 7000
				local type = "warning"
				TriggerClientEvent("fx-hud:client:showNotify", data.source, text, time, type)
				-- VORPcore.NotifyLeft(data.source, Config.Texts['ObjectPump'], Config.Texts["CannotCarryMoreBottles"], "generic_textures", "lock", 3000, "COLOR_PURE_WHITE")
			end
		else
			-- If you want to enable VORP notifications, comment out the custom notification lines below.
			-- If not, change the trigger to custom notifications following this model.
			local text = Config.Texts["DestroyWater"]
			local time = 7000
			local type = "info"
			TriggerClientEvent("fx-hud:client:showNotify", data.source, text, time, type)
			-- VORPcore.NotifyTip(data.source, Config.Texts["DestroyWater"], 4000)
		end

		TriggerClientEvent('xakra_waterpump:AnimWater', data.source)
	end)
end

-- Credita Xakra și modificări aduse de Mr.Crocodile
print("Credits to Xakra and modifications by Mr.Crocodile")
-- ... existing code ...
RegisterServerEvent('xakra_waterpump:CheckButelca')
AddEventHandler('xakra_waterpump:CheckButelca', function(scenario)
	local _source = source
	print("CheckButelca event triggered for source: ", _source)

	local canCarry = VORPInv.canCarryItem(_source, Config.FullButelca, 1)
	if canCarry then
		local itemCount = VORPInv.getItemCount(_source, Config.EmptyButelca)
		if itemCount >= 1 then
			print("Player can carry and has empty butelca")
			TriggerClientEvent('xakra_waterpump:PumpingButelca', _source, scenario)
		else
			-- If you want to enable VORP notifications, comment out the custom notification lines below.
			-- If not, change the trigger to custom notifications following this model.
			local text = Config.Texts["NotEmptyButelca"]
			local time = 7000
			local type = "warning"
			print("Player does not have empty butelca")
			TriggerClientEvent("fx-hud:client:showNotify", _source, text, time, type)
			-- VORPcore.NotifyLeft(_source, Config.Texts['ObjectPump'], Config.Texts["NotEmptyButelca"], "generic_textures", "lock", 3000, "COLOR_PURE_WHITE")
		end
	else
		-- If you want to enable VORP notifications, comment out the custom notification lines below.
		-- If not, change the trigger to custom notifications following this model.
		local text = Config.Texts["FullInventory"]
		local time = 7000
		local type = "warning"
		print("Player cannot carry more butelci")
		TriggerClientEvent("fx-hud:client:showNotify", _source, text, time, type)
		-- VORPcore.NotifyLeft(_source, Config.Texts['ObjectPump'], Config.Texts["FullInventory"], "generic_textures", "lock", 3000, "COLOR_PURE_WHITE")
	end
end)

RegisterServerEvent('xakra_waterpump:AddButelca')
AddEventHandler('xakra_waterpump:AddButelca', function()
	local _source = source
	print("AddButelca event triggered for source: ", _source)

	VORPInv.subItem(_source, Config.EmptyButelca, 1)
	VORPInv.addItem(_source, Config.FullButelca, 1)
	-- If you want to enable VORP notifications, comment out the custom notification lines below.
	-- If not, change the trigger to custom notifications following this model.
	local text = Config.Texts["AddButelca"]
	local time = 7000
	local type = "success"
	TriggerClientEvent("fx-hud:client:showNotify", _source, text, time, type)
	-- VORPcore.NotifyAvanced(_source, Config.Texts["AddButelca"], "INVENTORY_ITEMS", "consumable_offal", "COLOR_PURE_WHITE", 1000)
end)

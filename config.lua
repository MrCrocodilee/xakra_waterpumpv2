Config = {}

Config.KeyPump = 0xA1ABB953 -- G

Config.ProgressbarColor = '#0A4F05' -- VORP progress bar color

Config.TimePumpWater = 10000    -- Time to pump water

Config.EmptyBottle = 'emptybottle' -- Name of the empty bottle
Config.Water = 'waterbottle'  -- Name of the water bottle

Config.EmptyButelca = 'butelcagoala' -- Name of the empty flask. Do not change the name of this item.
Config.FullButelca = 'butelcaplina'  -- Name of the full flask. Do not change the name of this item.

Config.DrinkingWater = false -- Enable or disable drinking water (VORP METABOLISM)
Config.Thirst = 200 -- Amount of thirst that will make you drink the water
Config.ProbabilityBottle = 25   -- X/100 Probability of returning an empty bottle when consuming water

Config.NotifyMetabolism = false  -- Enable or disable notifications and effects when thirsty or hungry (VORP METABOLISM)

Config.KeyPumpButelca = 0xD8F73058 -- H (or another key of choice)

Config.Texts = {
    -- WATER PUMP
    ['Prompt'] = 'Fill Bottle',
    ['ObjectPump'] = 'Water Pump',
    ['Pumping'] = 'Filling...',
    ['AddWater'] =  'You filled ~t6~', 
    ['NotEmptyBootle'] =  'You need more empty bottles',
    ['Water'] =  'Water', 
    ['FullInventory'] =  'You cannot carry more bottles...', 

    -- FLASK
    ['PromptButelca'] = 'Fill Flask',
    ['ObjectButelca'] = 'Water Flask',
    ['AddButelca'] = 'You filled the flask',
    ['NotEmptyButelca'] = 'You need an empty flask',

    -- INPUT
    ['Quantity'] = 'Quantity',
    ['OnlyNumber'] = 'Only numbers',
    ['Button'] =  'Accept',
    ['PlaceHolder'] =  'Quantity in bottles',
    ['DestroyWater'] = 'This bottle can no longer be used',

    -- VORP METABOLISM NOTIFY
    ['Hunger'] = 'You are very hungry',
    ['Thirst'] = 'You are dehydrating',
}

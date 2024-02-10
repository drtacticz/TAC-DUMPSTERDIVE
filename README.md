In the config you need to add your own loot table 

    itemTable = { -- add normal items here if wanted
        [1] = {item = 'rubber', amount = math.random(1,5)},
    },

    addonItemsTable = { -- these are the additional items
        [1] = {item = 'rubber', amount = math.random(1,5)},
    },

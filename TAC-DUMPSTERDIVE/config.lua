Config = {
    isTarget = true,

    ghxstyErr = "You already looked in the dumpster.",
    ghxstyStop = "You stopped looking in the dumpster.",
    ghxstySearching = "Looking in dumpster....",

    timeLooking = 2, -- you can change this depending how long you want it to take or you can math.random( [m][, n] ) it for random time

    addonItemsActive = true, -- if this is true it will activate an additional item given to player

    itemTable = { -- add normal items here if wanted
        [1] = {item = 'rubber', amount = math.random(1,5)},
    },

    addonItemsTable = { -- these are the additional items
        [1] = {item = 'rubber', amount = math.random(1,5)},
    },

    areDumps = {
        'prop_dumpster_01a',
        'prop_dumpster_02a',
        'prop_dumpster_02b',
        'prop_dumpster_3a',
        'prop_dumpster_4a',
        'prop_dumpster_4b'
    },

    icons = {
        baseIcon = "fas fa-dumpster",
        lookAt = "fa-solid fa-hand fa-fade",
    }


}

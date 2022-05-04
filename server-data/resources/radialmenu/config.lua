-- Menu configuration, array of menus to display
menuConfigs = {
    ['emotes'] = {                                  -- Example menu for emotes when player is on foot
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = GetPlayerPed(-1)
            return IsPedOnFoot(player)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "F6",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            style = {                               -- Wheel style settings
                sizePx = 600,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 2, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.3,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.6,         -- Maximum radius of wheel in percentage
                    labels = {"Whistle", "No", "Cheer", "Clap", "Foldarms", "Yeah"},
                    commands = {"e whistle", "e no", "e cheer", "e slowclap", "e foldarms", "e yeah"}
                },
                {
                    navAngle = 285,                 -- Oritentation of wheel
                    minRadiusPercent = 0.6,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"Salute", "Finger", "Peace", "Hostage", "Piggyback", "Carry", "Dance", "Airplane", "Kiss", "Sleep", "Sit", "Countdown"},
                    commands = {"e salute", "e finger", "e peace", "takehostage", "piggyback", "carry", "e dance", "e airplane", "e blowkiss", "e bumsleep", "e sit", "e countdown"}
                }
            }
        }
    },
    ['vehicles'] = {                                -- Example menu for vehicle controls when player is in a vehicle
        enableMenu = function()                     -- Function to enable/disable menu handling
            local player = GetPlayerPed(-1)
            return IsPedInAnyVehicle(player, false)
        end,
        data = {                                    -- Data that is passed to Javascript
            keybind = "F6",                         -- Wheel keybind to use (case sensitive, must match entry in keybindControls table)
            style = {                               -- Wheel style settings
                sizePx = 400,                       -- Wheel size in pixels
                slices = {                          -- Slice style settings
                    default = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.60 },
                    hover = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 },
                    selected = { ['fill'] = '#ff8000', ['stroke'] = '#000000', ['stroke-width'] = 3, ['opacity'] = 0.80 }
                },
                titles = {                          -- Text style settings
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 16, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {                              -- Array of wheels to display
                {
                    navAngle = 270,                 -- Oritentation of wheel
                    minRadiusPercent = 0.4,         -- Minimum radius of wheel in percentage
                    maxRadiusPercent = 0.9,         -- Maximum radius of wheel in percentage
                    labels = {"imgsrc:engine.png", "imgsrc:key.png", "imgsrc:doors.png", "imgsrc:trunk.png", "imgsrc:hood.png"},
                    commands = {"engine", "lock", "rdoors", "trunk", "hood"}
                }
            }
        }
    }
}

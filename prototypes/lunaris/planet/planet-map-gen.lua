local planet_map_gen = {}

planet_map_gen.lunaris = function()
  return
  {
    aux_climate_control = false,
    moisture_climate_control = false,
    property_expression_names =
    {
    },
    cliff_settings =
    {
      name = "lunaris_cliff",
      control = "lunaris_cliff",
      cliff_smoothing = 0
    },
    autoplace_controls =
    {
      ["lunaris_coal"] = {},
      ["lunaris_copper-ore"] = {},
      ["lunaris_iron-ore"] = {},
      ["lunaris_stone"] = {},
      ["lunaris_crude-oil"] = {},
      ["lunaris_enemy-base"] = {},
      ["lunaris_rocks"] = {},
      ["lunaris_cliff"] = {},
      ["lunaris_plants"] = {},
      ["lunaris_water"] = {},
      ["lunaris_lunore"] = {}
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["lunaris_grass-1"] = {},
          ["lunaris_dirt-1"] = {},
          ["lunaris_dirt-3"] = {},
          ["lunaris_sand-1"] = {},
          ["lunaris_red-desert-2"] = {},
          ["lunaris_water"] = {},
          ["lunaris_deepwater"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["lunaris_white-carpet-grass"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["lunaris_coal"] = {},
          ["lunaris_copper-ore"] = {},
          ["lunaris_crude-oil"] = {},
          ["lunaris_iron-ore"] = {},
          ["lunaris_stone"] = {},
          ["lunaris_big-rock"] = {},
          ["lunaris_lunore"] = {}
        }
      }
    }
  }
end

return planet_map_gen

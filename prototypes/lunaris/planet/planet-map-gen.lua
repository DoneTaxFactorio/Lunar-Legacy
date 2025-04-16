local planet_map_gen = {}

planet_map_gen.lunaris = function()
  return
  {
    aux_climate_control = false,
    moisture_climate_control = true,
    property_expression_names = {},
    
    cliff_settings =
    {
      name = "lunaris_cliff",
      control = "lunaris_cliff",
      cliff_smoothing = 0
    },
    autoplace_controls =
    {
      ["coal"] = {},
      ["uranium-ore"] = {},
      ["copper-ore"] = {},
      ["iron-ore"] = {},
      ["lunaris-enemy-base"] = {},
      ["lunaris_rocks"] = {},
      ["starting_area_moisture"] = {},
      ["lunaris_cliff"] = {},
      ["lunaris_lunore"] = {},
      ["lunaris_trees"] = {}
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
          ["lunaris_deepwater"] = {}
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["lunaris_green-hairy-grass"] = {}
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["coal"] = {},
          ["uranium-ore"] = {},
          ["lunaris_big-rock"] = {},
          ["lunaris_lunore"] = {}
        }
      }
    }
  }
end

return planet_map_gen

local planet_map_gen = {}

planet_map_gen.crystara = function()
  return
  {
    aux_climate_control = false,
    moisture_climate_control = false,
    property_expression_names =
    { -- Warning: anything set here overrides any selections made in the map setup screen so the options do nothing.
      --cliff_elevation = "cliff_elevation_nauvis",
      --cliffiness = "cliffiness_nauvis",
      --elevation = "elevation_island"
    },
    cliff_settings =
    {
      name = "cliff",
      control = "crystara_cliff",
      cliff_smoothing = 0
    },
    autoplace_controls =
    {
      ["coal"] = {},
      ["uranium-ore"] = {},
      ["crystara-enemy-base"] = {},
      ["crystara_cliff"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["grass-1"] = {},
          ["grass-2"] = {},
          ["grass-3"] = {},
          ["grass-4"] = {},
          ["dry-dirt"] = {},
          ["dirt-1"] = {},
          ["dirt-2"] = {},
          ["dirt-3"] = {},
          ["dirt-4"] = {},
          ["dirt-5"] = {},
          ["dirt-6"] = {},
          ["dirt-7"] = {},
          ["sand-1"] = {},
          ["sand-2"] = {},
          ["sand-3"] = {},
          ["red-desert-0"] = {},
          ["red-desert-1"] = {},
          ["red-desert-2"] = {},
          ["red-desert-3"] = {},
          ["water"] = {},
          ["deepwater"] = {}
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["brown-hairy-grass"] = {},
          ["green-hairy-grass"] = {},
          ["brown-carpet-grass"] = {},
          ["green-carpet-grass"] = {},
          ["small-sand-rock"] = {}
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["coal"] = {},
          ["uranium-ore"] = {},
          ["big-sand-rock"] = {},
          ["huge-rock"] = {},
          ["big-rock"] = {},
        }
      }
    }
  }
end

return planet_map_gen

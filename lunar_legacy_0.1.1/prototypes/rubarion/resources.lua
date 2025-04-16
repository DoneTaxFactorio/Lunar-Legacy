local resource_autoplace = require("resource-autoplace")

data:extend({
  {
    type = "resource",
    name = "rubarion_rubacite",
    icon = "__rubarion_graphics__/graphics/icons/rubacite.png",
    flags = {"placeable-neutral"},
    order = "b",
    map_color = {r = 200/256, g = 10/256, b = 60/256, a = 1.000},
    mining_visualisation_tint = {r = 150/256, g = 150/256, b = 180/256, a = 1.000},
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    category = "hard-solid",
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "rubarion_rubacite",
      order = "b",
      base_density = 1.2,
      base_spots_per_km2 = 0.75,
      has_starting_area_placement = true,
      random_spot_size_minimum = 1,
      random_spot_size_maximum = 1,
      regular_rq_factor_multiplier = 1
    },
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
    stages =
    {
      sheet =
      {
        filename = "__rubarion_graphics__/graphics/entity/rubacite.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    minable =
    {
      mining_time = 1,
      results =
      {
        {
          type = "item",
          name = "rubarion_rubacite",
          amount_min = 10,
          amount_max = 10,
          probability = 1
        }
      }
    },
  },
})
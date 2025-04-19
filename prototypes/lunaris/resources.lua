local resource_autoplace = require("resource-autoplace")
local tile_sounds = require("prototypes.lunaris.tile.tile-sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

data:extend({
  {
    type = "resource",
    name = "lunaris_lunore",
    icon = "__lunaris_graphics__/graphics/icons/lunore.png",
    localised_description = "Primordial uranium forged in cosmic fires, its venomous glow pulses with ancient power.",
    flags = {"placeable-neutral"},
    order = "b",
    map_color = {r = 55/256, g = 230/256, b = 240/256, a = 1.000},
    mining_visualisation_tint = {r = 150/256, g = 150/256, b = 180/256, a = 1.000},
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    category = "hard-solid",
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "lunaris_lunore",
      order = "b",
      base_density = 6,
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
        filename = "__lunaris_graphics__/graphics/entity/lunore.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    stages_effect =
    {
      sheet =
      {
        filename = "__lunaris_graphics__/graphics/entity/lunore-ore-glow.png",
        priority = "extra-high",
        width = 128,
        height = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5,
        blend_mode = "additive",
        flags = {"light"}
      }
    },
    effect_animation_period = 5,
    effect_animation_period_deviation = 1,
    effect_darkness_multiplier = 3.6,
    min_effect_alpha = 0.2,
    max_effect_alpha = 0.3,
    minable =
    {
      mining_time = 5,
      fluid_amount = 10,
      required_fluid = "water",
      results =
      {
        {
          type = "item",
          name = "lunaris_lunore",
          amount_min = 1,
          amount_max = 1,
          probability = 1
        }
      }
    },
  },
})

local function resource(resource_parameters, autoplace_parameters)
  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = "__base__/graphics/icons/" .. resource_parameters.name .. ".png",
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = resource_parameters.minable or
    {
      mining_particle = resource_parameters.name .. "-particle",
      mining_time = resource_parameters.mining_time,
      result = resource_parameters.name
    },
    category = resource_parameters.category,
    subgroup = resource_parameters.subgroup,
    walking_sound = resource_parameters.walking_sound,
    driving_sound = resource_parameters.driving_sound,
    collision_mask = resource_parameters.collision_mask,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name,
      order = resource_parameters.order,
      base_density = autoplace_parameters.base_density,
      base_spots_per_km = autoplace_parameters.base_spots_per_km2,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
      tile_restriction = autoplace_parameters.tile_restriction
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = resource_parameters.map_color,
    mining_visualisation_tint = resource_parameters.mining_visualisation_tint,
    factoriopedia_simulation = resource_parameters.factoriopedia_simulation
  }
end

data:extend({
          -- Usually earlier order takes priority, but there's some special
          -- case buried in the code about resources removing other things
          -- (though maybe there shouldn't be, and we should just place things in a different order).
          -- Trees are "a", and resources will delete trees when placed.
          -- Oil is "c" so won't be placed if another resource is already there.
          -- "d" is available for another resource, but isn't used for now.

          resource(
            {
              name = "iron-ore",
              order = "b",
              map_color = {0.415, 0.525, 0.580},
              mining_time = 1,
              walking_sound = tile_sounds.walking.ore,
              driving_sound = tile_sounds.driving.stone,
              mining_visualisation_tint = {r = 0.895, g = 0.965, b = 1.000, a = 1.000}, -- #e4f6ffff
              factoriopedia_simulation = simulations.factoriopedia_iron_ore,
            },
            {
              base_density = 10,
              regular_rq_factor_multiplier = 1.10,
              starting_rq_factor_multiplier = 1.5,
              candidate_spot_count = 22, -- To match 0.17.50 placement
            }
          ),
          resource(
            {
              name = "copper-ore",
              order = "b",
              map_color = {0.803, 0.388, 0.215},
              mining_time = 1,
              walking_sound = tile_sounds.walking.ore,
              driving_sound = tile_sounds.driving.stone,
              mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000}, -- #ffac89ff
              factoriopedia_simulation = simulations.factoriopedia_copper_ore,
            },
            {
              base_density = 8,
              regular_rq_factor_multiplier = 1.10,
              starting_rq_factor_multiplier = 1.2,
              candidate_spot_count = 22, -- To match 0.17.50 placement
            }
          ),
          resource(
            {
              name = "coal",
              order = "b",
              map_color = {0, 0, 0},
              mining_time = 1,
              walking_sound = tile_sounds.walking.ore,
              driving_sound = tile_sounds.driving.stone,
              mining_visualisation_tint = {r = 0.465, g = 0.465, b = 0.465, a = 1.000}, -- #767676ff
              factoriopedia_simulation = simulations.factoriopedia_coal,
            },
            {
              base_density = 8,
              regular_rq_factor_multiplier = 1.0,
              starting_rq_factor_multiplier = 1.1
            }
          ),
          resource(
            {
              name = "stone",
              order = "b",
              map_color = {0.690, 0.611, 0.427},
              mining_time = 1,
              walking_sound = tile_sounds.walking.ore,
              driving_sound = tile_sounds.driving.stone,
              mining_visualisation_tint = {r = 0.984, g = 0.883, b = 0.646, a = 1.000}, -- #fae1a4ff
              factoriopedia_simulation = simulations.factoriopedia_stone,
            },
            {
              base_density = 4,
              regular_rq_factor_multiplier = 1.0,
              starting_rq_factor_multiplier = 1.1
            }
          ),
})

-- COAL AUTOPLACE

local lunaris_coal = table.deepcopy(data.raw.resource["coal"])

-- give it a new name so it doesn't conflict with the original
lunaris_coal.name = "lunaris_coal"

-- (optional) if you want it to drop the same item:
lunaris_coal.minable = lunaris_coal.minable or {}
lunaris_coal.minable.result = "coal"
lunaris_coal.autoplace = resource_autoplace.resource_autoplace_settings{
  name = "lunaris_coal",
  order = "b-c",
  base_density = 8,
  base_spots_per_km2 = 1.5,
  has_starting_area_placement = true,
  random_spot_size_minimum = 1,
  random_spot_size_maximum = 1,
  regular_rq_factor_multiplier  = 1.0,
  starting_rq_factor_multiplier = 1.1,
  candidate_spot_count = 21,
}
-- register it with the game
data:extend({ lunaris_coal })

-- IRON AUTOPLACE

local lunaris_iron_ore = table.deepcopy(data.raw.resource["iron-ore"])

-- give it a new name so it doesn't conflict with the original
lunaris_iron_ore.name = "lunaris_iron-ore"

-- (optional) if you want it to drop the same item:
lunaris_iron_ore.minable = lunaris_iron_ore.minable or {}
lunaris_iron_ore.minable.result = "iron-ore"
lunaris_iron_ore.autoplace = resource_autoplace.resource_autoplace_settings{
  name = "lunaris_iron-ore",
  order = "b-c",
  base_density = 10,
  base_spots_per_km2 = 1.2,
  has_starting_area_placement = true,
  random_spot_size_minimum = 1,
  random_spot_size_maximum = 1,
  regular_rq_factor_multiplier  = 1.10,
  starting_rq_factor_multiplier = 1.5,
  candidate_spot_count = 22,
}
-- register it with the game
data:extend({ lunaris_iron_ore })

-- COPPER AUTOPLACE

local lunaris_copper_ore = table.deepcopy(data.raw.resource["copper-ore"])

-- give it a new name so it doesn't conflict with the original
lunaris_copper_ore.name = "lunaris_copper-ore"

-- (optional) if you want it to drop the same item:
lunaris_copper_ore.minable = lunaris_copper_ore.minable or {}
lunaris_copper_ore.minable.result = "copper-ore"
lunaris_copper_ore.autoplace = resource_autoplace.resource_autoplace_settings{
  name = "lunaris_copper-ore",
  order = "b-c",
  base_density = 8,
  base_spots_per_km2 = 1.2,
  has_starting_area_placement = true,
  random_spot_size_minimum = 1,
  random_spot_size_maximum = 1,
  regular_rq_factor_multiplier  = 1.10,
  starting_rq_factor_multiplier = 1.2,
  candidate_spot_count = 22,
}
-- register it with the game
data:extend({ lunaris_copper_ore })

-- STONE AUTOPLACE

local lunaris_stone = table.deepcopy(data.raw.resource["stone"])

-- give it a new name so it doesn't conflict with the original
lunaris_stone.name = "lunaris_stone"

-- (optional) if you want it to drop the same item:
lunaris_stone.minable = lunaris_stone.minable or {}
lunaris_stone.minable.result = "stone"
lunaris_stone.autoplace = resource_autoplace.resource_autoplace_settings{
  name = "lunaris_stone",
  order = "b-c",
  base_density = 6,
  base_spots_per_km2 = 1.2,
  has_starting_area_placement = true,
  random_spot_size_minimum = 1,
  random_spot_size_maximum = 1,
  regular_rq_factor_multiplier  = 1.10,
  starting_rq_factor_multiplier = 1.2,
  candidate_spot_count = 22,
}
-- register it with the game
data:extend({ lunaris_stone })

-- STONE AUTOPLACE

local lunaris_crude_oil = table.deepcopy(data.raw.resource["crude-oil"])

-- give it a new name so it doesn't conflict with the original
lunaris_crude_oil.name = "lunaris_crude-oil"

-- (optional) if you want it to drop the same item:
lunaris_crude_oil.minable = lunaris_crude_oil.minable or {}
lunaris_crude_oil.minable.result = "crude-oil"
lunaris_crude_oil.autoplace = resource_autoplace.resource_autoplace_settings{
  name = "lunaris_crude-oil",
  order = "c",
  base_density = 8.2,
  base_spots_per_km2 = 1.8,
  has_starting_area_placement = false,
  random_spot_size_minimum = 1,
  random_spot_size_maximum = 1,
  regular_rq_factor_multiplier  = 1,
  additional_richness = 220000,
  candidate_spot_count = 22,
  random_probability = 1/48,
}
-- register it with the game
data:extend({ lunaris_crude_oil })
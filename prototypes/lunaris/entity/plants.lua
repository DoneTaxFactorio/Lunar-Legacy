local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local seconds = 60
local minutes = 60*seconds

local plant_emissions = { pollution = -0.001 }
local plant_harvest_emissions = { spores = 15 }
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}

local gleba_tree_static_influence = -0.8
local gleba_tree_probability_multiplier = 0.3

local leaf_sound = sounds.tree_leaves
local spoilage_sound = sound_variations("__space-age__/sound/mining/spoilage", 3, 0) --at zero vol until the correct particle fx are in place

local function tree_stateless_visualisation(positions)
  -- high intensity so overlapping doesn't have much effect
  -- low max brightness to keep effect restrained.
  local max_brightness = 0.4
  return
  {
    min_count = 1,
    max_count = 2,
    offset_x = { -0.05, 0.05 }, -- will be random from range -0.05 to 0.05
    offset_y = { -0.05, 0.05 },
    positions = positions,

    render_layer = "object",
    adjust_animation_speed_by_base_scale = true,
    scale = { 0.2, 0.6 },

    light =
    {
      intensity = 0.7,
      size = 32,
      color = {0.5 * max_brightness, 0.75 * max_brightness, 1 * max_brightness},
      flicker_interval = 90,
      flicker_min_modifier = 0.8,
      flicker_max_modifier = 1.2,
      offset_flicker = true
    },
  }
end
local function make_offsets_on_tree(origin_x, origin_y, pixel_coords)
  local result = {}
  for i,coord in pairs(pixel_coords) do
    table.insert(result, { (coord[1] - origin_x) / 64, (coord[2] - origin_y) / 64 }) -- assumes high res -> 64 pixels per tile
  end
  return result
end

local leaf_sound_trigger =
{
  {
    type = "play-sound",
    sound = leaf_sound,
    damage_type_filters = "fire"
  }
}

local spoilage_sound_trigger =
{
  {
    type = "play-sound",
    sound = spoilage_sound,
    damage_type_filters = "fire"
  }
}

local function plant_autoplace3(options)
  return
  {
    control = options.control or "lunaris_plants",
    order = "a[tree]-b[forest]",
    tile_restriction = options.tile_restriction,
    probability_expression = "clamp((" .. (options.static_influence or -0.5) .. " + plants_noise) * control:plants:size, 0, 1)\z
                              * " .. (options.probability_multiplier or 0.5),
    richness_expression = "random_penalty_at(".. (options.max_richness or 3).. ", 1)",
    local_expressions = options.local_expressions
  }
end

local gleba_tree_underwater_things =
{
  --[[
  -- hack for testing the implementation
  ["hairyclubnub"] =
  {
    underwater =
    {
      layers = {
          util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-pylon/elevated-rail-pylon-underwater",
                           {
                             frame_count = 1,
                             scale = 0.25
                           })
        }
    },
    water_reflection =
    {
      pictures = util.sprite_load("__elevated-rails__/graphics/entity/elevated-rail-pylon/elevated-rail-pylon-reflection",
                                  {
                                    priority = "extra-high",
                                    variation_count = 1,
                                    scale = 0.25
                                  }),
      rotate = false,
    }
  }
  --]]
}

--[[
-- hack for testing the scaling during growth
gleba_tree_underwater_things["yumako-tree"] = gleba_tree_underwater_things["hairyclubnub"]
--]]

local function gleba_tree_variations(name, variation_count, per_row, scale_multiplier, width, height, shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local width = width or 640
  local height = height or 560
  local variations = {}
  local shift = shift or util.by_pixel(52, -40)
  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        filename = "__lunaris_graphics__/graphics/entity/plant/"..name.."/"..name.."-trunk.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = "__lunaris_graphics__/graphics/entity/plant/"..name.."/"..name.."-harvest.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = "__lunaris_graphics__/graphics/entity/plant/"..name.."/"..name.."-normal.png",
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        flags = { "mipmap", "shadow" },
        surface = "gleba",
        filenames =
        {
          "__lunaris_graphics__/graphics/entity/plant/"..name.."/"..name.."-harvest-shadow.png",
          "__lunaris_graphics__/graphics/entity/plant/"..name.."/"..name.."-shadow.png"
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      underwater       = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].underwater or nil,
      water_reflection = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].water_reflection or nil,

      leaf_generation =
      {
        type = "create-particle",
        particle_name = "leaf-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_vertical_speed = 0.01,
        initial_height_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.01
      },
      branch_generation =
      {
        type = "create-particle",
        particle_name = "branch-particle",
        offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
        initial_height = 2,
        initial_height_deviation = 2,
        initial_vertical_speed = 0.01,
        speed_from_center = 0.03,
        speed_from_center_deviation = 0.01,
        frame_speed = 0.4,
        repeat_count = 15
      }
    }
    if(name == "stingfrond") then
      variation.leaves =
      {
        layers =
        {
          variation.leaves,
          {
            filename = "__space-age__/graphics/entity/plant/"..name.."/"..name.."-harvest-glow.png",
            flags = { "mipmap" },
            surface = "gleba",
            width = width,
            height = height,
            x = x,
            y = y,
            frame_count = 1,
            shift = shift,
            scale = 0.33 * scale_multiplier,
            draw_as_light = true
          }
        }
      }
    end
    table.insert(variations, variation)
  end
  return variations
end

local function lerp_color(a, b, amount)
  return {
    r = a.r + (b.r - a.r) * amount,
    g = a.g + (b.g - a.g) * amount,
    b = a.b + (b.b - a.b) * amount
  }
end

local function lerp_colors(a_set, b, amount)
  local new_colors = {}
  for i, a in pairs(a_set) do
    new_colors[i] = lerp_color(a, b, amount)
  end
  return new_colors
end

local function minor_tints() -- Only for leaves where most if the colour is baked in.
  return {
    {r = 255, g = 255, b =  255},
    {r = 220, g = 255, b =  255},
    {r = 255, g = 220, b =  255},
    {r = 255, g = 255, b =  220},
    {r = 220, g = 220, b =  255},
    {r = 255, g = 220, b =  220},
    {r = 220, g = 255, b =  220},
  }
end

data:extend(
{
  {
    type = "noise-expression",
    name = "plants_noise",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.3, seed0 = map_seed, seed1 = 700000, octaves = 3, input_scale = 1/40 * control:lunaris_plants:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.3, seed0 = map_seed, seed1 = 400000, octaves = 3, input_scale = 1/10 * control:lunaris_plants:frequency })"
  },
  {
    type = "noise-expression",
    name = "plants_noise_b",
    expression = "abs(multioctave_noise{x = x, y = y, persistence = 0.3, seed0 = map_seed, seed1 = 750000, octaves = 3, input_scale = 1/40 * control:lunaris_plants:frequency }\z
                      * multioctave_noise{x = x, y = y, persistence = 0.3, seed0 = map_seed, seed1 = 400000, octaves = 3, input_scale = 1/10 * control:lunaris_plants:frequency })"
  },
  {
    type = "plant",
    name = "lunaris_yumako-tree", -- food
    icon = "__space-age__/graphics/icons/yumako-tree.png",
    flags = plant_flags,
    map_color = {179, 234, 240},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results = {{type = "item", name = "yumako", amount = 50}},
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = leaf_sound_trigger
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 5 * minutes,
    harvest_emissions = plant_harvest_emissions,
    emissions_per_second = plant_emissions,
    max_health = 50,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    --collision_mask = {layers={player=true, ground_tile=true, train=true}},
    selection_box = {{-1, -3}, {1, 0.8}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c[gleba]-a[seedable]-a[yumako-tree]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_yumako_tree,
    autoplace =
    {
      control = "lunaris_plants",
      order = "a[tree]-b[forest]-a",
      -- trees only appear where plants_noise is high (creates patches),
      -- and overall density is reduced to 20%
      probability_expression =
        "clamp((plants_noise - 0.75) * control:lunaris_plants:size, 0, 1) * 0.3",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {}
    },
    variations = gleba_tree_variations("yumako-tree", 8, 4, 1.3, 640, 560, util.by_pixel(52, -73)),
    colors = minor_tints(),
    agricultural_tower_tint =
    {
      primary = {r = 0.552, g = 0.218, b = 0.218, a = 1.000}, -- #8c3737ff
      secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
    },
    -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-yumako-soil", "artificial-yumako-soil"}, remove_on_collision = true} },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/yumako-tree", 6, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.2,
      average_pause_seconds = 8
    },
  },
})
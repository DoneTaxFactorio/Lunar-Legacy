
if not hit_effects_loaded then
  hit_effects_loaded = true
  data:extend
  {
    {
      type = "explosion",
      name = "spark-explosion",
      flags = {"not-on-map"},
      hidden = true,
      icons =
      {
        {
          icon = "__base__/graphics/icons/small-electric-pole.png",
          tint = {1,0.5,0.5,1}
        }
      },
      order = "a-b-a",
      subgroup = "hit-effects",
      height = 1,
      animations =
      {
        util.empty_sprite()
      },
      created_effect =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-particle",
              repeat_count = 2,
              affects_target = false,
              particle_name = "spark-particle",
              offsets =
              {
                { 0.07031, 0.2031 },
                { -0.02344, 0.07813 }
              },
              offset_deviation = { { -0.09766, -0.09766 }, { 0.09766, 0.09766 } },
              show_in_tooltip = false,
              initial_height = 1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.05,
              frame_speed = 0.5,
              frame_speed_deviation = 0
            },
            {
              type = "create-particle",
              repeat_count = 1,
              affects_target = false,
              particle_name = "spark-particle-debris",
              offsets =
              {
                { 0.07031, 0.2031 },
                { -0.02344, 0.07813 }
              },
              offset_deviation = { { -0.09766, -0.09766 }, { 0.09766, 0.09766 } },
              show_in_tooltip = false,
              initial_height = 1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.05,
              frame_speed = 0.5,
              frame_speed_deviation = 0
            }
          }
        }
      }
    },

    {
      type = "explosion",
      name = "spark-explosion-higher",
      flags = {"not-on-map"},
      hidden = true,
      icons = {
        {
          icon = "__base__/graphics/icons/big-electric-pole.png",
          tint = {1,0.5,0.5,1}
        }
      },
      order = "a-b-b",
      subgroup = "hit-effects",
      height = 1.5,
      animations =
      {
        util.empty_sprite()
      },
      created_effect =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-particle",
              repeat_count = 2,
              affects_target = false,
              particle_name = "spark-particle",
              offsets =
              {
                { 0.07031, 0.2031 },
                { -0.02344, 0.07813 }
              },
              offset_deviation = { { -0.09766, -0.09766 }, { 0.09766, 0.09766 } },
              show_in_tooltip = false,
              initial_height = 1.5,
              initial_height_deviation = 0.2,
              initial_vertical_speed = 0,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.05,
              frame_speed = 0.5,
              frame_speed_deviation = 0
            },
            {
              type = "create-particle",
              repeat_count = 1,
              affects_target = false,
              particle_name = "spark-particle-debris",
              offsets =
              {
                { 0.07031, 0.2031 },
                { -0.02344, 0.07813 }
              },
              offset_deviation = { { -0.09766, -0.09766 }, { 0.09766, 0.09766 } },
              show_in_tooltip = false,
              initial_height = 1.5,
              initial_height_deviation = 0.2,
              initial_vertical_speed = 0,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.05,
              frame_speed = 0.5,
              frame_speed_deviation = 0
            }
          }
        }
      }
    },

    {
      type = "explosion",
      name = "wall-damaged-explosion",
      flags = {"not-on-map"},
      hidden = true,
      subgroup = "hit-effects",
      icons =
      {
        {
          icon = "__base__/graphics/icons/wall.png",
          tint = {1,0.5,0.5,1}
        }
      },
      order = "a-c-a",
      height = 1,
      animations =
      {
        util.empty_sprite()
      },
      created_effect =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-particle",
              repeat_count = 2,
              affects_target = false,
              particle_name = "wall-stone-particle-small",
              offsets =
              {
                { 0.07031, 0.2031 },
                { -0.02344, 0.07813 }
              },
              offset_deviation = { { -0.09766, -0.09766 }, { 0.09766, 0.09766 } },
              show_in_tooltip = false,
              initial_height = 1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.05,
              frame_speed = 0.5,
              frame_speed_deviation = 0
            }
          }
        }
      }
    },

    {
      type = "explosion",
      name = "rock-damaged-explosion",
      icons =
      {
        {
          icon = "__base__/graphics/icons/big-rock.png",
          tint = {1,0.5,0.5,1}
        }
      },
      order = "a-d-a",
      flags = {"not-on-map"},
      hidden = true,
      subgroup = "hit-effects",
      height = 1,
      animations =
      {
        util.empty_sprite()
      },
      created_effect =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-particle",
              repeat_count = 2,
              affects_target = false,
              particle_name = "rock-damage-stone-particle-tiny",
              offsets =
              {
                { 0.07031, 0.2031 },
                { -0.02344, 0.07813 }
              },
              offset_deviation = { { -0.09766, -0.09766 }, { 0.09766, 0.09766 } },
              show_in_tooltip = false,
              initial_height = 1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.05,
              frame_speed = 0.5,
              frame_speed_deviation = 0
            },
            {
              type = "create-particle",
              repeat_count = 1,
              affects_target = false,
              particle_name = "rock-damage-stone-particle-small",
              offsets =
              {
                { 0.07031, 0.2031 },
                { -0.02344, 0.07813 }
              },
              offset_deviation = { { -0.09766, -0.09766 }, { 0.09766, 0.09766 } },
              show_in_tooltip = false,
              initial_height = 1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.05,
              frame_speed = 0.5,
              frame_speed_deviation = 0
            },
            {
              type = "create-particle",
              repeat_count = 2,
              affects_target = false,
              particle_name = "rock-damage-stone-particle-medium",
              offsets =
              {
                { 0.07031, 0.2031 }
              },
              offset_deviation = { { -0.09766, -0.09766 }, { 0.09766, 0.09766 } },
              show_in_tooltip = false,
              initial_height = 1,
              initial_height_deviation = 0.5,
              initial_vertical_speed = 0,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.05,
              frame_speed = 0.5,
              frame_speed_deviation = 0
            }
          }
        }
      }
    },

    {
      type = "explosion",
      name = "enemy-damaged-explosion",
      icons =
      {
        {
          icon = "__base__/graphics/icons/small-biter.png",
          tint = {1,0.5,0.5,1}
        }
      },
      flags = {"not-on-map"},
      hidden = true,
      subgroup = "hit-effects",
      order = "a-a-a",
      height = 0.3,
      animations =
      {
        util.empty_sprite()
      },
      created_effect =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "blood-fountain-hit-spray",
              repeat_count = 1
            },
            --[[{
              type = "create-particle",
              repeat_count = 2,
              affects_target = false,
              particle_name = "blood-particle",
              offsets =
              {
                { 0.07031, 0.2031 },
                { -0.02344, 0.07813 }
              },
              offset_deviation = { { -0.09766, -0.09766 }, { 0.09766, 0.09766 } },
              show_in_tooltip = false,
              initial_height = 0.3,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.1,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.05,
              frame_speed = 0.5,
              frame_speed_deviation = 0
            },
            {
              type = "create-particle",
              repeat_count = 2,
              affects_target = false,
              particle_name = "blood-particle-lower-layer",
              offsets =
              {
                { 0.07031, 0.2031 },
                { -0.02344, 0.07813 }
              },
              offset_deviation = { { -0.09766, -0.09766 }, { 0.09766, 0.09766 } },
              show_in_tooltip = false,
              initial_height = 0.3,
              initial_height_deviation = 0.1,
              initial_vertical_speed = 0.1,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.01,
              speed_from_center_deviation = 0.05,
              frame_speed = 0.5,
              frame_speed_deviation = 0
            },]]
          }
        }
      }
    },
    {
      type = "explosion",
      name = "flying-robot-damaged-explosion",
      icons =
      {
        {
          icon = "__base__/graphics/icons/construction-robot.png",
          tint = {1,0.5,0.5,1}
        }
      },
      order = "a-c-b",
      flags = {"not-on-map"},
      hidden = true,
      subgroup = "hit-effects",
      height = 0.3,
      animations =
      {
        util.empty_sprite()
      },
      created_effect =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-particle",
              particle_name = "spark-particle",
              tail_length = 10,
              tail_length_deviation = 5,
              tail_width = 5,
              probability = 1,
              initial_height = 1.5,
              initial_vertical_speed = 0.05,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.05,
              speed_from_center_deviation = 0.05,
              offset_deviation = {{-0.05, -0.05},{0.05, 0.05}}
            },
            {
              type = "create-particle",
              particle_name = "flying-robot-damaged-explosion-particle",
              tail_length = 3,
              tail_length_deviation = 1,
              tail_width = 5,
              probability = 0.5,
              initial_height = 1.5,
              initial_vertical_speed = 0.05,
              initial_vertical_speed_deviation = 0.02,
              speed_from_center = 0.02,
              speed_from_center_deviation = 0.01,
              offset_deviation = {{-0.05, -0.05},{0.05, 0.05}}
            }
          }
        }
      }
    }
  }

end

local hit_effects = {}

function hit_effects.entity(offset_deviation, offset)
  local offset = offset or {0, 1}
  return
  {
    type = "create-entity",
    entity_name = "spark-explosion",
    offset_deviation = offset_deviation or {{-0.5, -0.5}, {0.5, 0.5}},
    offsets = {offset},
    damage_type_filters = "fire"
  }
end

function hit_effects.entity_higher(offset_deviation, offset)
  local offset = offset or {0, 1.5}
  return
  {
    type = "create-entity",
    entity_name = "spark-explosion-higher",
    offset_deviation = offset_deviation or {{-0.5, -0.5}, {0.5, 0.5}},
    offsets = {offset},
    damage_type_filters = "fire"
  }
end

function hit_effects.wall(offset_deviation, offset)
  local offset = offset or {0, 1}
  return
  {
    type = "create-entity",
    entity_name = "wall-damaged-explosion",
    offset_deviation = offset_deviation or {{-0.5, -0.5}, {0.5, 0.5}},
    offsets = {offset},
    damage_type_filters = "fire"
  }
end

function hit_effects.biter(offset_deviation, offset)
  local offset = offset or {0, 0}
  return
  {
    type = "create-entity",
    entity_name = "enemy-damaged-explosion",
    offset_deviation = offset_deviation or {{-0.5, -0.5}, {0.5, 0.5}},
    offsets = {offset},
    damage_type_filters = "fire"
  }
end

function hit_effects.rock(offset_deviation, offset)
  local offset = offset or {0, 1}
  return
  {
    type = "create-entity",
    entity_name = "rock-damaged-explosion",
    offset_deviation = offset_deviation or {{-0.5, -0.5}, {0.5, 0.5}},
    offsets = {offset},
    damage_type_filters = "fire"
  }
end

function hit_effects.flying_robot(offset_deviation, offset)
  local offset = offset or {0, 0}
  return
  {
    type = "create-entity",
    entity_name = "flying-robot-damaged-explosion",
    offset_deviation = offset_deviation or {{-0.25, -0.25},{0.25, 0.25}},
    offsets = {offset},
    damage_type_filters = "fire"
  }
end

return hit_effects

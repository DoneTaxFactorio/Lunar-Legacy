local planet_map_gen = require("prototypes/crystara/planet/planet-map-gen")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

data:extend(
{
  {
    type = "planet",
    name = "crystara",
    icon = "__crystara_graphics__/graphics/icons/crystara.png",
    starmap_icon = "__crystara_graphics__/graphics/icons/starmap-planet-crystara.png",
    starmap_icon_size = 512,
    gravity_pull = 20,
    distance = 20, --how far away the planet is from the center
    orientation = 0.52,
    magnitude = 1.2,
    order = "b[crystara]",
    subgroup = "planets",
    map_seed_offset = 0,
    map_gen_settings = planet_map_gen.crystara(),
    pollutant_type = nil,
    solar_power_in_space = 500,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    surface_properties =
    {
      ["day-night-cycle"] = 2 * minute,
      ["magnetic-field"] = 25,
      ["solar-power"] = 400,
      pressure = 4000,
      gravity = 40
    },
  },
  {
    type = "space-connection",
    name = "lunaris-crystara",
    icon = "__crystara_graphics__/graphics/icons/crystara.png",
    subgroup = "planet-connections",
    from = "lunaris",
    to = "crystara",
    order = "a",
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
  
})

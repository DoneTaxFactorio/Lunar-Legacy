local planet_map_gen = require("prototypes/lunaris/planet/planet-map-gen")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

data:extend(
{
  {
    type = "planet",
    name = "lunaris",
    icon = "__lunaris_graphics__/graphics/icons/lunaris.png",
    starmap_icon = "__lunaris_graphics__/graphics/icons/starmap-planet-lunaris.png",
    starmap_icon_size = 512,
    gravity_pull = 20,
    distance = 25, --how far away the planet is from the center
    orientation = 0.55,
    magnitude = 3,
    label_orientation = 0.3,
    order = "b[lunaris]",
    subgroup = "planets",
    map_seed_offset = 0,
    map_gen_settings = planet_map_gen.lunaris(),
    pollutant_type = "pollution",
    solar_power_in_space = 80,
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
      ["day-night-cycle"] = 4 * minute,
      ["magnetic-field"] = 80,
      ["solar-power"] = 40,
      pressure = 4000,
      gravity = 80
    },
  },
  {
    type = "space-connection",
    name = "lunaris-nauvis",
    icon = "__lunaris_graphics__/graphics/icons/lunaris.png",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "lunaris",
    order = "a",
    length = 120000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
  
})

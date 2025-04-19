data:extend
({
  {
    type = "technology",
    name = "planet-discovery-crymora",
    icons = util.technology_icon_constant_planet("__crymora_graphics__/graphics/technology/crymora_tech.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "crymora",
        use_icon_overlay_constant = true
      }
    },
    prerequisites = {"space-platform-thruster"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 60
    }
  },
})
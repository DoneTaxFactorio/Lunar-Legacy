local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
  type = "item",
  name = "rubarion_rubacite",
  icon = "__rubarion_graphics__/graphics/icons/rubacite.png",
  pictures =
  {
    { size = 64, filename = "__rubarion_graphics__/graphics/icons/rubacite.png",   scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__rubarion_graphics__/graphics/icons/rubacite-1.png", scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__rubarion_graphics__/graphics/icons/rubacite-2.png", scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__rubarion_graphics__/graphics/icons/rubacite-3.png", scale = 0.5, mipmap_count = 4 }
  },
  subgroup = "vulcanus-processes",
  order = "a[melting]-a[calcite]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  default_import_location = "rubarion",
  weight = 2*kg
  },
})

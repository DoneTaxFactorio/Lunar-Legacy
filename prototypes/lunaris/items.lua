local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
  type = "item",
  name = "lunaris_lunore",
  icon = "__lunaris_graphics__/graphics/icons/lunore.png",
  pictures =
  {
    { size = 64, filename = "__lunaris_graphics__/graphics/icons/lunore.png",   scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__lunaris_graphics__/graphics/icons/lunore-1.png", scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__lunaris_graphics__/graphics/icons/lunore-2.png", scale = 0.5, mipmap_count = 4 },
    { size = 64, filename = "__lunaris_graphics__/graphics/icons/lunore-3.png", scale = 0.5, mipmap_count = 4 }
  },
  subgroup = "vulcanus-processes",
  order = "a[melting]-a[calcite]",
  inventory_move_sound = item_sounds.resource_inventory_move,
  pick_sound = item_sounds.resource_inventory_pickup,
  drop_sound = item_sounds.resource_inventory_move,
  stack_size = 50,
  default_import_location = "lunaris",
  weight = 6.6666666666666666666667*kg
  },
})

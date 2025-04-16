data:extend({
  
  {
    type = "autoplace-control",
    name = "lunaris_cliff",
    order = "c-z",
    category = "cliff"
  },
  {
    type = "autoplace-control",
    name = "lunaris-enemy-base",
    order = "b-z",
    category = "enemy"
  },
  {
    type = "autoplace-control",
    name = "lunaris_lunore",
    order = "b-z",
    category = "resource",
    localised_name = {"", "[entity=lunaris_lunore] ", {"entity-name.lunaris_lunore"}},
    richness = true,
  },
  {
    type = "autoplace-control",
    name = "lunaris_rocks",
    order = "c-y",
    category = "terrain",
    can_be_disabled = false
  },
  {
    type = "autoplace-control",
    name = "lunaris_plants",
    order = "c-z-c",
    category = "terrain",
    can_be_disabled = false
  },
  {
    type = "autoplace-control",
    name = "iron-ore",
    localised_name = {"", "[entity=iron-ore] ", {"entity-name.iron-ore"}},
    richness = true,
    order = "a-a",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "copper-ore",
    localised_name = {"", "[entity=copper-ore] ", {"entity-name.copper-ore"}},
    richness = true,
    order = "a-b",
    category = "resource"
  },
  {
    type = "autoplace-control",
    name = "lunaris_trees",  -- dein eigener Name
    richness = true,
    order = "a[tree]-b[lunaris_trees]",
    category = "terrain"  -- oder "terrain" für nicht-Ressourcen
  }
}
)

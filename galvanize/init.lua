--[[
=====================================================================
** Galvanize **
A mod by Kaedraar and Vannflyhite
Great for using up some of that pesky extra zinc you've got laying
around!

Copyright © 2020 Henry Corse and contributors.
Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.
See LICENSE for more information.
=====================================================================
--]]

galvanize = {}

-- Register our items with minetest
-- Galvanized Iron!
minetest.register_craftitem("galvanize:galvanized_iron_ingot", {
  description = "Galvanized Iron Ingot",
  inventory_image = "galvanize_galvanized_iron_ingot.png"
})
-- Galvanized Steel!
minetest.register_craftitem("galvanize:galvanized_steel_ingot", {
  description = "Galvanized Steel Ingot",
  inventory_image = "galvanize_galvanized_steel_ingot.png"
})

-- Register our alloy recipes
-- Galvanized Iron from ingots
technic.register_alloy_recipe({
  input = {"technic:wrought_iron_ingot", "technic:zinc_ingot"},
  output = "galvanize:galvanized_iron_ingot", time = 4
})
-- Galvanized Iron from dusts
technic.register_alloy_recipe({
  input = {"technic:wrought_iron_dust", "technic:zinc_dust"},
  output = "galvanize:galvanized_iron_ingot", time = 4
})
-- Galvanized Steel from ingots
technic.register_alloy_recipe({
  input = {"technic:carbon_steel_ingot", "technic:zinc_ingot"},
  output = "galvanize:galvanized_steel_ingot", time = 6
})
-- Galvanized Steel from dusts
technic.register_alloy_recipe({
  input = {"technic:carbon_steel_dust", "technic:zinc_dust"},
  output = "galvanize:galvanized_steel_ingot", time = 6
})

-- Returns the crafting recipe table for a given material and item.
local function get_recipe(material, item)
  if item == "sword" then
    return {
      {material},
      {material},
      {"group:stick"},
    }
  end
  if item == "shovel" then
    return {
      {material},
      {"group:stick"},
      {"group:stick"},
    }
  end
  if item == "axe" then
    return {
      {material, material},
      {material, "group:stick"},
      {"", "group:stick"},
    }
  end
  if item == "pick" then
    return {
      {material, material, material},
      {"", "group:stick", ""},
      {"", "group:stick", ""},
    }
  end
end

-- Register how to make Tools out of this stuff
-- Galvanized Iron Tools
local galv_iron = "galvanize:galvanized_iron_ingot"
minetest.register_craft({
  output = "galvanize:galvanized_iron_pick",
  recipe = get_recipe(galv_iron, "pick")
})
minetest.register_tool("galvanize:galvanized_iron_pick", {
  description = "Galvanized Iron Pick",
  inventory_image = "galvanize_galvanized_iron_pick.png",
  tool_capabilities = {
    full_punch_interval = 1.0,
    max_drop_level=1,
    groupcaps={
      cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=35, maxlevel=2},
    },
    damage_groups = {fleshy=4},
  },
  sound = {breaks = "default_tool_breaks"},
  groups = {pickaxe = 1}
})
minetest.register_craft({
  output = "galvanize:galvanized_iron_shovel",
  recipe = get_recipe(galv_iron, "shovel")
})
minetest.register_tool("galvanize:galvanized_iron_shovel", {
  description = "Galvanized Iron Shovel",
  inventory_image = "galvanize_galvanized_iron_shovel.png",
  wield_image = "galvanize_galvanized_iron_shovel.png^[transformR90",
  tool_capabilities = {
    full_punch_interval = 1.1,
    max_drop_level=1,
    groupcaps={
      crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=45, maxlevel=2},
    },
    damage_groups = {fleshy=3},
  },
  sound = {breaks = "default_tool_breaks"},
  groups = {shovel = 1}
})
minetest.register_craft({
  output = "galvanize:galvanized_iron_axe",
  recipe = get_recipe(galv_iron, "axe")
})
minetest.register_tool("galvanize:galvanized_iron_axe", {
  description = "Galvanized Iron Axe",
  inventory_image = "galvanize_galvanized_iron_axe.png",
  tool_capabilities = {
    full_punch_interval = 1.0,
    max_drop_level=1,
    groupcaps={
      choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=35, maxlevel=2},
    },
    damage_groups = {fleshy=4},
  },
  sound = {breaks = "default_tool_breaks"},
  groups = {axe = 1}
})
minetest.register_craft({
  output = "galvanize:galvanized_iron_sword",
  recipe = get_recipe(galv_iron, "sword")
})
minetest.register_tool("galvanize:galvanized_iron_sword", {
  description = "Galvanized Iron Sword",
  inventory_image = "galvanize_galvanized_iron_sword.png",
  tool_capabilities = {
    full_punch_interval = 0.8,
    max_drop_level=1,
    groupcaps={
      snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=45, maxlevel=2},
    },
    damage_groups = {fleshy=6},
  },
  sound = {breaks = "default_tool_breaks"},
  groups = {sword = 1}
})

-- Galvanized Steel Tools
local galv_steel = "galvanize:galvanized_steel_ingot"
minetest.register_craft({
  output = "galvanize:galvanized_steel_pick",
  recipe = get_recipe(galv_steel, "pick")
})
minetest.register_tool("galvanize:galvanized_steel_pick", {
  description = "Galvanized Steel Pick",
  inventory_image = "galvanize_galvanized_steel_pick.png",
  tool_capabilities = {
    full_punch_interval = 1.0,
    max_drop_level=1,
    groupcaps={
      cracky = {times={[1]=4.00, [2]=1.60, [3]=0.80}, uses=50, maxlevel=2},
    },
    damage_groups = {fleshy=4},
  },
  sound = {breaks = "default_tool_breaks"},
  groups = {pickaxe = 1}
})
minetest.register_craft({
  output = "galvanize:galvanized_steel_shovel",
  recipe = get_recipe(galv_steel, "shovel")
})
minetest.register_tool("galvanize:galvanized_steel_shovel", {
  description = "Galvanized Steel Shovel",
  inventory_image = "galvanize_galvanized_steel_shovel.png",
  wield_image = "galvanize_galvanized_steel_shovel.png^[transformR90",
  tool_capabilities = {
    full_punch_interval = 1.1,
    max_drop_level=1,
    groupcaps={
      crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=60, maxlevel=2},
    },
    damage_groups = {fleshy=3},
  },
  sound = {breaks = "default_tool_breaks"},
  groups = {shovel = 1}
})
minetest.register_craft({
  output = "galvanize:galvanized_steel_axe",
  recipe = get_recipe(galv_steel, "axe")
})
minetest.register_tool("galvanize:galvanized_steel_axe", {
  description = "Galvanized Steel Axe",
  inventory_image = "galvanize_galvanized_steel_axe.png",
  tool_capabilities = {
    full_punch_interval = 1.0,
    max_drop_level=1,
    groupcaps={
      choppy={times={[1]=2.50, [2]=1.40, [3]=1.00}, uses=50, maxlevel=2},
    },
    damage_groups = {fleshy=4},
  },
  sound = {breaks = "default_tool_breaks"},
  groups = {axe = 1}
})
minetest.register_craft({
  output = "galvanize:galvanized_steel_sword",
  recipe = get_recipe(galv_steel, "sword")
})
minetest.register_tool("galvanize:galvanized_steel_sword", {
  description = "Galvanized Steel Sword",
  inventory_image = "galvanize_galvanized_steel_sword.png",
  tool_capabilities = {
    full_punch_interval = 0.8,
    max_drop_level=1,
    groupcaps={
      snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=60, maxlevel=2},
    },
    damage_groups = {fleshy=6},
  },
  sound = {breaks = "default_tool_breaks"},
  groups = {sword = 1}
})

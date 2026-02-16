-- local function remove_item (name)
--     data.raw.item[name] = nil
--     data.raw.recipe[name] = nil
-- end

local function add_prerequisite (techno, req)
    table.insert(data.raw.technology[techno].prerequisites, req)
end

local function remove_prerequisite(techno, req)
    for i, requirement in pairs(data.raw.technology[techno].prerequisites) do
        if requirement.name == req then
            table.remove(data.raw.technology[techno].prerequisites, i)
        end
    end
--     table.remove(data.raw.technology[techno].prerequisites, req)
end

local function add_ingredient (recipe, item)
    table.insert(data.raw.recipe[recipe].ingredients, item)
end

local function remove_ingredient (recipe, item)
    for i, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
        if ingredient.name == item then
            table.remove(data.raw.recipe[recipe].ingredients, i)
        end
    end
end

-- local function remove_tech_ingredient (tech, item)
--     for i, ingredient in pairs(unit) do
--         if ingredient.name == item then
--             table.remove(unit, i)
--         end
--     end
-- end

add_prerequisite("kr-steel-fluid-tanks", "fluid-handling")
remove_prerequisite("kr-steel-fluid-tanks", "kr-steel-fluid-handling")
add_ingredient("kr-big-storage-tank", { type = "item", name = "pipe", amount = 8 })
remove_ingredient("kr-big-storage-tank", "kr-steel-pipe")
add_ingredient("kr-huge-storage-tank", { type = "item", name = "pipe", amount = 24 })
remove_ingredient("kr-huge-storage-tank", "kr-steel-pipe")
add_ingredient("kr-advanced-chemical-plant", { type = "item", name = "pipe", amount = 20 })
remove_ingredient("kr-advanced-chemical-plant", "kr-steel-pipe")
add_ingredient("kr-matter-plant", { type = "item", name = "pipe", amount = 20 })
remove_ingredient("kr-matter-plant", "kr-steel-pipe")
add_ingredient("kr-matter-associator", { type = "item", name = "pipe", amount = 8 })
remove_ingredient("kr-matter-associator", "kr-steel-pipe")
-- remove_item("kr-steel-pipe")
-- remove_item("kr-steel-underground-pipe")
-- remove_item("kr-steel-pump")

data.raw.technology["kr-steel-fluid-tanks"].unit = { time = 30, count = 120, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } } }
data.raw.technology["kr-gas-power-station"].unit = { time = 30, count = 250, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } } }
data.raw.technology["kr-fuel"].unit = { time = 45, count = 125, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } } }
data.raw.technology["kr-silicon-processing"].unit = { time = 30, count = 125, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 } } }
data.raw.technology["kr-advanced-lab"].unit = { time = 30, count = 300, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } } }
data.raw.technology["kr-fluid-excess-handling"].unit = { time = 45, count = 150, ingredients = { { "kr-basic-tech-card", 1 }, { "automation-science-pack", 1 } } }

data.raw.technology["kr-steel-fluid-handling"].enabled= false

-- remove_tech_ingredient("kr-steel-fluid-tanks", "kr-basic-tech-card")
-- remove_tech_ingredient("kr-gas-power-station", "kr-basic-tech-card")
-- remove_tech_ingredient("kr-fuel", "kr-basic-tech-card")
-- remove_tech_ingredient("kr-silicon-processing", "kr-basic-tech-card")
-- remove_tech_ingredient("kr-advanced-lab", "kr-basic-tech-card")
-- remove_tech_ingredient("kr-flare-stack", "logistic-science-pack")

if mods["FluidMustFlow"] then
    add_prerequisite("ducts", "kr-steel-fluid-tanks")
    data.raw.technology["ducts"].unit = { time = 30, count = 75, ingredients = { { "automation-science-pack", 1 }, { "logistic-science-pack", 1 }, { "chemical-science-pack", 1 } } }
    add_ingredient("duct-cross", { type = "item", name = "steel-plate", amount = 4 })
    remove_ingredient("duct-cross", "iron-plate")
    add_ingredient("duct-curve", { type = "item", name = "steel-plate", amount = 4 })
    remove_ingredient("duct-curve", "iron-plate")
    add_ingredient("duct-small", { type = "item", name = "steel-plate", amount = 2 })
    remove_ingredient("duct-small", "iron-plate")
    add_ingredient("duct-t-junction", { type = "item", name = "steel-plate", amount = 4 })
    remove_ingredient("duct-t-junction", "iron-plate")
    add_ingredient("duct-underground", { type = "item", name = "steel-plate", amount = 30 })
    remove_ingredient("duct-underground", "iron-plate")
    add_ingredient("non-return-duct", { type = "item", name = "steel-plate", amount = 4 })
    remove_ingredient("non-return-duct", "iron-plate")
    add_ingredient("non-return-duct", { type = "item", name = "kr-steel-gear-wheel", amount = 2 })
    remove_ingredient("non-return-duct", "iron-gear-wheel")
    if data.raw.recipe["duct"] then
        add_ingredient("duct", { type = "item", name = "steel-plate", amount = 4 })
        remove_ingredient("duct", "iron-plate")
    end
    if data.raw.recipe["duct-long"] then
        add_ingredient("duct-long", { type = "item", name = "steel-plate", amount = 8 })
        remove_ingredient("duct-long", "iron-plate")
    end
end

if mods["pipe_plus"] then
    data.raw["pipe-to-ground"]["pipe-to-ground-2"].fluid_box.pipe_connections[2].max_underground_distance = 20
    data.raw["pipe-to-ground"]["pipe-to-ground-3"].fluid_box.pipe_connections[2].max_underground_distance = 20
end

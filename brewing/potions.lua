local modpath, S = ...

--minetest.register_craft({ output = "brewing:speed_sub2"; recipe = { {'','brewing:speed_sub3','dye:cyan'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:speed_sub1"; recipe = { {'','brewing:speed_sub2','dye:cyan'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:speed_add1"; recipe = { {'','brewing:speed_sub1','dye:cyan'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:speed_add1"; recipe = { {'','bucket:bucket_water','dye:cyan'}, {'','vessels:glass_bottle','dye:cyan'}, {'','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:speed_add2"; recipe = { {'','brewing:speed_add1','dye:cyan'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:speed_add3"; recipe = { {'','brewing:speed_add2','dye:cyan'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:speed_sub3"; recipe = { {'dye:cyan','brewing:speed_sub2',''}, {'dye:cyan','',''}, {'dye:cyan','',''}, }; })
--minetest.register_craft({ output = "brewing:speed_sub2"; recipe = { {'dye:cyan','brewing:speed_sub1',''}, {'dye:cyan','',''}, {'dye:cyan','',''}, }; })
--minetest.register_craft({ output = "brewing:speed_sub1"; recipe = { {'dye:cyan','bucket:bucket_water',''}, {'dye:cyan','vessels:glass_bottle',''}, {'dye:cyan','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:speed_sub1"; recipe = { {'dye:cyan','brewing:speed_add1',''}, {'dye:cyan','',''}, {'dye:cyan','',''}, }; })
--minetest.register_craft({ output = "brewing:speed_add1"; recipe = { {'dye:cyan','brewing:speed_add2',''}, {'dye:cyan','',''}, {'dye:cyan','',''}, }; })
--minetest.register_craft({ output = "brewing:speed_add2"; recipe = { {'dye:cyan','brewing:speed_add3',''}, {'dye:cyan','',''}, {'dye:cyan','',''}, }; })

--minetest.register_craft({ output = "brewing:antigravity_sub2"; recipe = { {'','brewing:antigravity_sub3','dye:violet'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:antigravity_sub1"; recipe = { {'','brewing:antigravity_sub2','dye:violet'}, {'','',''}, {'','',''}, }; }) 
--minetest.register_craft({ output = "brewing:antigravity_add1"; recipe = { {'','brewing:antigravity_sub1','dye:violet'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:antigravity_add1"; recipe = { {'','bucket:bucket_water','dye:violet'}, {'','vessels:glass_bottle','dye:violet'}, {'','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:antigravity_add2"; recipe = { {'','brewing:antigravity_add1','dye:violet'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:antigravity_add3"; recipe = { {'','brewing:antigravity_add2','dye:violet'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:antigravity_sub3"; recipe = { {'dye:violet','brewing:antigravity_sub2',''}, {'dye:violet','',''}, {'dye:violet','',''}, }; })
--minetest.register_craft({ output = "brewing:antigravity_sub2"; recipe = { {'dye:violet','brewing:antigravity_sub1',''}, {'dye:violet','',''}, {'dye:violet','',''}, }; })
--minetest.register_craft({ output = "brewing:antigravity_sub1"; recipe = { {'dye:violet','bucket:bucket_water',''}, {'dye:violet','vessels:glass_bottle',''}, {'dye:violet','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:antigravity_sub1"; recipe = { {'dye:violet','brewing:antigravity_add1',''}, {'dye:violet','',''}, {'dye:violet','',''}, }; })
--minetest.register_craft({ output = "brewing:antigravity_add1"; recipe = { {'dye:violet','brewing:antigravity_add2',''}, {'dye:violet','',''}, {'dye:violet','',''}, }; })
--minetest.register_craft({ output = "brewing:antigravity_add2"; recipe = { {'dye:violet','brewing:antigravity_add3',''}, {'dye:violet','',''}, {'dye:violet','',''}, }; })

--minetest.register_craft({ output = "brewing:jumping_sub2"; recipe = { {'','brewing:jumping_sub3','dye:yellow'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:jumping_sub1"; recipe = { {'','brewing:jumping_sub2','dye:yellow'}, {'','',''}, {'','',''}, }; }) 
--minetest.register_craft({ output = "brewing:jumping_add1"; recipe = { {'','brewing:jumping_sub1','dye:yellow'}, {'','',''}, {'','',''}, }; })
brewing.register_potioncraft{output = "brewing:jumping_add1", recipe = { {'brewing:magic_donut','',''}, {'','',''} } }
--minetest.register_craft({ output = "brewing:jumping_add2"; recipe = { {'','brewing:jumping_add1','dye:yellow'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:jumping_add3"; recipe = { {'','brewing:jumping_add2','dye:yellow'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:jumping_sub3"; recipe = { {'dye:yellow','brewing:jumping_sub2',''}, {'dye:yellow','',''}, {'dye:yellow','',''}, }; })
--minetest.register_craft({ output = "brewing:jumping_sub2"; recipe = { {'dye:yellow','brewing:jumping_sub1',''}, {'dye:yellow','',''}, {'dye:yellow','',''}, }; })
--minetest.register_craft({ output = "brewing:jumping_sub1"; recipe = { {'dye:yellow','bucket:bucket_water',''}, {'dye:yellow','vessels:glass_bottle',''}, {'dye:yellow','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:jumping_sub1"; recipe = { {'dye:yellow','brewing:jumping_add1',''}, {'dye:yellow','',''}, {'dye:yellow','',''}, }; })
--minetest.register_craft({ output = "brewing:jumping_add1"; recipe = { {'dye:yellow','brewing:jumping_add2',''}, {'dye:yellow','',''}, {'dye:yellow','',''}, }; })
--minetest.register_craft({ output = "brewing:jumping_add2"; recipe = { {'dye:yellow','brewing:jumping_add3',''}, {'dye:yellow','',''}, {'dye:yellow','',''}, }; })

--minetest.register_craft({ output = "brewing:air_sub2"; recipe = { {'','brewing:air_sub3','dye:green'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:air_sub1"; recipe = { {'','brewing:air_sub2','dye:green'}, {'','',''}, {'','',''}, }; }) 
--minetest.register_craft({ output = "brewing:air_add1"; recipe = { {'','brewing:air_sub1','dye:green'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:air_add1"; recipe = { {'','bucket:bucket_water','dye:green'}, {'','vessels:glass_bottle','dye:green'}, {'','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:air_add2"; recipe = { {'','brewing:air_add1','dye:green'}, {'','',''}, {'','',''}, }; })
brewing.register_potioncraft{output = "brewing:air_add3", recipe = { {'brewing:magic_cross','',''}, {'','',''} } }
--minetest.register_craft({ output = "brewing:air_sub3"; recipe = { {'dye:green','brewing:air_sub2',''}, {'dye:green','',''}, {'dye:green','',''}, }; })
--minetest.register_craft({ output = "brewing:air_sub2"; recipe = { {'dye:green','brewing:air_sub1',''}, {'dye:green','',''}, {'dye:green','',''}, }; })
--minetest.register_craft({ output = "brewing:air_sub1"; recipe = { {'dye:green','bucket:bucket_water',''}, {'dye:green','vessels:glass_bottle',''}, {'dye:green','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:air_sub1"; recipe = { {'dye:green','brewing:air_add1',''}, {'dye:green','',''}, {'dye:green','',''}, }; })
--minetest.register_craft({ output = "brewing:air_add1"; recipe = { {'dye:green','brewing:air_add2',''}, {'dye:green','',''}, {'dye:green','',''}, }; })
--minetest.register_craft({ output = "brewing:air_add2"; recipe = { {'dye:green','brewing:air_add3',''}, {'dye:green','',''}, {'dye:green','',''}, }; })

--minetest.register_craft({ output = "brewing:ouair_sub2"; recipe = { {'','brewing:ouair_sub3','dye:brown'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:ouair_sub1"; recipe = { {'','brewing:ouair_sub2','dye:brown'}, {'','',''}, {'','',''}, }; }) 
--minetest.register_craft({ output = "brewing:ouair_add1"; recipe = { {'','brewing:ouair_sub1','dye:brown'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:ouair_add1"; recipe = { {'','bucket:bucket_water','dye:brown'}, {'','vessels:glass_bottle','dye:brown'}, {'','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:ouair_add2"; recipe = { {'','brewing:ouair_add1','dye:brown'}, {'','',''}, {'','',''}, }; })
brewing.register_potioncraft{output = "brewing:ouair_add3", recipe = { {'brewing:magic_rosewater','',''}, {'','',''} } }
--minetest.register_craft({ output = "brewing:ouair_add3"; recipe = { {'','brewing:ouair_add2','dye:brown'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:ouair_sub3"; recipe = { {'dye:brown','brewing:ouair_sub2',''}, {'dye:brown','',''}, {'dye:brown','',''}, }; })
--minetest.register_craft({ output = "brewing:ouair_sub2"; recipe = { {'dye:brown','brewing:ouair_sub1',''}, {'dye:brown','',''}, {'dye:brown','',''}, }; })
--minetest.register_craft({ output = "brewing:ouair_sub1"; recipe = { {'dye:brown','bucket:bucket_water',''}, {'dye:brown','vessels:glass_bottle',''}, {'dye:brown','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:ouair_sub1"; recipe = { {'dye:brown','brewing:ouair_add1',''}, {'dye:brown','',''}, {'dye:brown','',''}, }; })
--minetest.register_craft({ output = "brewing:ouair_add1"; recipe = { {'dye:brown','brewing:ouair_add2',''}, {'dye:brown','',''}, {'dye:brown','',''}, }; })
--minetest.register_craft({ output = "brewing:ouair_add2"; recipe = { {'dye:brown','brewing:ouair_add3',''}, {'dye:brown','',''}, {'dye:brown','',''}, }; })

--minetest.register_craft({ output = "brewing:health_sub2"; recipe = { {'','brewing:health_sub3','dye:red'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:health_sub1"; recipe = { {'','brewing:health_sub2','dye:red'}, {'','',''}, {'','',''}, }; }) 
brewing.register_potioncraft{output = "brewing:health_add1", recipe = { {'dye:red','default:apple',''}, {'','',''} } }
--minetest.register_craft({ output = "brewing:health_add1"; recipe = { {'','bucket:bucket_water','dye:red'}, {'','vessels:glass_bottle','dye:red'}, {'','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
brewing.register_potioncraft{output = "brewing:health_add2", recipe = { {'tnt:gunpowder','flowers:mushroom_brown',''}, {'','',''} } }
--minetest.register_craft({ output = "brewing:health_add3"; recipe = { {'brewing:magic_apple','',''}, {'','',''}, {ignitor_name,water_name,flask_name}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, };})
brewing.register_potioncraft{output = "brewing:health_add3", recipe = { {'brewing:magic_apple','',''}, {'','',''} } }
--minetest.register_craft({ output = "brewing:health_sub3"; recipe = { {'dye:red','brewing:health_sub2',''}, {'dye:red','',''}, {'dye:red','',''}, }; })
--minetest.register_craft({ output = "brewing:health_sub2"; recipe = { {'dye:red','brewing:health_sub1',''}, {'dye:red','',''}, {'dye:red','',''}, }; })
--minetest.register_craft({ output = "brewing:health_sub1"; recipe = { {'dye:red','bucket:bucket_water',''}, {'dye:red','vessels:glass_bottle',''}, {'dye:red','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:health_sub1"; recipe = { {'dye:red','brewing:health_add1',''}, {'dye:red','',''}, {'dye:red','',''}, }; })
--minetest.register_craft({ output = "brewing:health_add1"; recipe = { {'dye:red','brewing:health_add2',''}, {'dye:red','',''}, {'dye:red','',''}, }; })
--minetest.register_craft({ output = "brewing:health_add2"; recipe = { {'dye:red','brewing:health_add3',''}, {'dye:red','',''}, {'dye:red','',''}, }; })

--minetest.register_craft({ output = "brewing:ouhealth_sub2"; recipe = { {'','brewing:ouhealth_sub3','dye:blue'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:ouhealth_sub1"; recipe = { {'','brewing:ouhealth_sub2','dye:blue'}, {'','',''}, {'','',''}, }; }) 
--minetest.register_craft({ output = "brewing:ouhealth_add1"; recipe = { {'','brewing:ouhealth_sub1','dye:blue'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:ouhealth_add1"; recipe = { {'','bucket:bucket_water','dye:blue'}, {'','vessels:glass_bottle','dye:blue'}, {'','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:ouhealth_add2"; recipe = { {'','brewing:ouhealth_add1','dye:blue'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:ouhealth_add3"; recipe = { {'','brewing:ouhealth_add2','dye:blue'}, {'','',''}, {'','',''}, }; })
--minetest.register_craft({ output = "brewing:ouhealth_sub3"; recipe = { {'dye:blue','brewing:ouhealth_sub2',''}, {'dye:blue','',''}, {'dye:blue','',''}, }; })
--minetest.register_craft({ output = "brewing:ouhealth_sub2"; recipe = { {'dye:blue','brewing:ouhealth_sub1',''}, {'dye:blue','',''}, {'dye:blue','',''}, }; })
--minetest.register_craft({ output = "brewing:ouhealth_sub1"; recipe = { {'dye:blue','bucket:bucket_water',''}, {'dye:blue','vessels:glass_bottle',''}, {'dye:blue','',''}, }; replacements = { {'bucket:bucket_water','bucket:bucket_empty'}, }; })
--minetest.register_craft({ output = "brewing:ouhealth_sub1"; recipe = { {'dye:blue','brewing:ouhealth_add1',''}, {'dye:blue','',''}, {'dye:blue','',''}, }; })
--minetest.register_craft({ output = "brewing:ouhealth_add1"; recipe = { {'dye:blue','brewing:ouhealth_add2',''}, {'dye:blue','',''}, {'dye:blue','',''}, }; })
--minetest.register_craft({ output = "brewing:ouhealth_add2"; recipe = { {'dye:blue','brewing:ouhealth_add3',''}, {'dye:blue','',''}, {'dye:blue','',''}, }; })
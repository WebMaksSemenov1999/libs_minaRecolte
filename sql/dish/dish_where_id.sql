SELECT * FROM "dish"  
LEFT JOIN "categoires_dish" ON "dish"."id_categories" = "categoires_dish"."id"
LEFT JOIN "dish_tag" ON "dish_tag"."id_dish" = "dish"."id"
LEFT JOIN "tag" ON "dish_tag"."id_tag" = "tag"."id"
WHERE "dish"."id" = 2
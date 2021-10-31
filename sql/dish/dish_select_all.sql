SELECT * FROM "dish"  
LEFT JOIN "categoires_dish" ON "dish"."id_categories" = "categoires_dish"."id"
LEFT JOIN "dish_tag" ON "dish_tag"."id_dish" = "dish"."id"
LEFT JOIN "tag" ON "dish_tag"."id_tag" = "tag"."id"
WHERE "categoires_dish"."id" IN ('1', '2')
AND "dish"."name" LIKE '%чай%'
AND "dish"."id" IN (
    SELECT DISTINCT "dish"."id" FROM "dish"
        JOIN "dish_tag" ON ("dish_tag"."id_dish" = "dish"."id")
        WHERE "dish_tag"."id_tag" IN ('1')    
    )
ORDER BY "dish"."name", "dish"."price" DESC, "tag"."name"
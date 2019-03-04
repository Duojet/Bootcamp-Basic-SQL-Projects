USE [db_zooTest2]

/*DRILL 5:
Compose a SELECT statement that queries for the following information:

Retrieve all names within the species_name column using the alias "Species Name:" 
from the species table and their corresponding nutrition_type under the alias "Nutrition Type:" from the nutrition table.
*/

GO

SELECT
	species_name AS 'Species Name', tbl_nutrition.nutrition_type AS 'Nutrition Type'
	FROM tbl_species
	INNER JOIN tbl_nutrition on tbl_nutrition.nutrition_id = tbl_species.species_nutrition
;





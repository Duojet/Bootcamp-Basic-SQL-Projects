USE [db_zooTest2]

/*DRILL 4:
Compose a SELECT statement that queries for the following information:

Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table.
*/

GO


SELECT species_name FROM tbl_species WHERE species_nutrition BETWEEN 2202 AND 2206;


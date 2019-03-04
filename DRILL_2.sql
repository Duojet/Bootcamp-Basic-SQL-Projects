USE db_zooTest2
/*DRILL 2:
Compose a SELECT statement that queries for the following information:

 Retrieve all names from the species_name column that have a species_order value of 3.
 */

GO
SELECT species_name FROM tbl_species WHERE species_order LIKE 3 
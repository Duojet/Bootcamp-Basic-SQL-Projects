/*Compose a SELECT statement that queries for the following information:

From the specialist table, retrieve the first and last name and contact number of those 
that provide care for the penguins from the species table.

(margret nyguen	384-576-2899 care_specialist 1, species_care care_6)
*/

USE [db_zooTest2]

GO

/*SELECT * FROM tbl_specialist;
SELECT * FROM tbl_care;
SELECT * FROM tbl_species WHERE species_name = 'penguin';
*/

SELECT 
	tbl_species.species_name, tbl_specialist.specialist_fname, tbl_specialist.specialist_lname, tbl_specialist.specialist_contact
	FROM tbl_species
	INNER JOIN tbl_care ON tbl_care.care_id = tbl_species.species_care
	INNER JOIN tbl_specialist ON tbl_specialist.specialist_id = tbl_care.care_specialist 
	WHERE species_name = 'penguin'
;



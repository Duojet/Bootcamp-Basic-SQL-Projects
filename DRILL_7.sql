/*DRILL 7:
Creating your own tables: Build a select statement that queries for the following information:

Create a database with two tables. Assign a foreign key constraint on one table that shares related data with the primary key on the second table. 
Finally, create a statement that queries data from both tables.

If you need advice...How about a table with a first and last name column and a second table that has a phone number and address column?

When submitting DRILL 7 be sure to include the table creation code along with your INSERT statements and query.
*/

/*CREATE DATABASE db_Drill7;
*/

USE db_Drill7;

GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES tbl_client) DROP TABLE tbl_contact, tbl_client;

CREATE TABLE tbl_client (
	client_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	client_firstName VARCHAR(20) NOT NULL,
	client_lastName VARCHAR(20) NOT NULL,
);


INSERT INTO tbl_client
	(client_firstName, client_lastName)
	VALUES
	('andy', 'dwyer'),
	('bruce', 'springsteen'),
	('thom', 'york')
;

CREATE TABLE tbl_contact (
	contact_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	contact_client INT NOT NULL CONSTRAINT fk_client_id FOREIGN KEY REFERENCES tbl_client(client_id) ON UPDATE CASCADE ON DELETE CASCADE,
	contact_email VARCHAR(50) NOT NULL, 
	contact_phone VARCHAR(50) NOT NULL,
	contact_address VARCHAR(100) NOT NULL
);

INSERT INTO tbl_contact
	(contact_client, contact_email, contact_phone, contact_address)
	VALUES
	(1,'andy@mouserat.com','974-555-1212', '159 W. Greenleaf Ave. Pawnee, IN  55555'),
	(2,'theboss@springsteen.com', '564-546-7752', '1513 Warren St. Colts Neck, NJ  10152'),
	(3,'thommy@radiohead.com', '+44 7911 123456', '13 Road St. Los Angeles, CA  99532')
;

SELECT 
	client_id, client_firstName, client_lastName, tbl_contact.contact_email, tbl_contact.contact_phone, tbl_contact.contact_address
	FROM tbl_client
	INNER JOIN tbl_contact ON tbl_contact.contact_id = tbl_client.client_id
;


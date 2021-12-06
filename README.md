# Fintech Lender Database

A simple database is created on MySQL Workbench using forward engineering, in order to serve a hypothetical company lending money to small businesses. Fictional data was imported into it to run useful queries and test some useful stored procedures.

### System Flow
The flow of system shows the logic that the database will follow for the business:

The following is the ER diagram of the database created:

![alt text](https://github.com/marcelmazzanti/SQL-fintech-database/blob/563928dbc824d6b3f7172a4ec027d87acdb39645/ER%20Diagram%20fintech.png)

### Queries
Within the document "fintech queries", several tables are obtained from the database. Examples of cases when these queries could be useful are:

1)	Determining highest net worth clients to potentially target for personalized products or new offers (ordered from highest to lowest)
2)	Determining if any payments were made past the payment due date 
3)	Know how many times each company has paid late
4)	Determining what the most common industry taking out loans is to further target companies within that industry in the future
5)	Determining the most common reason for a loan, most common type of loan is and the average amount for that loan...

### Stored Procedures


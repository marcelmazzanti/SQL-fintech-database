# Fintech Lender Database

A simple database is created on MySQL Workbench using forward engineering, in order to serve a hypothetical company lending money to small businesses. Fictional data was imported into it to run useful queries and test some useful stored procedures.

## System Flow
The flow of system shows the logic that the database will follow for the business:

<img width="718" alt="Screenshot 2021-12-06 at 18 04 07" src="https://user-images.githubusercontent.com/77210085/144936847-88497e96-01a1-488c-9759-8d0b41ccc016.png">


The following is the ER diagram of the database created:

![alt text](https://github.com/marcelmazzanti/SQL-fintech-database/blob/563928dbc824d6b3f7172a4ec027d87acdb39645/ER%20Diagram%20fintech.png)

## Queries
Within the document "fintech queries", several tables are obtained from the database. Examples of cases when these queries could be useful are:

1)	Determining highest net worth clients to potentially target for personalized products or new offers (ordered from highest to lowest)
2)	Determining if any payments were made past the payment due date 
3)	Know how many times each company has paid late
4)	Determining what the most common industry taking out loans is to further target companies within that industry in the future
5)	Determining the most common reason for a loan, most common type of loan is and the average amount for that loan...

### Stored Procedures
Procedures are created for the lending business to facilitate the data retrieving and manipulation using selected input.

#### Outstanding Amount to Pay
This procedure takes as input the business id of a customer and creates an output that displays how much the selected business still has to pay for the loan (or loans) that it received from the lending company. If the amount already paid by the business is less than the total loan taken, the procedure will have as output the outstanding money that they have to pay, otherwise it will return “NONE OUTSTANDING”, meaning that the loan has been paid completely or also that the selected customer has not received a loan.

#### Declined Customers
This procedure does not have an input, but as the business gains more clients, this procedure will allow to flag customers that have their details recorded but where not accepted to receive a loan (hence, they do not have any contract). Calling this procedure updates every business status to “Declined” for those that do not have a contract with the borrower.

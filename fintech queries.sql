use fintechlenders;

/* THIS REFERS TO THE DECLINED CUSTOMER PROCEDURE
the following procedure uses a for loop to update the status column 
in the business details table to "Declined" whenever a customer has 
informations recorded but not a conctract with the lending business*/

-- calling the procedure to flag declined customers in the status column
call fintechlenders.declined_customers(); 
-- testing the procedure
select business_id, business_name, status
from business_details;

/* THIS REFERS TO THE OUTSTANDING AMOUNT PROCEDURE
the following procedure uses an if statement to check if a customer
still has outstanding balance to pay and if that is the case,
it returns the amount that is still missing*/

-- calling the procedure to return outstanding balance of customer
call lenders_db.outstanding_amt("B108", @out_pay);
-- testing the procedure to return output
select @out_pay as Outstanding_Loan_Amt;


call lenders_db.outstanding_amt("B106", @out_pay);
select @out_pay as Outstanding_Loan_Amt;

/* calling the procedure check customer's late payments */
call lenders_db.late_payments_procedure("B109");


/*this query determines if any payment was made past the due date 
and shows for each late payment the company name, id and payment method */
select b.business_id as Business_Id,
           b.business_name as Company_Name,
           t.due_date as Due_Date,
           t.payment_date as Payment_Date,
           t.payment_method as Payment_Method
from transactions t, business_details b
where Payment_Date > Due_Date
and b.business_id = t.business_id;


/*accordingly, this query allows to count how many times a company 
has paied late*/
select b.business_name as Company_Name,
           count(b.business_id) as Late_Payment_Count
from transactions t, business_details b
where t.Payment_Date > t.Due_Date
and b.business_id = t.business_id
group by Company_Name
order by Late_Payment_Count desc;


/*the following query shows the active clients that are worth the most*/
select business_id as Business_Id, 
	   business_name as Company_Name, 
	   business_income as Net_Worth
from business_details
where loan_status = "Accepted"
order by Net_Worth desc
limit 5;


/*the following query shows the actual age (years of existence)
of each company applying for a loan*/
select business_id as Business_Id,  
            business_name as Company_Name,
            round(datediff(date(now()), business_startdt)/365,2) as           
            Company_Age
from business_details
order by Company_Age desc;


/*this query determines the most common type of loan and the average 
amount that is lent for each type*/
select loan_type as Loan_Type, 
            count(Product_id) as Num_of_Issued_Loans, 
            round(avg(loan_amt),2) as Avg_Amount
from products p, deal_terms d
where d.product_id = p.loan_id
group by Loan_Type
order by Num_of_Issued_Loans desc;


/*this query evaluates employees based on how many loans they have 
issued and the total amount of money they lent, the average interest 
rate applied by each employee is also included*/
select b.salesrep_id, 
           concat_ws(" ", first_name, last_name) as Employee_Name, 
           count(b.salesrep_id) as Num_of_Loans_Sold,
           sum(d.loan_amt) as Total_Sales,
           avg(ir.rate_applied) as Average_Rate_Applied,
           hire_date as Date_Hired
from business_details b, deal_terms d, employees e, 
	 products p, interest_rate ir
where d.business_id = b.business_id
and b.salesrep_id = e.employee_id
and d.product_id = p.loan_id
and p.rate_id = ir.rate_id
and loan_status = "Accepted"
group by salesrep_id
order by Total_Sales desc;


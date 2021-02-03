CREATE DEFINER=`root`@`localhost` PROCEDURE `outstanding_amt`(in in_business_id varchar(5), out out_pay varchar(20))
BEGIN
  declare tot_loan float(10,5);
  declare paid_check varchar(50);
 
  select loan_amt 
  	into tot_loan
  from deal_terms
  where business_id = in_business_id;
 
  select sum(payed_amt)
 	 into paid_check
  from transactions
  where business_id = in_business_id;
 
     if paid_check < tot_loan
   	then set out_pay = round(tot_loan - paid_check, 2);
 
     else 
   	set out_pay = "NONE OUTSTANDING";
   
 end if;
 
END
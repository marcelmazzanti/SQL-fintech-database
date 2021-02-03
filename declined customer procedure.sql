CREATE DEFINER=`root`@`localhost` PROCEDURE `declined_customers`()
BEGIN

declare stat_check varchar(45);

declare cur cursor for
 	select b.business_id
 	from business_details b  
 	left join deal_terms d
 	on b.business_id = d.business_id
 	where d.contract_id is null;

 open cur;
 
 stat_up: loop
	fetch cur into stat_check;
    
    	update business_details
    	set loan_status = "Declined"
    	where business_id = stat_check;
    
  end loop stat_up;

END
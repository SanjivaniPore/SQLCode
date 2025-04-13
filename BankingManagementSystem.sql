---------------------------Bank Management System--------------------------------------

CREATE TABLE Banking
(
    Customer_Id INT,
    Account_no bigint PRIMARY KEY IDENTITY(12345678901, 1),
    Balance INT
);

select * from Banking;

insert into Banking(Customer_Id,Balance)values(110,1500);

drop table Banking;

Alter Table Banking ADD debit_Balance int;
Alter Table Banking ADD Credit_Balance int;
--------------------------------------------------------------------------------------------------------------------------------
create procedure SBI_Banking
@from AS int,@To AS int,@a AS int 
AS
BEGIN
update Banking set Balance=(Balance-@a) where Customer_Id=@from;

update Banking set Balance=(Balance+@a)where Customer_Id=@To;

update Banking set Debit_Balance=@a where Customer_Id=@from;

update Banking set credit_Balance=@a where Customer_Id=@To;
END;

drop procedure SBI_Banking;

EXEC SBI_Banking @from=101,@To=103,@a=50;
-----------------------------------------------------------------------------------------------------------------------------------------------
create procedure insufficient_fund
@from AS int,@To AS int,@a AS int,@Account_balance AS int
 AS
 BEGIN
 
 If(@Account_Balance>=@a)
 Begin 
       Begin Transaction;
 begin try
         update Banking set Balance=(Balance-@a) where Customer_Id=@from;

         update Banking set Balance=(Balance+@a)where Customer_Id=@To;

         update Banking set Debit_Balance=@a where Customer_Id=@from;

         update Banking set credit_Balance=@a where Customer_Id=@To;

		 commit Transaction;  

         select ' Transaction successfully';
 End try

 Begin Catch
     If @@TRANCOUNT > 0
               Rollback transaction;
		  throw;
 End Catch;
 End;
 Else
 Begin
  select' Balance is Insufficient';
 End;
 END;
 -------------------------------------------------------------------------------------------------------------------------------------------------
 create procedure Invalid_Account
  @To As bigint, @account_id bigint
AS
BEGIN
    IF(@To= @account_id)
    BEGIN
        PRINT '✅ Account exists. Proceed with transaction.'
    END
    ELSE
    BEGIN
        PRINT '❌ Invalid account code. Please check and try again.'
    END
END

EXEC Invalid_Account 12345678901,1234567890;

drop procedure Invalid_Account;
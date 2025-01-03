show databases;
create database bank_075;

use  bank_075;



insert into Branch values("SBI_Chamrajpet","Bangalore",50000);
insert into Branch values("SBI_ResidencyRoad","Bangalore",10000);
insert into Branch values("SBI_ShivajiRoad","Bombay",20000);
insert into Branch values("SBI_ParlimentRoad","Delhi",10000);
insert into Branch values("SBI_Jantarmantar","Delhi",20000);

select * FROM Branch;


insert into BankAccount values(1,"SBI_Chamrajpet",2000);
insert into BankAccount values(2,"SBI_ResidencyRoad",5000);
insert into BankAccount values(6,"SBI_ResidencyRoad",5000);
insert into BankAccount values(7,"SBI_ResidencyRoad",5000);

insert into BankAccount values(3,"SBI_ShivajiRoad",6000);
insert into BankAccount values(4,"SBI_ParlimentRoad",9000);
insert into BankAccount values(5,"SBI_Jantarmantar",8000);
select * FROM BankAccount;


insert into BankCustomer value("Avinash","Bull_Temple_Road","Bangalore");
insert into BankCustomer value("Dinesh","Bannergatta_Road","Bangalore");
insert into BankCustomer value("Mohan","NationalCollege_Road","Bangalore");
insert into BankCustomer value("Nikil","Akbar_Road","Delhi");
insert into BankCustomer value("Ravi","PritviRaj_Road","Delhi");
insert into BankCustomer value("Raja","Raj_Road","Delhi");

select * FROM BankCustomer;


insert into Depositer values("Avinash",1);
insert into Depositer values("Dinesh",2);
insert into Depositer values("Nikil",4);
insert into Depositer values("Ravi",5);
insert into Depositer values("Mohan",3);
insert into Depositer values("Raja",6);
insert into Depositer values("Raja",7);

select * FROM Depositer;


insert into Loan values(1,"SBI_Chamrajpet",1000);
insert into Loan values(2,"SBI_ResidencyRoad",2000);
insert into Loan values(3,"SBI_ShivajiRoad",3000);
insert into Loan values(4,"SBI_ParlimentRoad",4000);
insert into Loan values(5,"SBI_Jantarmantar",5000);
select * FROM Loan;

select branch_name, assets as "assets in lakhs" from Branch;

select Depositer.customer_name from Depositer,bankaccount where BankAccount.branch_name="SBI_ResidencyRoad" and BankAccount.accno=Depositer.accno
group by customer_name
having count(*)>=1;

select * from Depositer;
select * from BankAccount;

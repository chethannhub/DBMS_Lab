select branch_name, assets as "assets in lakhs" from Branch;  
![Screenshot 2024-10-18 124955](https://github.com/user-attachments/assets/4f481cc1-0844-4234-9fa4-fea531234c21) 




select Depositer.customer_name from Depositer,bankaccount where BankAccount.branch_name="SBI_ResidencyRoad" and BankAccount.accno=Depositer.accno
group by customer_name
having count(*)>1;  
![Screenshot 2024-10-18 125015](https://github.com/user-attachments/assets/33073d15-7f24-4913-866e-ead9224d2813)

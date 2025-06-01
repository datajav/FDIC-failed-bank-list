CREATE TABLE BANKS( 
    BANK_ID INT NOT NULL AUTO_INCREMENT, 
    BANK_NAME VARCHAR(100),
    CITY VARCHAR(255),
    STATE VARCHAR(100),
    CERTNUM INT UNIQUE,
    PRIMARY KEY (BANK_ID)
);

CREATE TABLE FAILURES( 
	failure_id INT not null auto_increment, 
    bank_id INT, 
    closing_date DATE,
    fund decimal (15,2), 
    acquired_institution varchar (225), 
    primary key (failure_id), 
    foreign key (bank_id) references banks(BANK_ID)
    );
    
Create Table Acquiring_institutions(
	acquiring_id INT NOT NUll AUTO_INCREMENT, 
    institution_name VARCHAR (255), 
    primary key (acquiring_id) 
    ); 
    
create table Failure_Acquistion ( 
	mapping_id INT unique auto_increment,
    failure_id INT, 
    Acquiring_id INT, 
    primary key (mapping_id), 
    foreign key (failure_id) references Failures(failure_id), 
    foreign key (acquiring_id) references Acquiring_institutions(acquiring_id)
    );

insert into Banks (Bank_Name)
select `ï»¿Bank NameÂ` 
from importdata;

Select Bank_Name from Banks;









    
    


    


    
    

    
	
    
    

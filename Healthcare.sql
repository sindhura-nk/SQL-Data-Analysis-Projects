-- Healthcare Dataset

-- create a new database to store the dataset 
create database healthcare;
use healthcare;
-- Import the dataset to above database.
show tables;
-- Look at the contents of the table data
select * from healthcare_dataset;

-- What are the different Admission Types provided by hospitals 
select distinct(Admissiontype) from healthcare_dataset;

-- What are the different Medical conditions observed(unique medical condition)
select distinct(Medicalcondition),count(Medicalcondition) as No_of_people_have from healthcare_dataset group by Medicalcondition;

-- What are the different medical conditions based on blood group
select distinct(medicalcondition),bloodtype,count(medicalcondition) as total from healthcare_dataset
group by bloodtype,medicalcondition
order by bloodtype asc, total desc;

-- What are the different medical conditions based on gender
select distinct(medicalcondition),gender,count(medicalcondition) as total from healthcare_dataset
group by gender,medicalcondition
order by gender,total desc;

-- What are the different medical conditions based on age group
select medicalcondition,age,count(medicalcondition) as numberofcases from healthcare_dataset
where medicalcondition='cancer'
group by  medicalcondition,age 
order by age desc,numberofcases desc; 

select medicalcondition,age,count(medicalcondition) as numberofcases from healthcare_dataset
where medicalcondition='obesity'
group by  medicalcondition,age 
order by age desc,numberofcases desc; 

select medicalcondition,age,count(medicalcondition) as numberofcases from healthcare_dataset
where medicalcondition='arthritis'
group by  medicalcondition,age 
order by age desc,numberofcases desc; 

select medicalcondition,age,count(medicalcondition) as numberofcases from healthcare_dataset
where medicalcondition='asthma'
group by  medicalcondition,age 
order by age desc,numberofcases desc; 

select medicalcondition,age,count(medicalcondition) as numberofcases from healthcare_dataset
where medicalcondition='diabetes'
group by  medicalcondition,age 
order by age desc,numberofcases desc; 

select medicalcondition,age,count(medicalcondition) as numberofcases from healthcare_dataset
where medicalcondition='hypertension'
group by  medicalcondition,age 
order by age desc,numberofcases desc; 

-- What are the different medical conditions based on age group and bloodtype 
select medicalcondition,age,bloodtype,count(medicalcondition) as numberofcases from healthcare_dataset
group by  medicalcondition,age,bloodtype
order by age desc,bloodtype,numberofcases desc;

-- What are the different medical conditions based on age group and gender 
select medicalcondition,age,gender,count(medicalcondition) as numberofcases from healthcare_dataset
group by  medicalcondition,age,gender
order by age desc,gender,numberofcases desc;

-- On an average, how long do patients stay in the hospital?
select round(avg(datediff(dischargedate,dateofadmission))) as avgduration from healthcare_dataset;

-- who are the insurance providers
select distinct(insuranceprovider) from healthcare_dataset;

-- who is the most preferred insurance providers
select insuranceprovider,count(insuranceprovider) as mostpreferredInsuranceProvider from healthcare_dataset 
group by insuranceprovider
order by mostpreferredInsuranceProvider desc limit 1;

select datediff(dischargedate,dateofadmission) from healthcare_dataset;

-- number of days patients are admitted
select name,hospital, datediff(dischargedate,dateofadmission) as days from healthcare_dataset
order by days desc;

-- details of doctors who treated patients, admission type, test results, medication provided
select doctor,admissiontype,testresults,medication from healthcare_dataset;

-- number of inconclusive test results
select count(testresults) from healthcare_dataset
where testresults='inconclusive';

-- list of doctors who gave inconclusive test results
select doctor,count(testresults) as testresult from healthcare_dataset
where testresults='inconclusive'
group by doctor
order by testresult desc;

-- number of testresult cases
select distinct(testresults),count(testresults) as resultcount from healthcare_dataset
group by testresults
order by resultcount desc;

-- number of abnormal cases
select count(testresults) from healthcare_dataset
where testresults='abnormal';

-- details of hospital , insuranceprovider, doctor, medicalcondition, admissiontype,testresults,billing amount, dateofadmission,discharge date
select hospital,insuranceprovider, doctor, medicalcondition, admissiontype,testresults,
round(billingamount), dateofadmission,dischargedate from healthcare_dataset;

-- billing amount based on admissiontype,hostpital, medical condition, number of days of stay
select billingamount,admissiontype,hospital, medicalcondition,
datediff(dischargedate,dateofadmission) from healthcare_dataset;

-- billing amount based on doctor, hostpital,insuranceprovider, medical condition, number of days of stay 
select doctor,hospital,insuranceprovider, medicalcondition,round(billingamount) as BillingAmount,
datediff(dischargedate,dateofadmission) as numberofdays from healthcare_dataset
order by numberofdays desc;

-- billing based on hospital,medicalcondition,testresults
select hospital,medicalcondition,testresults,round(billingamount) as BillingAmount from healthcare_dataset;

select distinct(hospital),count(hospital) as total from healthcare_dataset
group by hospital
order by total desc;

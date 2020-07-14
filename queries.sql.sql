/*querie 1 that selects all addresses from Vienna*/
SELECT * FROM `address` WHERE a_city='Vienna';

/*querie 2 that selects three tables together*/
SELECT package.pa_status, sender.resident_city, receiver.re_first_name
FROM package
INNER JOIN sender 
ON package.fk_sender_id = sender.sender_id
inner join receiver
on receiver.re_id = package.fk_re_id

/*querie 3 that selects three tables together*/
SELECT employee.em_first_name, delivered.de_id, mds.mds_id
FROM employee
INNER JOIN mds 
ON employee.fk_mds_id = mds.mds_id
inner join delivered
on employee.em_id = delivered.fk_em_id;

/*querie 4 that selects four tables together*/
SELECT receiver.re_first_name, package.pa_status, sender.resident_city,address.a_postalcode
FROM receiver 
INNER JOIN package 
ON receiver.fk_pa_id = package.pa_id 
LEFT join address
on receiver.fk_a_id = address.a_id 
RIGHT JOIN sender
ON receiver.fk_a_id = sender.fk_a_id

/*querie 5 that selects all processes from the id number '1'*/
SELECT * FROM `process` WHERE pr_id='1'

/*querie 6 that selects all addresses where the id number bigger than 2*/
SELECT * FROM address WHERE a_id>2

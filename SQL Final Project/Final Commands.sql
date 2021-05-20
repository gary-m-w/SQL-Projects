/*Create a list of applications for a specific job that includes the applicant’s ID, first name, last, name and contact number*/
SELECT UsersID, user_fname, user_lname, applicant_contact_number, jobID, job_description FROM `job postings` JOIN `additional information` ON `job postings`.JobID = `additional information`.`job postings_jobID` 
JOIN applicants ON `additional information`.`Applicants_Users_UsersID` = applicants.Users_UsersID JOIN users ON applicants.users_usersID = users.usersID 
WHERE jobID = 4;

/*Create a list of applications that were submitted after 3/14/2020.*/
SELECT * FROM job_search.`additional information` WHERE `date_applied` > '2020-03-14'; 

/*Create a list of jobs, including job ID and job title, that are currently open and in the marketing department.*/
SELECT JobID, job_description FROM `job postings` WHERE closing_date > curdate() AND Departments_departmentID = 3;  

/*Create a list of jobs that an applicant has applied for, listing job ID, Job title, and closing date.*/
SELECT jobID, job_description, closing_date, user_fname, user_lname FROM `job postings` JOIN `additional information` ON `job postings`.JobID = `additional information`.`job postings_jobID` 
JOIN applicants ON `additional information`.`Applicants_Users_UsersID` = applicants.Users_UsersID JOIN users ON applicants.users_usersID = users.usersID 
WHERE usersID = 2;

/*Create a list of all open jobs with jobID, job title, closing date, and manager assigned to review.*/
SELECT jobID, job_description, closing_date, user_fname, user_lname FROM `job postings` JOIN departments ON `job postings`.departments_departmentID = departments.departmentID 
JOIN managers ON departments.managers_users_usersID = managers.Users_UsersID JOIN users ON managers.users_usersID = users.usersID WHERE curdate() < closing_date; 
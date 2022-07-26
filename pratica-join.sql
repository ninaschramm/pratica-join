-- Questão 1:

SELECT users.id as id, users.name as name, cities.name as city from users
JOIN cities
ON users."cityId" = cities.id
WHERE cities.name = 'Rio de Janeiro';

-- Questão 2:

SELECT testimonials.id as id, writer.name as writer, recipient.name as recipient, testimonials.message
FROM testimonials
JOIN users as writer ON writer.id=testimonials."writerId"
JOIN users as recipient ON recipient.id=testimonials."recipientId";

-- Questão 3:

SELECT users.id as id, users.name, courses.name as course, schools.name as school, educations."endDate"
FROM educations
JOIN users ON users.id=educations."userId"
JOIN courses ON courses.id=educations."courseId"
JOIN schools ON schools.id=educations."schoolId"
WHERE users.id = 30 and status = 'finished';

-- Questão 4:

SELECT users.id as id, users.name, roles.name as role, companies.name as company, experiences."startDate"
FROM experiences
JOIN users ON users.id=experiences."userId"
JOIN roles ON roles.id=experiences."roleId"
JOIN companies ON companies.id=experiences."companyId"
WHERE users.id = 50 and experiences."endDate" is null;

-- Questão bônus:

SELECT schools.id as id, schools.name as school, courses.name as course, companies.name as company, roles.name as role from applicants
JOIN jobs
ON jobs.id = applicants."jobId"
JOIN roles
ON roles.id = jobs."roleId"
JOIN companies
ON jobs."companyId" = companies.id
JOIN users
ON users.id = applicants."userId"
JOIN educations
ON users.id = educations."userId"
JOIN schools
ON schools.id = educations."schoolId"
JOIN courses
ON courses.id = educations."courseId"
WHERE roles.name = 'Software Engineer' and jobs.active is true and companies.id = 10;
